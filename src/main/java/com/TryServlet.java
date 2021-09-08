package com;

import Dao.ListsDao;
import Dao.RoomDao;
import domain.Lists;
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

public class TryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        InputStream in;
        SqlSession session;
        ListsDao listsDao;
        RoomDao roomDao;


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


        int outRoomid;
        outRoomid = Integer.parseInt(Session.getAttribute("OutRoomid").toString());
        if(outRoomid>0) {

            Lists list = new Lists();
            list.setRoomid(outRoomid);
            list.setState("进行中");
            Lists list1 = listsDao.findList(list);
            Lists nlist = new Lists();
            nlist.setLid(list1.getLid());
            nlist.setState("已完成");

            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            nlist.setOuttime(timestamp);
            listsDao.updateList(nlist);
            session.commit();
            out.println("更新成功");
            //     Session.removeAttribute("OutRoomid");
            request.getSession().removeAttribute("OutRoomid");

        }


        session.close();
        in.close();
        request.getRequestDispatcher("/GetRoomServlet").forward(request, response);


//        String name =request.getParameter("guestname");
//        String ID = request.getParameter("guestID");
//        String roomID=request.getParameter("roomID");
//
//        if(roomID!=null)
//        {
//            out.println("房间号："+roomID);
//        }
//        else
//        {
//            out.println("<script language='javascript'>alert('用户名或密码输入错误！');</script>");
//        }
//
//        if(name!=null)
//            out.println(name+" 号码："+ID);
//        else
//        {
//            out.println("<script language='javascript'>alert('用户名或密码输入错误！');</script>");
//        }

    }
     }
