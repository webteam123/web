package com.yxq.action;

import com.mysql.cj.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "addCon")
public class addCon extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        Statement statement=null;
        ResultSet set=null;
        int i=0;
        try {
            Driver driver = new Driver();
            //DriverManager.registerDriver(driver);由于此方法注册两次驱动所以一般不用
            Class.forName("com.mysql.cj.jdbc.Driver");//一般使用此方法注册驱动
            String url = "jdbc:mysql://localhost:3306/db_bbs?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
            String user = "root";
            String pass = "root";
            connection = DriverManager.getConnection(url, "root", "root");
            statement = connection.createStatement();
            String p=request.getParameter("bbsId");
            String p1=request.getParameter("bbsAnswerId");
            String p2=request.getParameter("addjf");
            int i2 =Integer.parseInt(p2);
            String sq="update tb_jf set user_jf=user_jf+"+i2+" where id="+p;
            i=statement.executeUpdate(sq);
            String sq1="update tb_bbsanswer set is_cn=is_cn+1 where bbsAnswer_id="+p1;
            statement.executeUpdate(sq1);
            response.sendRedirect(request.getHeader("Referer"));
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        finally {
            if(set!=null) {
                try {
                    set.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(statement!=null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
