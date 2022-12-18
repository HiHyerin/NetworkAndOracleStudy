package com.sist.dao;
/*
	book, customer, orders     =>vo는 각자 따로 제작, dao는 하나
	---------------------- 세뚜
	emp, dept, salgrade			=>vo는 각자 따로 제작, dao는 하나
	---------------------- 세뚜
*/

/* book
이름        널?       유형           
--------- -------- ------------ 
BOOKID    NOT NULL NUMBER(2)    
BOOKNAME           VARCHAR2(40) 
PUBLISHER          VARCHAR2(40) 
PRICE              NUMBER(8) 
*/
public class BookVO {
	private int bookid, price;
	private String bookname, publisher;
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
}
