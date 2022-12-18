package com.sist.dao;
import java.util.*;  // 데이터를 모아서 넘겨줄 때 => arraylist
/*
 	row가 한 개 일 때 : row 한줄=> bookVO
 	row가 여러개 일 때 : arraylist
 */
import java.sql.*;
/*	p.286
	1. 드라이버 등록(Class.forName())
	2. 연결 : DriverManager.getConnection(URL,"user","pwd")
	3. sql문장 제작
	4. 오라클로 전송 conn.preparedStatement(sql);
	5. 결과값 읽기
		결과값 있는 경우 (select) =====> executeQuery()
		결과값 없는 경우 (insert, update, delete)    ====> executeUpdate() => commit포함
		결과값이 저장되는 메모리 : ResultSet
			ResultSet rs=ps, .executeQuery()
		커서를 데이터 옆으로 이동
			next() : 처음부터 다음줄로 이동 후 데이터 읽기
			previous() : 마지막 이전줄로 이동후 데이터 읽기
	6. rs.close() : 메모리 닫기
	7. ps.close() : 
	8. conn.close()
		연결, 닫기 기능 -> 반복되는 기능이므로 메소드로 만든다.
										-----
										수정, 재사용 용이 (객체지향)
 */

public class BookDAO {

	private Connection conn; // 오라클 연결객체
	private PreparedStatement ps; // 송수신 객체(sql전송, 결과값 받기)
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// 1. 드라이버 등록(한번만 수행) => 생성자에서 작성
	public BookDAO() {
		/*
		 	생성자 = 객체 저장할 때 호출되는 메소드
		 		1) 여러개를 만들 수 있다(오버로딩)
		 		2) 리턴형이 없다
		 		3) 클래스명과 동일
		 		4) 주 역할 : 멤버변수에 대한 초기화
		 					한번만 수행하거나 어딘가와 연결 할 때
		 			ex) 자동 로그인
		 */
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 대소문자 구분
			// 클래스 정보를 읽어서 제어할 때 주로 사용
			// 메모리 할당(new 대신 사용), 메소드 호출, 변수 초기값...  => 리플렉션(스프링, 마이바티스)
				/*
				 	* new연산자를 이용하면 (결합성이 높아짐 -> 권장x)
					* 결합성이 낮은 프로그램 => 리플렉션
					* 스프링엔 new연산자가 없고 변수값을 지정하지 않는다.
					
				 */
				
		}catch(ClassNotFoundException cf) {
			
		}
	}
	
	// 2. 오라클 연결(쿼리문장 할때마다 반복)
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	// 3. 오라클 연결종료(쿼리문장 할때마다 반복)
	
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	
	
	
	
	// 기능 수행
	/*
	 	ArrayList<BookVO> list = new ArrayList<BookVO>();
		try {
			// 1. 연결
			// 2. sql문장 제작
			// 3. 오라클 전송
			// 4. 결과값을 가지고 온다
			// 5. ArrayList값을 추가
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	 */
	
	// 1. 3-1문제
	// => 자바와 오라클 연동(70%) / html 출력 ==> 웹 프로그래머(30%)
	// 모든 도서의 이름과 가격을 검색하시오 (BookVO => 도서정보 한 개)
	public ArrayList<BookVO> book3_1(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		try {
			// 1. 연결
			getConnection();
			
			// 2. sql문장 제작
			String sql="select bookname,price from book";
			
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 결과값을 가지고 온다
			ResultSet rs=ps.executeQuery();
			
			// 5. ArrayList값을 추가
			while(rs.next()) {
				BookVO vo=new BookVO();
				vo.setBookname(rs.getString(1));
				vo.setPrice(rs.getInt(2));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	
	// 3-2문제
	// 모든 도서의 도서번호, 도서이름, 출판사, 가격 검색
	public ArrayList<BookVO> book3_2(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		try {
			// 1. 연결
			getConnection();
			
			// 2. sql문장 제작
			String sql="select * from book";
			
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 결과값을 가지고 온다
			ResultSet rs=ps.executeQuery();
			
			// 5. ArrayList값을 추가
			while(rs.next()) {
				BookVO vo=new BookVO();
				vo.setBookid(rs.getInt(1));
				vo.setBookname(rs.getString(2));
				vo.setPublisher(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	
	// 3-3 문제 
	// 도서 테이블에 있는 모든 출판사를 검색 (중복제거)
	/*
	 * 	컬럼이 여러개면 VO
	 * 	컬럼이 한개면 해당 데이터형
	 * 		ex) price => int  
	 * 			ArrayList<Integer>
	 */
	public ArrayList<String> book3_3(){ 	// <string> : 데이터가 각 줄에 하나씩 밖에 없기 때문에
		ArrayList<String> list = new ArrayList<String>();
		try {
			// 1. 연결
			getConnection();
			
			// 2. sql문장 제작
			String sql="select distinct publisher from book";
			
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 결과값을 가지고 온다
			ResultSet rs=ps.executeQuery();
			
			// 5. ArrayList값을 추가
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	//<3-21> 문제
	// 고객과 고객의 주문에 관한 데이터를 모두 보이시오
	/*name
 	이름      널?       유형           
	------- -------- ------------ 
	CUSTID  NOT NULL NUMBER(2)    
	NAME             VARCHAR2(40) 
	ADDRESS          VARCHAR2(50) 
	PHONE            VARCHAR2(20) 
 */
	/* orders
	이름        널?       유형        
	--------- -------- --------- 
	ORDERID   NOT NULL NUMBER(2) 
	CUSTID             NUMBER(2) 
	BOOKID             NUMBER(2) 
	SALEPRICE          NUMBER(8) 
	ORDERDATE          DATE 
	*/
	// 조인
	public ArrayList<CustomerVO> book3_21(){
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		try {
			// 1. 연결
			getConnection();
			
			// 2. sql문장 제작
			/* dao 오류
			 	sql 명령어가 올바르게 종료되지 않았습니다. => 철자 오타, 공백
			 	내부변환이 안된다 => 데이터형이 다르다
			 	in out => ?에 값을 지정하지 않았다.
			 	null => url이 틀린경우
			 */
			///////////////////////////////////////////
			String sql="select name,address,phone,bookid,saleprice,orderdate "
						+"from customer, orders "
						+"where customer.custid=orders.custid " 				// 값이 다름
						+"order by customer.custid";
			/////////////////////////////////////////////////////////////////////////////
			/*
			 	자바에서 데이터 읽기
			 	1. 일반 sql문장(table, view)
			 	2. join : 포함클래스
			 	3. subquery : 포함클래스
			 	4. 인라인뷰 : 페이지
			 */
			
						
			
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 결과값을 가지고 온다
			ResultSet rs=ps.executeQuery();
			
			// 5. ArrayList값을 추가///////////////////////////////////////////
			while(rs.next()) {					// 값이 다름
				CustomerVO vo=new CustomerVO();
				vo.setName(rs.getString(1));
				vo.setAddress(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.getOvo().setBookid(rs.getInt(4));
				vo.getOvo().setSaleprice(rs.getInt(5));
				vo.getOvo().setOrderdate(rs.getDate(6));
				list.add(vo);
			}////////////////////////////////////////////////////////////////
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
}

/*
	이름      널?       유형           
------- -------- ------------ 
CUSTID  NOT NULL NUMBER(2)    
NAME             VARCHAR2(40) 
ADDRESS          VARCHAR2(50) 
PHONE            VARCHAR2(20) 
*/






