package com.bai_tap_1.Model;

public class Book {
//    id, title, pageSize, author, category
    private Integer id;
    private String title;
    private int pageSize;
    private String author;
    private String category;

    public Book() {
    }

    public Book(Integer id, String title, int pageSize, String author, String category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Book(String title, int pageSize, String author, String category) {
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", pageSize=" + pageSize +
                ", author='" + author + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
