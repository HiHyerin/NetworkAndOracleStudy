package com.sist.client;
import java.util.*;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ChatClient extends JFrame implements ActionListener,Runnable{
	JTextArea ta;
	JTextField tf;
	JButton b1, b2;
	private String name;
	
	//네트워크 관련 라이브러리
	private Socket s; // 연결기기
	private OutputStream out; // 서버로 전송
	private BufferedReader in; //서버로부터 값 읽기
	public ChatClient() {
		ta=new JTextArea();
		JScrollPane js=new JScrollPane(ta);
		ta.setEditable(false);
		tf=new JTextField(30);
		tf.setEnabled(false);
		b1=new JButton("접속");
		b2=new JButton("종료");
		
		JPanel p=new JPanel();
		p.add(tf);
		p.add(b1);
		p.add(b2);
		
		add("Center",js);
		add("South",p);
		setSize(520,600);
		setVisible(true);
		
		b1.addActionListener(this);
		b2.addActionListener(this); //CallBack => 시스템에 의해서 자동 호출(자바스크립트)
		tf.addActionListener(this);// enter
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new ChatClient();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==b1) {
			name=JOptionPane.showInputDialog("이름입력:");
			// 서버연결
			try {
				s=new Socket("localhost",3355); // 연결=> 서버에 전화 걸기
				in=new BufferedReader(new InputStreamReader(s.getInputStream())); //서버로부터 값을 받는다
				out=s.getOutputStream();
			}catch(Exception ex) {}
			b1.setEnabled(false);
			tf.setEnabled(true);
			tf.requestFocus();
		}
		if(e.getSource()==b2) {
			dispose(); // 윈도우 메모리 회수
			System.exit(0); // 프로그램 종료
		}
		
		if(e.getSource()==tf) {
			//입력한 문자열 읽기
			String msg=tf.getText();
			if(msg.trim().length()<1) { // 입력이 안된 상태
				return;
			}
				// 입력값을 서버로 전송
				try {
					out.write(("["+name+"]"+msg+"\n").getBytes());
					// out = 서버로 전송
				}catch(Exception ex) {}
				//ta.append(msg+"\n");
				new Thread(this).start();
				tf.setText("");
			
				
		}
		
	}

	// 서버에서 보내준 데이터를 출력
	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			while(true) {
				
				String msg=in.readLine();
				
				ta.append(msg+"\n");
				
			}
		}catch(Exception ex) {}
		
	}

} 
