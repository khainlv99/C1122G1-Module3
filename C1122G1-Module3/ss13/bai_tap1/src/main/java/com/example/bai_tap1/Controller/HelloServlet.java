package com.example.bai_tap1.Controller;

import com.example.bai_tap1.Model.Book;
import com.example.bai_tap1.Sevrice.BookService;
import com.example.bai_tap1.Sevrice.IBookService;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/book")
public class HelloServlet extends HttpServlet {
    IBookService iBookService = new BookService();
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Book> list=iBookService.findAll();
        request.setAttribute("listUser",list);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    public void destroy() {
    }
}