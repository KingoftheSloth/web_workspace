<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="dao.animalDao"%>
<%@page import="dto.Animal"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");    
    Animal animal = (Animal) session.getAttribute("Animal");
    long desertionNo = Long.parseLong(request.getParameter("desertionNo"));
    String kind = request.getParameter("kind");
    String breed = request.getParameter("breed");
    String neuterYn = request.getParameter("neuterYn");
    String weight = request.getParameter("weight");
    String age = request.getParameter("age");
    String processState = request.getParameter("processState");
    String happenDt = request.getParameter("happenDt");
    String filename = request.getParameter("filename");
    
   /*  Animal add = new Animal(desertionNo,kind,breed,neuterYn,weight,age,processState,happenDt,filename);
    animalDao dao = animalDao.getInstance();
    dao.insert(add);  */
        
%>
<script type="text/javascript">
var kind = '<%= request.getParameter("kind") %>';
var breed = '<%= request.getParameter("breed") %>';
var neuterYn = '<%= request.getParameter("neuterYn") %>';
var weight = '<%= request.getParameter("weight") %>';
alert("등록이 완료되었습니다.")
console.log(kind);
console.log(breed);
console.log(neuterYn);
console.log(weight);
   </script>