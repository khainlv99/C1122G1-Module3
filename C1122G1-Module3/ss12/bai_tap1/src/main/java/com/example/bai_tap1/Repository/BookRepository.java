package com.example.bai_tap1.Repository;

import com.example.bai_tap1.Model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository{
    @Override
    public List<Book> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Book> books = new ArrayList<>();
        try {
            if (connection != null) {
                statement = connection.prepareStatement("SELECT * FROM library.books");
                resultSet = statement.executeQuery();
                Book book = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int pageSize = resultSet.getInt("page_size");
                    int authorId = resultSet.getInt("author_id");
                    int categoryId = resultSet.getInt("category_id");
                    book = new Book(id,name,pageSize,authorId,categoryId);
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                resultSet.close();
                statement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            DBConnection.close();
        }
        return books;
    }
    public void save(Book book){
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection!= null){
            try {
                statement = connection.prepareStatement("insert into books(id,name,page_size,author_id,category_id) value (?,?,?,?,?)");
                statement.setInt(1,book.getId());
                statement.setString(2,book.getName());
                statement.setInt(3,book.getPageSize());
                statement.setInt(4,book.getAuthorId());
                statement.setInt(5,book.getCategoryId());
                statement.executeQuery();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }

    }
}
