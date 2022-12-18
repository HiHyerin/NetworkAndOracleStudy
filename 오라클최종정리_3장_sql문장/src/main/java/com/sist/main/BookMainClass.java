package com.sist.main;

import com.sist.dao.BookDAO;
import com.sist.dao.BookVO;
import com.sist.dao.CustomerVO;

import java.util.*;
public class BookMainClass {

	public static void main(String[] args) {
		BookDAO dao=new BookDAO();
		//<3-1>
//		// 오라클로부터 값을 받아 온다
//		ArrayList<BookVO> list=dao.book3_1();
//		
//		// 출력
//		for(BookVO vo:list) {
//			System.out.println(vo.getBookname()+" "+vo.getPrice());
//		}
		
		//<3-2>
//		// 오라클로부터 갓을 받아온다
//		ArrayList<BookVO> list=dao.book3_2();
//		
//		// 출력
//		for(BookVO vo:list) {
//			System.out.println(vo.getBookid()+" "+vo.getBookname()+" "
//						+vo.getPrice()+" " + vo.getPublisher());
//		}
		
//		//<3-3> 
//		// 출력
//		ArrayList<String> list=dao.book3_3();
//		for(String s:list){
//			System.out.println(s);
//		}
		
		//<3-21>
		ArrayList<CustomerVO> list=dao.book3_21();
		for(CustomerVO vo:list) {
			System.out.println(vo.getName()+" "
					+vo.getAddress()+" "
					+vo.getPhone()+" "
					+vo.getOvo().getBookid()+" "
					+vo.getOvo().getSaleprice()+" "
					+vo.getOvo().getOrderdate().toString());
		}
		
	}

}
