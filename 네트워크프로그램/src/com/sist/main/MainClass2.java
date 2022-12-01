package com.sist.main;
/*
  	= 웬만해서는 Thread를 상속하는게 맞지만 상속이 안되는 클래스가 있다.(ex. 윈도우)
  		class Window extends JFrame implements Runnable{}
  	
  	= 두가지 일을 동시에
  		IO (단방향이기 때문에 읽기 쓰기를 따로따로 움직여야함)
  			ㄴ> 동시에 동작할 수 있게 하는 것이 Thread
  		
  	
 */
class MyThread2 implements Runnable{ //쓰레드에 대한 동작만 만들어 준다.

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			for(int i=1;i<=10;i++) {
				System.out.println(Thread.currentThread()+" : "+i);
				// 현재 동작하고 있는 쓰레드 이름
				Thread.sleep(300);
			}
		}catch(Exception ex) {}
	}
	
}
public class MainClass2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyThread2 t1=new MyThread2(); //쓰레드x
		new Thread(t1).start(); // 쓰레드o , t1이 가지고 있는 run()메소드 호출
	}

}
