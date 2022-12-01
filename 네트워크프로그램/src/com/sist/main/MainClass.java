package com.sist.main;

class MyThread extends Thread{
	public void run() { // 동작내용 정의
		try {
			for(int i=1;i<=10;i++) {
				System.out.println(getName()+":"+i);
				Thread.sleep(100); //1000분의 1초 단위(밀리세컨드)
			}
		}catch(InterruptedException e) {} // 쓰레드는 CheckedException => 반드시 예외처리
		
	}
}
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyThread t1=new MyThread();
		t1.setName("홍길동");
		t1.setPriority(Thread.NORM_PRIORITY);
		
		MyThread t2=new MyThread();
		t2.setName("심청이");
		t2.setPriority(Thread.MIN_PRIORITY);
		
		MyThread t3=new MyThread();
		t3.setName("이순신");
		t3.setPriority(Thread.MAX_PRIORITY);
		System.out.println("t1이름: "+t1.getName()+", 우선순위:"+t1.getPriority());
		System.out.println("t1이름: "+t2.getName()+", 우선순위:"+t2.getPriority());
		System.out.println("t1이름: "+t3.getName()+", 우선순위:"+t3.getPriority());
		System.out.println("===동작===");
		t1.start();
		t2.start();
		t3.start();
	}

}
