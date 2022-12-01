package com.sist.main;
/*
 		싱글 쓰레드
 		---A--- | ---B---
 		A 끝난 후 B 실행
 */
public class MainClass_Single {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long start=System.currentTimeMillis();
		
		for(int i=0;i<100;i++) {
			System.out.println("★");
		}
		long end=System.currentTimeMillis();
		System.out.println("소요시간:"+(end-start));
		
		for(int i=0;i<100;i++) {
			System.out.println("☆");
		}
		System.out.println("소요시간:"+(end-start));
	}

}
