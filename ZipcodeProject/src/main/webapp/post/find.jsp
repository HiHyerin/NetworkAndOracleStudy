<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"import="java.util.*,com.sist.dao.*"%>
    
 <%
 	request.setCharacterEncoding("EUC=KR");
 	String dong=request.getParameter("dong");
 	ArrayList<ZipcodeVO> list=null;
 	
 	ZipcodeDAO dao=new ZipcodeDAO();
 	int count=0;
 	if(dong!=null){ // ����ڰ� ���� �Է����� ��
 		list=new ArrayList<ZipcodeVO>();
 		list=dao.postFind(dong);
 		count=dao.postCount(dong);
 		
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>