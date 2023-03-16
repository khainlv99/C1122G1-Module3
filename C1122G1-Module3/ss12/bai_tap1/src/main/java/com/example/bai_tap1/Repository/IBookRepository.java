package com.example.bai_tap1.Repository;

import com.example.bai_tap1.Model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> findAll();
    boolean deleteBook(int id);
    void insertUser(Book book);
    Book selectBook(int id);
}
