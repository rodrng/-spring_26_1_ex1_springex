<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	login.jsp
	
	<c:if test="${not empty pageContext.request.userPrincipal }">	
		<p>
			로그인 O<br>
			로그인 ID ${pageContext.request.userPrincipal.name } <br><br>
			<a href="<c:url value="j_spring_security_logout" />">로그아웃</a>					
		</p>
	</c:if>
	
	
	<s:authorize ifAnyGranted="ROLE_USER">
		<p>
			로그인 O2<br>
			로그인 ID <s:authentication property="name"/> <br><br>
			<a href="<c:url value="j_spring_security_logout" />">로그아웃</a>					
		</p>
	
	</s:authorize>
	
	
	<c:if test="${empty pageContext.request.userPrincipal }">	
		<p>
			로그인 X<br>
					
		</p>
	</c:if>
	
	<s:authorize ifNotGranted="ROLE_USER">
		<p>
			로그인 X2<br>
		</p>
	</s:authorize>
	
</body>
</html>