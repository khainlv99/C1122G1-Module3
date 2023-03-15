package com.example.bai_tap1.Model;

public class Book {
    private Integer id;
    private String name;
    private Integer pageSize;
    private Integer authorId;
    private Integer categoryId;

    public Book() {
    }

    public Book(Integer id, String name, Integer pageSize, Integer authorId, Integer categoryId) {
        this.id = id;
        this.name = name;
        this.pageSize = pageSize;
        this.authorId = authorId;
        this.categoryId = categoryId;
    }

    public Book(String name, Integer pageSize, Integer authorId, Integer categoryId) {
        this.name = name;
        this.pageSize = pageSize;
        this.authorId = authorId;
        this.categoryId = categoryId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pageSize=" + pageSize +
                ", authorId=" + authorId +
                ", categoryId=" + categoryId +
                '}';
    }
}
