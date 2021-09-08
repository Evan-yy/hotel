package com;

import Dao.IEmployeesDao;
import Dao.RoomDao;
import domain.employees;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

public class EmployeeServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          InputStream in;
         SqlSession session;
         IEmployeesDao employeeDao;
     //   RoomDao roomDao;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        /**
         * 验证登录部分
         */
        int id=Integer.parseInt(request.getParameter("u"));

        String psw = request.getParameter("p");



        in = Resources.getResourceAsStream("SqlMapconfig.xml");
        //2.创建SqlSessionFactory工厂
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);
        //3.使用工厂生产Session对象
        session = factory.openSession();
        //4.使用SqlSession创建Dao接口的代理对象

        employeeDao = session.getMapper(IEmployeesDao.class);
        employees employee=new employees();
        employee.setLid(id);
        employee.setPwd(psw);
        employee=employeeDao.find(employee);
       // employee=employeeDao.findID(id);
        HttpSession Session=request.getSession();
        if(employee!=null)
        {
            Session.setAttribute("Employee",employee);
            request.getRequestDispatcher("InitServlet?p=0").forward(request,response);

            session.close();
            in.close();

        }else
        {
            out.println("<script language='javascript'>alert('用户名或密码输入错误！');window.location.href='jsp/login1.jsp';</script>");
        }




        /**
        List<employees> Employees = employeeDao.findAll();
        for(employees Eemployee :Employees ){
            out.println(Eemployee);
        }*/




       // UserDao userDao = new UserDao();
        //User user = userDao.find(username, psw);

        //HttpSession session = request.getSession();
        //session.setAttribute("username", username);


      //  out.println("Hello Servlet!");

    }
}
