package com;

import Dao.ListsDao;
import domain.Lists;
import Dao.RoomDao;
import domain.Room;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

public class ListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream in;
        SqlSession session;
        ListsDao listsDao;
        RoomDao roomDao;
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession Session = request.getSession();

        in = Resources.getResourceAsStream("SqlMapconfig.xml");
        //2.创建SqlSessionFactory工厂
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);
        //3.使用工厂生产Session对象
        session = factory.openSession();
        //4.使用SqlSession创建Dao接口的代理对象
        listsDao = session.getMapper(ListsDao.class);
        roomDao = session.getMapper(RoomDao.class);


        /**
         * 生成订单模块
         */


//        int lid=1002;
//        int roomid=102;
//        Date date=new Date();
//
//        Timestamp timestamp=new Timestamp(date.getTime());
//        Lists list=new Lists();
//        list.setLid(lid);
//        list.setRoomid(roomid);
//        list.setCustomerID("15");
//        list.setCustomerName("陈");
//        list.setRoomType("大床房");
//        list.setRoomprice(188);
//        list.setState("进行中");
//        list.setDay(2);
//        list.setLivetime(timestamp);
//        list.setOuttime(null);
//        list.setTotal(198.0);

        /**
         * 生成订单模块
         */

        try {
     //  获取Session域的list1变量
     Lists list1 = (Lists) Session.getAttribute("List1");
     if(list1!=null) {
         //  获取数据库中订单表最后一条记录的list_ID
         Lists list2 = listsDao.last();
         int lastID = list2.getLid();

         //获取ID为list1.getRoomid()的房间的相关信息
         Room room = new Room();
         room.setRoomid(list1.getRoomid());
         room = roomDao.find2(room);
         //      session.commit();

         //建立新订单，增加到数据库中
         Lists list = new Lists();
         Date date = new Date();
         Timestamp timestamp = new Timestamp(date.getTime());

         list.setLid(lastID + 1);
         list.setRoomid(room.getRoomid());
         list.setCustomerID(list1.getCustomerID());
         list.setCustomerName(list1.getCustomerName());
         list.setRoomType(room.getRoomtype());
         list.setRoomprice(room.getRoomprice());
         list.setState("进行中");
         list.setDay(list1.getDay());
         list.setLivetime(timestamp);
         list.setOuttime(null);
         list.setTotal(list1.getDay() * room.getRoomprice());

         listsDao.SaveList(list);
         session.commit();

         out.println("插入成功");
         Session.removeAttribute("List1");
         Session.invalidate();
         session.close();
         in.close();
         request.getRequestDispatcher("/GetRoomServlet").forward(request, response);

     }

 }catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }


//        /**
//         * 完成订单模块
//         */
//
//        try{
//            int outRoomid;
//            outRoomid = Integer.parseInt(Session.getAttribute("OutRoomid").toString());
//            if(outRoomid>0)
//            {
//
//             Lists list=new Lists();
//             list.setRoomid(outRoomid);
//             list.setState("进行中");
//            Lists list1= listsDao.findList(list);
//            Lists nlist=new Lists();
//            nlist.setLid(list1.getLid());
//            nlist.setState("已完成");
//            listsDao.updateList(nlist);
//                session.commit();
//                out.println("更新成功");
//               Session.removeAttribute("OutRoomid");
//                Session.invalidate();
//                session.close();
//                in.close();
//
//                request.getRequestDispatcher("/GetRoomServlet").forward(request, response);
//
//            }
//
//        }catch (Exception e) {
//            // TODO Auto-generated catch block
//            System.out.println(e);
//        }












    }
}
