package com.leanjavaweb.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.leanjavaweb.model.Book;

public class BookImpl implements BookDao{
	private Connection conn;
	

	public BookImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	@Override
	public boolean addBook(Book b) {
		boolean f=false;
		try {
			String sql="insert into book(bookname,authour,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
	@Override
	public List<Book> getAllbooks() {
		// TODO Auto-generated method stub
		List<Book> list=new ArrayList<Book>();
		Book b=null;
 		try {
 			String sql="select * from book";
 			PreparedStatement ps=conn.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch (Exception e) {
	
		}
		return list;
	}
	@Override
	public Book getBookById(int id) {
		// TODO Auto-generated method stub
		Book b=null;
		try {
			String sql="select * from book where bookid=?";
			PreparedStatement ps=conn.prepareCall(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return b;
	}
	@Override
	public boolean updateEditBooks(Book b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="update book set bookname=?,authour=?,price=?,status=? where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4,b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i=ps.executeUpdate();
			if(i==1){
				f=true;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}catch (Exception e) {
			
			// TODO: handle exception
		}
		return f;
	}
	@Override
	public List<Book> getNewBook() {
		List<Book> list=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from book where bookcategory=? and status=?";		
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public List<Book> getRecentBook() {
		List<Book> list=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from book where status=? ORDER BY bookid DESC";		
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public List<Book> getOldBook() {
		List<Book> list=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from book where bookcategory=? and status=?";		
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public List<Book> getAllrecentBook() {
		List<Book> list=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from book where status=? ORDER BY bookid DESC";		
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public List<Book> getAllnewBook() {
		List<Book> list=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from book where bookcategory=? and status=?";		
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public List<Book> getAlloldBook() {
		List<Book> list=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from book where bookcategory=? and status=?";		
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
}
