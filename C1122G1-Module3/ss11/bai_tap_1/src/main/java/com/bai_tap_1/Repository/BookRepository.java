package com.bai_tap_1.Repository;

import com.bai_tap_1.Model.Book;

import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static List<Book> bookList;
    static {
        bookList = new ArrayList<>();
        bookList.add(new Book(1, "Sieu nhan gao", 1, "Khai dep trai", "sieu nhan"));
        bookList.add(new Book(2, "One Piece", 2, "Khai dep trai", "anime"));
        bookList.add(new Book(3, "Soguku", 3, "Khai dep trai", "anime"));
        bookList.add(new Book(4, "Bay vien ngoc rong", 4, "Khai dep trai", "anime"));
        bookList.add(new Book(5, "Lam giau khong kho", 5, "Khai dep trai", "doanh nhan thanh dat"));
    }
    @Override
    public List<Book> fillAll() {
        return bookList;
    }

    @Override
    public void save(Book book) {
        bookList.add(book);
    }

    @Override
    public Book findById(int id) {
        for (Book a: bookList
             ) {
            if (a.getId().equals(id)){
                return a;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Book book) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId() == id) {
                bookList.set(i, book);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (Book a: bookList
             ) {
            if (a.getId() == id){
                bookList.remove(a);
                break;
            }
        }
    }
}
