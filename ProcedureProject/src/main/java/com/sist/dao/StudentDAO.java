package com.sist.dao;
// 자바와 데이터베이스 연동 p.285
// jdbc => dbcp(웹 일반화) => orm(라이브러리 => MyBatis, JPA)
import java.util.*;

import oracle.jdbc.OracleTypes;

import java.sql.*;

public class StudentDAO {
	// 연결
	private Connection conn;
	// 송수신 sql => 결과값
	private CallableStatement cs; // 프로시저 호출할 때 쓰는 함수
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public StudentDAO(){
		// 드라이버 등록
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	// 연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	
	// 해제
	public void disConnection() {
		try {
			if(cs!=null) cs.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	// 기능설정
	// 1. 목록출력
	/*
	 	create or replace procedure studentListData(
	    pResult OUT SYS_REFCURSOR
		)
		is
		begin
		    OPEN pResult For
		        SELECT * FROM student;
		end;
	/
	 */
	public ArrayList<StudentVO> studentListData(){
		ArrayList<StudentVO> list=new ArrayList<StudentVO>();
		try {
			//1. 연결
			getConnection();
			// 2. sql문장 전송
			String sql="{CALL studentListData(?)}";
			// 3. 오라클로 전송
			cs=conn.prepareCall(sql);
			// 4. ?에 값을 채운다
			cs.registerOutParameter(1, OracleTypes.CURSOR); // out변수 , 임시저장장소, 오라클 데이터형과 통일(.cursor)
			// 5. 실행요청
			cs.executeQuery();
			// 6. 임시로 저장된 메모리에서 데이터를 가지고 온다
			ResultSet rs=(ResultSet)cs.getObject(1);
			while(rs.next()) {
				StudentVO vo=new StudentVO();
				vo.setHakbun(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setKor(rs.getInt(3));
				vo.setEng(rs.getInt(4));
				vo.setMath(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
					
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	// 2. 데이터 추가
	/*
 		create or replace procedure studentInsert(
	    pName in student.name%type, -- in 생략 가능
	    pKor student.kor%type,
	    pEng student.eng%type,
	    pMath student.math%type
	)
		is
		    pMax NUMBER:=0;
		begin
		    SELECT NVL(MAX(hakbun)+1,1) into pMax
		    from student;
		    
		    insert into student values(pMax,pName,pKor,pEng,pMath);
		    commit;
		end;
		/
	 */
	public void studentInsert(StudentVO vo) {
		try {
			// 1. 연결
			getConnection();
			//2. sql문장 전송
			String sql="{Call studentInsert(?,?,?,?)}";
			//3. 프로시저 호출
			cs=conn.prepareCall(sql);
			// 4. ?에 값 채우기
			cs.setString(1, vo.getName());
			cs.setInt(2, vo.getKor());
			cs.setInt(3, vo.getEng());
			cs.setInt(4, vo.getMath());
			
			// 5. 실행요청
			cs.executeQuery(); // 무조건 executeQuery() 사용
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			// 닫기
			disConnection();
		
		}
	}
	
	
	// 3. 데이터 수정
	/*
 		create or replace procedure studentUpdate(
	    pHakbun in student.hakbun%type,
	    pName in student.name%type, -- in 생략 가능
	    pKor student.kor%type,
	    pEng student.eng%type,
	    pMath student.math%type
		)
		is
		begin
		    update student set
		    name=pName,kor=pKor,eng=pEng,math=pMath
		    where hakbun=pHakbun;
		    commit;--반드시
		end;
		/
			 */
			
			
			// 4. 데이터 삭제
			/*
		 		create or replace procedure studentDelete(
		    pHakbun in student.hakbun%type -- 값 대입할 땐 in(생략가능)
		)
		is
		begin
		    delete from student
		    where hakbun=pHakbun;
		    commit;
		end;
		/
	 	
	 */
	
	
	// 5. 데이터 검색
	/*
 		set serveroutput on;
		create or replace procedure studentDetailData( -- (out은 생략이 안됨)
		    pHakbun student.hakbun%type, -- in 생략
		    pName out student.name%type,
		    pKor out student.kor%type,
		    pEng out student.eng%type,
		    pMath out student.math%type,
		    pTotal out number,
		    pAvg out number
		)
		is
		begin
		    select name,kor,eng,math,(kor+eng+math),ROUND((kor+eng+math)/3) into pName,pKor,pEng,pMath,pTotal,pAvg
		    FROM student
		    where hakbun=pHakbun;
		    
		    dbms_output.put_line(pName);
		    dbms_output.put_line(pKor);
		    dbms_output.put_line(pEng);
		    dbms_output.put_line(pMath);
		    dbms_output.put_line(pTotal);
		    dbms_output.put_line(pAvg);
		    
		end;
		/
	 */
}
