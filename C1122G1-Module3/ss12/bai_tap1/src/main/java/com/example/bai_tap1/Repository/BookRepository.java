package com.example.bai_tap1.Repository;

import com.example.bai_tap1.Model.Book;

import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
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
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int pageSize = resultSet.getInt("page_size");
                    int authorId = resultSet.getInt("author_id");
                    int categoryId = resultSet.getInt("category_id");
                    book = new Book(id, name, pageSize, authorId, categoryId);
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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

    @Override
    public boolean deleteBook(int id) {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from books where id = ?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public void insertUser(Book book) {
//        try (Connection connection = DBConnection.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users" + "  (name, email, country) VALUES " +" +
//                     "" (?, ?, ?);")) {
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            System.out.println(preparedStatement);
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//    }
    }

    @Override
    public Book selectBook(int id) {
        Book book = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into books(id,name,page_size,author_id,category_id) value (?,?,?,?,?)");) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                int pageSize = rs.getInt("page_size");
                int authorId = rs.getInt("author_id");
                int categoryId = rs.getInt("category_id");
                book = new Book(id1, name, pageSize, authorId, categoryId);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return book;
    }

    public void save(Book book) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into books(id,name,page_size,author_id,category_id) value (?,?,?,?,?)");
                statement.setInt(1, book.getId());
                statement.setString(2, book.getName());
                statement.setInt(3, book.getPageSize());
                statement.setInt(4, book.getAuthorId());
                statement.setInt(5, book.getCategoryId());
                statement.executeQuery();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
    }

    public List<Book> findUsersByCountry(String nameq) {
        List<Book> books = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from books where name = ?");) {
            preparedStatement.setString(1, nameq);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int pageSize = rs.getInt("page_size");
                int authorId = rs.getInt("author_id");
                int categoryId = rs.getInt("category_id");
                books.add(new Book(id, name, pageSize, authorId, categoryId));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

}
