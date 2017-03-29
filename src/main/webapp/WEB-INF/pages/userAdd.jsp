<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.error {
        color: red; font-weight: bold;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Add user</title>
</head>
<body>
<c:url var="addAction" value="/userAdd" ></c:url>
<form:form action="${addAction}" commandName="user">
	<table>
		<tr>
			<td>
				<form:label path="username">
					<spring:message text="Kullanıcı Adı"/>
				</form:label>
			</td>
			
			<td>
				<form:input path="username" />
			</td>
			<td><form:errors path="username" cssClass="error"/></td>
	    </tr>
	    
	    <tr>
			<td>
				<form:label path="password">
					<spring:message text="Şifre"/>
				</form:label>
			</td>
			
			<td>
				<form:input path="password" />
			</td>
			<td><form:errors path="password" cssClass="error"/></td>
	</tr>
	
	<tr>
		<td>
			<form:label path="authority">
				<spring:message text="Rolü"/>
			</form:label>
		</td>
		
		<td>
			<form:input path="authority" />
		</td>
		<td><form:errors path="authority" cssClass="error"/></td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatBilgi">
				<spring:message text="Bilgilendirme :"/>
			</form:label>
		</td>
		
		<td>
			<form:input path="seyehatBilgi" />
		</td>
		<td><form:errors path="seyehatBilgi" cssClass="error"/></td>
	</tr>	
	
	<tr>
		<td><input type="submit"
					value="<spring:message text="Add User"/>" /></td>
	</tr>	
	</table>
</form:form>




</body>
</html>