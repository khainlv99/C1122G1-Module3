package com.example.bai_tap1.Repository;

import com.example.bai_tap1.Model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> findAll();
}
