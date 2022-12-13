<<<<<<< HEAD
package com.sist.dao;

import java.util.*;
import java.sql.*;
public class StudentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE"; // 오라클 주소
	
	// 드라이버 등록
	public StudentDAO() { // 한번만 실행하던가(자동로그인, 쿠키읽기..), 변수에대한 초기화 할 때 생성자 사용
						 // 웹에서 자바로 변경 -> 데이터 베이스 연결이랑 다 똑같음
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	// 오라클 연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	
	// 오라클 연결 해제
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	////////////////////////////////////////////////////////////////필수 (안바뀜)
	// 기능처리
	// 1. 추가
	public void studentInsert(StudentVO vo) {
		try {
			// 1. 연결
			getConnection();
			// 2. sql 문장 제작
			String sql= "INSERT INTO student VALUES((SELECT NVL(MAX(hakbun)+1,1) FROM student),?,?,?,?)";
																							// 1 2 3 4
			// 3. SQL문장을 보낸다
			ps=conn.prepareStatement(sql); // 어디로보내???????????
			// 4. 실행전에 ?에 값을 채운다
			ps.setString(1, vo.getName()); // setString쓰면 자동으로 '' 붙음
			ps.setInt(2, vo.getKor());
			ps.setInt(3, vo.getEng());
			ps.setInt(4, vo.getMath());
			
			// INSERT를 실행 => java는 autocommit
			ps.executeUpdate(); // insert, update,delete => executeUpdate() 사용 =>(commit O) -> 트랜잭션(스프링 핵심)
			// SELECT => executeQuery() => COMMIT X
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류확인
		}finally {
			// 닫기
			disConnection();
		}
	}
	// 2. 데이터 읽기
	public ArrayList<StudentVO> studntListData(){
		ArrayList<StudentVO> list=new ArrayList<StudentVO>();
		try {
			//1. 연결
			getConnection();
			//2. sql문장 제작
			String sql="SELECT hakbun,name,kor,eng,math,(kor+eng+math) total,"
					+ "Round((kor+eng+math)/3,2) avg "
					+ "FROM student";
			// sql 문장 전송
			ps=conn.prepareStatement(sql);
			// 실행 후 데이터 요청
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setHakbun(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setKor(rs.getInt(3));
				vo.setEng(rs.getInt(4));
				vo.setMath(rs.getInt(5));
				vo.setTotal(rs.getInt(6));
				vo.setAvg(rs.getDouble(7));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	/////////221212 1,2 여기까지만 배움
	// 3. 수정
	// 4. 삭제
}
=======
package com.sist.dao;

import java.util.*;
import java.sql.*;
public class StudentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE"; // 오라클 주소
	
	// 드라이버 등록
	public StudentDAO() { // 한번만 실행하던가(자동로그인, 쿠키읽기..), 변수에대한 초기화 할 때 생성자 사용
						 // 웹에서 자바로 변경 -> 데이터 베이스 연결이랑 다 똑같음
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	// 오라클 연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	
	// 오라클 연결 해제
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	////////////////////////////////////////////////////////////////필수 (안바뀜)
	// 기능처리
	// 1. 추가
	public void studentInsert(StudentVO vo) {
		try {
			// 1. 연결
			getConnection();
			// 2. sql 문장 제작
			String sql= "INSERT INTO student VALUES((SELECT NVL(MAX(hakbun)+1,1) FROM student),?,?,?,?)";
																							// 1 2 3 4
			// 3. SQL문장을 보낸다
			ps=conn.prepareStatement(sql); // 어디로보내???????????
			// 4. 실행전에 ?에 값을 채운다
			ps.setString(1, vo.getName()); // setString쓰면 자동으로 '' 붙음
			ps.setInt(2, vo.getKor());
			ps.setInt(3, vo.getEng());
			ps.setInt(4, vo.getMath());
			
			// INSERT를 실행 => java는 autocommit
			ps.executeUpdate(); // insert, update,delete => executeUpdate() 사용 =>(commit O) -> 트랜잭션(스프링 핵심)
			// SELECT => executeQuery() => COMMIT X
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류확인
		}finally {
			// 닫기
			disConnection();
		}
	}
	// 2. 데이터 읽기
	public ArrayList<StudentVO> studntListData(){
		ArrayList<StudentVO> list=new ArrayList<StudentVO>();
		try {
			//1. 연결
			getConnection();
			//2. sql문장 제작
			String sql="SELECT hakbun,name,kor,eng,math,(kor+eng+math) total,"
					+ "Round((kor+eng+math)/3,2) avg "
					+ "FROM student";
			// sql 문장 전송
			ps=conn.prepareStatement(sql);
			// 실행 후 데이터 요청
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setHakbun(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setKor(rs.getInt(3));
				vo.setEng(rs.getInt(4));
				vo.setMath(rs.getInt(5));
				vo.setTotal(rs.getInt(6));
				vo.setAvg(rs.getDouble(7));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	/////////221212 1,2 여기까지만 배움
	// 3. 수정
	// 4. 삭제
}
>>>>>>> c220d09fe3406972f9416a560b98e75afce9150e
