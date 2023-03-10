package com.baitap1;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", urlPatterns = "/student")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Student> studentList = new ArrayList<>();
        studentList.add(new Student(1,"Khải đẹp trai","nam",90));
        studentList.add(new Student(2,"Khải dễ sợ","nam",80));
        studentList.add(new Student(3,"Khải dã man","nam",60));
        studentList.add(new Student(4,"Khải very good","nam",50));
        studentList.add(new Student(5,"Khải số 1","nam",75));
        request.setAttribute("listStudent", studentList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}