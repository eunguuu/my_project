<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String Id = request.getParameter("id");
String Pass = request.getParameter("pass");
String Name = request.getParameter("name");
String Email = request.getParameter("email");
String Postcode = request.getParameter("postcode");
String Address = request.getParameter("address");
String DetailAddress = request.getParameter("detailAddress");
String ExtraAddress = request.getParameter("extraAddress");
String Phone = request.getParameter("phone");
String Mobile = request.getParameter("mobile");
Timestamp date = new Timestamp(System.currentTimeMillis());

//메일 전송용 입력값 받음
String from = "eunguuuu@naver.com";
String to = request.getParameter("email");
String subject = "회원가입을 환영합니다!";
String content = Name + "님, 회원가입을 진심으로 환영합니다 :D";

MemberBean mb = new MemberBean();
mb.setId(Id);
mb.setPass(Pass);
mb.setName(Name);
mb.setEmail(Email);
mb.setPostcode(Postcode);
mb.setAddress(Address);
mb.setDetailAddress(DetailAddress);
mb.setExtraAddress(ExtraAddress);
mb.setPhone(Phone);
mb.setMobile(Mobile);
mb.setDate(date);

MemberDAO mdao = new MemberDAO();
mdao.insertMember(mb);

Properties p = new Properties(); // 정보를 담을 객체

p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
 
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP 서버에 접속하기 위한 정보들
 
try{
    Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject(subject); // 제목
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
//     out.println("<script>alert('메일 발송이 실패하였습니다.');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
//     return;
}
 
// out.println("<script>alert('메일이 발송되었습니다.');location.href='mailForm.html';</script>");
// response.sendRedirect("mailForm.jsp");
// 성공 시

// 가입성공(*성공화면 띄우기)
response.sendRedirect("join_ok.jsp");
%>
</body>
</html>