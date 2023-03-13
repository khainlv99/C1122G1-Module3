package com.bai_tap_1.Repository;

import com.bai_tap_1.Model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> fillAll();
    void save(Book book);
    Book findById(int id);
    void update(int id, Book book);
    void remove(int id);
}
