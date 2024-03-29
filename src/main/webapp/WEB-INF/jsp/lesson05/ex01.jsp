<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<h3> 변수 사용하기 (c:set)</h3>
	
	<c:set var="number1" value="100"/>
	<c:set var="number2">200</c:set>
	
	<h4> number 1 : ${number1 }</h4>
	<h4> number 2 : ${number2 }</h4>

	<h4> number 1 + number 2 : ${number1 + number2 }</h4>

	<h3> 변수 출력하기 (c:out)</h3>
	
	<h4> number : <c:out value="10"/></h4>
	<h4> number 1 : <c:out value="${ number1}"/></h4>
	
	<c:out value="<script>alert('출력');</script>" />
	<c:out value="<script>alert('출력22');</script>" escapeXml="true" />
	<!-- <c:out value="<script>alert('출력');</script>" escapeXml="false" /> -->
	
	<h2>조건문 (c:if)</h2>
	
	<c:if test="true">
		<h4>조건이 참이다!!</h4>
	</c:if>
	
	<c:if test="${number1 > 50 }">
		<h4>number1 이 50보다 크다!</h4>
	</c:if>
	
	<c:if test="${number1 ==100 }">
		<h4>number1은 100이다.</h4>
	</c:if>
	
	<c:if test="${number2 eq 200 }">
		<h4>number2은 200이다.</h4>
	</c:if>
	
	<c:if test="${number2 ne 222 }">
		<h4>number2는 222가 아니다.</h4>
	</c:if>
	
	<c:if test="${!empty number1 }">
		<h4>number1이 비어있지 않다.</h4>
	</c:if>
</body>
</html>