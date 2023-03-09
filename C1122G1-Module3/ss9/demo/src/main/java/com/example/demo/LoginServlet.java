package com.example.demo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        if (user.equals("admin") && pass.equals("123abc")) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String src = "Tên đăng nhập hoặc mật khẩu không đúng";
            request.setAttribute("src", src);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
