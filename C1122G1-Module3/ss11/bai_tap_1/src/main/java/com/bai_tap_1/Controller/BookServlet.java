package com.bai_tap_1.Controller;

import com.bai_tap_1.Model.Book;
import com.bai_tap_1.Service.BookService;
import com.bai_tap_1.Service.IBookService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = "/book")
public class BookServlet extends HttpServlet {
    IBookService bookService = new BookService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case "create":
                showCreateBook(request,response);
                break;
            case "delete":
                showDeleteBook(request,response);
                break;
            case "update":
                showUpdateBook(request,response);
                break;
            case "add":
                break;
            case "edit":
                showEditBook(request,response);
                break;
            default:
                listBook(request,response);
                break;
        }
    }

    private void showEditBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//        User existingUser = userDAO.selectUser(id);
        Book book = bookService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("book", book);
        dispatcher.forward(request, response);
    }

    private void showUpdateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("update.jsp");
    }

    private void showDeleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = this.bookService.findById(id);
        RequestDispatcher dispatcher;
        if(book == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("book", book);
            dispatcher = request.getRequestDispatcher("delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showCreateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("create.jsp");
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> books = bookService.fillAll();
        request.setAttribute("books",books);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createBook(request, response);
                break;
            case "edit":
                updateBook(request, response);
                break;
            case "update":

            case "delete":
                deleteBook(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = this.bookService.findById(id);
        RequestDispatcher dispatcher;
        if (book == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.bookService.remove(id);
            try {
                response.sendRedirect("/book");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        id, title, pageSize, author, category
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Book book = this.bookService.findById(id);
        RequestDispatcher dispatcher;
        if (book == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            book.setTitle(title);
            book.setPageSize(pageSize);
            book.setAuthor(author);
            book.setCategory(category);
            this.bookService.update(id, book);
            request.setAttribute("customer", book);
            request.setAttribute("message", "Book information was updated");
            dispatcher = request.getRequestDispatcher("update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize =  Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Book bookss = new Book(id,title,pageSize,author,category);
        bookService.save(bookss);
        response.sendRedirect("/book");
    }
}
