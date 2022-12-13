package com.sist.dao;
// 오라클 연결 
import java.util.*;
import java.sql.*;
public class BoardDAO {
	private Connection conn; // 오라클 연결 객체
	private PreparedStatement ps; 
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// 드라이버 등록
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 대소문자 구분
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
			if(ps!=null)ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	// 기능 => CURD 프로그램
	// 	=> 페이징X - 뷰(VIEW)에서 할 거
	// 1. 목록출력 (select) (order by로 정렬)
	public ArrayList<BoardVO> boardListData(){// 게시물 한개가 vo(BoardVO) 한개
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			// 1. 연결
			getConnection(); // 메소드는 한개의 기능을 만들 때(재사용), 반복적 구간이 나왔을 때 만들어서 처리
			
			// 2. sql 문장 제작
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY/MM/DD'), hit "
					+ "FROM freeboard "
					+ "ORDER BY no DESC"; // 최신글을 제일 위로
			
			// 3. 오라클 서버로 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 결과값 받기
			ResultSet rs=ps.executeQuery(); // 메모리 안에 저장
			
			// 5. 결과값을 ArrayList에 담는다.
			// 오라클에 저장된 데이터는 자동 정렬이 된 상태가 아니다 그래서 order by를 사용하지 않으면 정렬이 되어있지 않음
			while(rs.next()) { // 메모리에 출력된 첫번째 위치에 커서를 이동한다.
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
			
			}
			rs.close();
			
		}catch(Exception ex) { 
			ex.printStackTrace(); // 오류 확인
		}finally {
			disConnection(); // 오라클 연결 해ㅈ[
		}
		return list;
	}
	// 2. 게시물 추가(insert)
	// 3. 상세보기(select)(where 조건)
	public BoardVO boardDetailData(int no) { // no=게시물 번호 -> 사용자로부터 받아서 데이터를 넘겨준다.(primary key)
		BoardVO vo=new BoardVO();
		try {
			// 1. 연결
			getConnection();
			// 2. 전송할 sql문장 제작
			String sql="UPDATE freeboard SET "
					+"hit=hit+1 "
					+"WHERE no=?";
			
			// 3. 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 실행
			ps.executeUpdate(); // 실행 후 commit
			
			// 5. 전송할 sql문장 제작
			sql="SELECT no,name,subject,content,regdate,hit "
					+"FROM freeboard "
					+"WHERE no="+no;
			// 6. 오라클로 전송
			ps=conn.prepareStatement(sql);
			
			// 7. 실행 후 결과값 읽기
			ResultSet rs=ps.executeQuery();
			
			// 8. 커서위치 이동
			rs.next();
			
			// 9. VO에 값을 채운다
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex) {
			
		}finally {
			disConnection();
		}
		return vo;
	}
	//-------------------------------------
	// 4. 수정(update)
	// 5. 삭제(delete)
	//---------------------------------> 본인여부 확인(비밀번호 비교)
	// 6. 검색(select) (like)

}
