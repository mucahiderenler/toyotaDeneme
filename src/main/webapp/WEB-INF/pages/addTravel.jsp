<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Person Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Travel
</h1>

<c:url var="addAction" value="/travels/add" ></c:url>

<form:form action="${addAction}" commandName="travel">
<table>
	<c:if test="${!empty travel.id}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="id"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
			<br> 
		</td>
		</tr>
		<tr>
		<td>
			<form:label path="isim">
				<spring:message text="İsim"/>
			</form:label>
		</td>
		<td>
			<form:input path="isim" />
			
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="bolum">
				<spring:message text="Bölum"/>
			</form:label>
		</td>
		<td>
			<form:input path="bolum" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="mudur">
				<spring:message text="Müdür"/>
			</form:label>
		</td>
		<td>
			<form:input path="mudur" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatBas">
				<spring:message text="Seyehat Başlangıcı"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatBas" />
		</td>
	</tr>
	<tr>
	
	<tr>
		<td>
			<form:label path="seyehatSon">
				<spring:message text="Seyehat Sonu"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatSon" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatYeri">
				<spring:message text="Seyehat Yeri"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatYeri" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="gidisAmac">
				<spring:message text="Gidiş Amacı"/>
			</form:label>
		</td>
		<td>
			<form:input path="gidisAmac" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatMik">
				<spring:message text="Seyehat Tutarı"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatMik" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="projeKod">
				<spring:message text="Proje Kodu"/>
			</form:label>
		</td>
		<td>
			<form:input path="projeKod" />
		</td>
	</tr>
	</c:if>
	<c:if test="${empty travel.id}">
	<tr>
		<td>
			<form:label path="isim">
				<spring:message text="İsim"/>
			</form:label>
		</td>
		<td>
			<form:input path="isim" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="bolum">
				<spring:message text="bolum"/>
			</form:label>
		</td>
		<td>
			<form:input path="bolum" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="mudur">
				<spring:message text="Müdür"/>
			</form:label>
		</td>
		<td>
			<form:input path="mudur" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatBas">
				<spring:message text="Seyehat Başlangıcı"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatBas" />
		</td>
	</tr>
	<tr>
	
	<tr>
		<td>
			<form:label path="seyehatSon">
				<spring:message text="Seyehat Sonu"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatSon" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatYeri">
				<spring:message text="Seyehat Yeri"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatYeri" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="gidisAmac">
				<spring:message text="Gidiş Amacı"/>
			</form:label>
		</td>
		<td>
			<form:input path="gidisAmac" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatMik">
				<spring:message text="Seyehat Tutarı"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatMik" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="projeKod">
				<spring:message text="Proje Kodu"/>
			</form:label>
		</td>
		<td>
			<form:input path="projeKod" />
		</td>
	</tr>
	</c:if>
	<tr>
		<td colspan="2">
			<c:if test="${!empty travel.id}">
				<input type="submit"
					value="<spring:message text="Edit Travel"/>" />
			</c:if>
			<c:if test="${empty travel.id}">
				<input type="submit"
					value="<spring:message text="Add Travel"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>

</body>
</html>