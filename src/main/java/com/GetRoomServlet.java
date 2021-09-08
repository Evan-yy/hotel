package com;


import Dao.CustomersDao;
import Dao.ListsDao;
import Dao.RoomDao;
import domain.Customers;
import domain.Room;
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
import java.util.List;

public class GetRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession Session = request.getSession();

        InputStream in;
        SqlSession session;
        RoomDao roomDao;
        ListsDao ListDao;
        CustomersDao CustomerDao;
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        in = Resources.getResourceAsStream("SqlMapconfig.xml");
        //2.创建SqlSessionFactory工厂
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);
        //3.使用工厂生产Session对象
        session = factory.openSession();
        //4.使用SqlSession创建Dao接口的代理对象
        roomDao = session.getMapper(RoomDao.class);
        ListDao = session.getMapper(ListsDao.class);
        CustomerDao = session.getMapper(CustomersDao.class);

        /**
         * 入住业务处理
         */
        String name = request.getParameter("guestname");
        String ID = request.getParameter("guestID");
        String roomID = request.getParameter("roomID");
        String Day = request.getParameter("guestDay");

        try {
            if (roomID != null) {

                int roomID2 = Integer.parseInt(roomID);
                Room room = new Room();
                room.setRoomid(roomID2);
                room = roomDao.find2(room);
                if (room != null)
                    {
                    room.setRoomstate("入住中");
                    room.setRoomguestname(name);
                    room.setRoomguestid(ID);
                    if (Day != null) {
                        int day = Integer.parseInt(Day);
                        room.setGuestday(day);

                    roomDao.SaveRoom(room);
                    roomDao.updateRoom(room);
                    session.commit();
                    out.println("<script language='javascript'>alert('入住成功！');</script>");
                    Lists list=new Lists();
                    list.setRoomid(roomID2);
                    list.setDay(day);
                    list.setCustomerName(name);
                    list.setCustomerID(ID);
                        Session.setAttribute("List1", list);

                       request.getRequestDispatcher("/ListServlet").forward(request, response);
                        return;

                    }
                }
            }
            else {
                out.println("<script language='javascript'>alert('未能获取信息！');</script>");
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }


        /**
         * 预定入住业务处理
         */
        String name2 = request.getParameter("reservename");
        String ID2 = request.getParameter("reserveID");
        String roomID2 = request.getParameter("roomID2");
        String Day2 = request.getParameter("reserveDay");

        try {
            if (roomID2 != null) {
                System.out.println(roomID2);


                int roomID3 = Integer.parseInt(roomID2);
                Room room2 = new Room();
                room2.setRoomid(roomID3);
                room2 = roomDao.find2(room2);
                if (room2 != null)
                {
                    room2.setRoomstate("已预订");
                    room2.setRoomguestname(name2);
                    room2.setRoomguestid(ID2);
                    if (Day2 != null) {
                        int day2 = Integer.parseInt(Day2);
                        room2.setGuestday(day2);
                    }
                    roomDao.SaveRoom(room2);
                    roomDao.updateRoom(room2);
                    session.commit();

                }
            }
            else
            {
                out.println("<script language='javascript'>alert('未能获取信息！');</script>");
            }
        }catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }


        /**
         * 续住业务处理
         */

        String roomID3 = request.getParameter("roomID3");
        String Day3 = request.getParameter("addDay");

        try {
            if (roomID3 != null) {
                System.out.println(Day3);

                int roomID4 = Integer.parseInt(roomID3);
                int Day4= Integer.parseInt(Day3);
                Room room3 = new Room();
                room3.setRoomid(roomID4);
                room3 = roomDao.find3(room3);
                if (room3 != null)
                {
                    int day=room3.getGuestday();
                    int nday=day+Day4;
                    System.out.println(nday);
                    room3.setGuestday(nday);
                    roomDao.updateRoom2(room3);
                    session.commit();


                    out.println("<script language='javascript'>alert('入住成功！');</script>");

                }
            }
            else
            {
                out.println("<script language='javascript'>alert('未能获取信息！');</script>");
            }
        }catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }


        /**
         * 退房业务处理
         */

        String roomID4 = request.getParameter("roomID4");

        try {
            if (roomID4 != null) {
                int roomID5 = Integer.parseInt(roomID4);
                Room room3 = new Room();
                room3.setRoomid(roomID5);
                room3 = roomDao.find2(room3);
                if (room3 != null)
                {
                    room3.setRoomstate("空闲中");
                    roomDao.updateRoom(room3);
                    roomDao.deleteRoom2(room3);
                    session.commit();

                    out.println("<script language='javascript'>alert('退房成功！');</script>");

                   //完成订单
                    Session.setAttribute("OutRoomid", roomID5);

                   request.getRequestDispatcher("/TryServlet").forward(request, response);
                    return;

                }
            }
            else
            {
                out.println("<script language='javascript'>alert('未能获取信息！');</script>");
            }
        }catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }


        /**
         * 取消预订业务处理
         */

        String roomID5 = request.getParameter("roomID5");

        try {
            if (roomID5 != null) {


                int roomID6 = Integer.parseInt(roomID5);
                Room room3 = new Room();
                room3.setRoomid(roomID6);
                room3 = roomDao.find2(room3);
                if (room3 != null)
                {

                    room3.setRoomstate("空闲中");
                    roomDao.updateRoom(room3);
                    roomDao.deleteRoom2(room3);
                    session.commit();



                    out.println("<script language='javascript'>alert('取消预订成功！');</script>");

                }
            }
            else
            {
                out.println("<script language='javascript'>alert('未能获取信息！');</script>");
            }
        }catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }


        /**
         * 初始化页面
         */
        List<Room> rooms = roomDao.findAll();
        Room room2 = new Room();

        for (Room room : rooms) {
            if (room.getRoomstate().equals("入住中")) ;
            {
                room2 = roomDao.find(room);
                if (room2 != null) {
                    if (room2.getRoomguestname() != null)
                        room.setRoomguestname(room2.getRoomguestname());
                    room.setRoomguestid(room2.getRoomguestid());
                    room.setGuestday(room2.getGuestday());

                }
            }
            if (room.getRoomstate().equals("已预订")) ;
            {
                room2 = roomDao.find(room);
                if (room2 != null) {
                    if (room2.getRoomguestname() != null)
                        room.setRoomguestname(room2.getRoomguestname());
                    room.setRoomguestid(room2.getRoomguestid());
                    room.setGuestday(room2.getGuestday());

                }
            }
        }
        /**
         * 订单初始化
         */
        List<Lists> lists = ListDao.findAll();

        Session.setAttribute("lists", lists);

        List<Customers> customers = CustomerDao.findAll();

        Session.setAttribute("customers", customers);


        Session.setAttribute("rooms", rooms);
        session.close();
        in.close();
        response.sendRedirect("jsp/Home.jsp");





        /**
         Room room=new Room();
         room.setRoomid(101);
         room=roomDao.find(room);
         out.println("搜索如下:");
         if(room!=null)
         { out.println(room.getRoomid());
         out.println(room.getRoomstate());
         }
         else
         { out.println("查询不到");}
         **/

    }
    }