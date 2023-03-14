package com.bai_tap_1.Service;

import com.bai_tap_1.Model.Book;
import com.bai_tap_1.Repository.IBookRepository;
import com.bai_tap_1.Repository.BookRepository;

import java.util.List;

public class BookService implements IBookService {
    IBookRepository iBookRepository = new BookRepository();
    @Override
    public List<Book> fillAll() {
        return iBookRepository.fillAll();
    }

    @Override
    public void save(Book book) {
        iBookRepository.save(book);
    }

    @Override
    public Book findById(int id) {
        return iBookRepository.findById(id);
    }

    @Override
    public void update(int id, Book book) {
        iBookRepository.update(id,book);
    }

    @Override
    public void remove(int id) {
        iBookRepository.remove(id);
    }
}
