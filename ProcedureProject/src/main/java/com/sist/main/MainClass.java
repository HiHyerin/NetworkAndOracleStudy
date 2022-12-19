package com.sist.main;
import com.sist.dao.*;
import java.util.*;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Scanner scan=new Scanner(System.in);
//		System.out.print("이름 입력:");
//		String name=scan.next();
//		
//		System.out.print("국어:");
//		int kor=scan.nextInt();
//		System.out.print("영어:");
//		int eng=scan.nextInt();
//		System.out.print("수학:");
//		int math=scan.nextInt();
//		
//		StudentVO vo=new StudentVO();
//		vo.setName(name);
//		vo.setKor(kor);
//		vo.setEng(eng);
//		vo.setMath(math);
		
		// DAO연결
		StudentDAO dao=new StudentDAO();
//		dao.studentInsert(vo);
		System.out.println("====저장완료====");
		
		System.out.println("====학생목록====");
		ArrayList<StudentVO> list=dao.studentListData();
		for(StudentVO vo:list) {
			System.out.println(vo.getHakbun()+" "
					+vo.getName()+" "
					+ vo.getKor()+" "
					+ vo.getEng()+" "
					+ vo.getMath());
		}
	}

}
