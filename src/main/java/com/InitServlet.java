package com;

import Dao.CustomersDao;
import Dao.IEmployeesDao;
import Dao.ListsDao;
import Dao.RoomDao;
import domain.Customers;
import domain.Lists;
import domain.Room;
import domain.employees;
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

public class InitServlet extends HttpServlet {

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
        IEmployeesDao employeesDao;
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
        employeesDao = session.getMapper(IEmployeesDao.class);

        /**
         * 房间初始化
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
 * 员工初始化
 */
        List<employees> employees = employeesDao.findAll();
        Session.setAttribute("employees", employees);


        /**
         * 订单初始化
         */
        double Alltotal=0;
        List<Lists> lists = ListDao.findAll();
        for(Lists list : lists){
            Alltotal=Alltotal+list.getTotal();

        }
        Session.setAttribute("Alltotal",Alltotal);
        Session.setAttribute("lists", lists);

        List<Customers> customers = CustomerDao.findAll();

        Session.setAttribute("customers", customers);

        Session.setAttribute("rooms", rooms);
        session.close();
        in.close();

        int id = Integer.parseInt(request.getParameter("p"));
        if(id==0) {
            response.sendRedirect("jsp/Home.jsp");
        }else
        {
            response.sendRedirect("jsp/MHome.jsp");
        }

    }

    }
