package com.example.bai_tap1.Sevrice;

import com.example.bai_tap1.Model.Book;
import com.example.bai_tap1.Repository.BookRepository;
import com.example.bai_tap1.Repository.IBookRepository;

import java.util.List;

public class BookService implements IBookService{
    IBookRepository iBookRepository = new BookRepository();

    @Override
    public List<Book> findAll() {
        return iBookRepository.findAll();
    }

    @Override
    public boolean deleteUser(int id) {
        return iBookRepository.deleteUser(id);
    }

    @Override
    public void insertUser(Book user) {

    }

    @Override
    public Book selectUser(int id) {
        return iBookRepository.selectUser(id);
    }
}
