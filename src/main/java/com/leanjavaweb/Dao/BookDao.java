package com.leanjavaweb.Dao;

import java.util.List;

import com.leanjavaweb.model.Book;

public interface BookDao {
	
	public boolean addBook(Book b);
	
	public List<Book> getAllbooks();
	
	public Book getBookById(int id);
	
	public boolean updateEditBooks(Book b);
	
	public boolean deleteBooks(int id);
	
	public List<Book> getNewBook();
	
	public List<Book> getRecentBook();
	
	public List<Book> getOldBook();
	
	public List<Book> getAllrecentBook();
	
	public List<Book> getAllnewBook();
	
	public List<Book> getAlloldBook();
}
