<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
	<title>Person Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
		.ui-datepicker-trigger {height:20px }
		.error {
        color: red; font-weight: bold;}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  	$(function(){
  	     $(".datepicker").datepicker({
  	    	constrainInput: true,
            showOn: 'button',
            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
            buttonImageOnly: true
  	     });    
  	     $( ".datepicker" ).datepicker('option', 'dateFormat' , 'mm/dd/yy');
  	  });
  </script>
</head>
<body>



<c:url var="addAction" value="/travels/add" ></c:url>
<span class="error">${travel.validErrorMessage}</span>
<form:form action="${addAction}" commandName="travel">
<table>

	<tr>
		<td>
			<form:hidden path="id" />
		</td>
	</tr>
	

	<tr>
	<c:if test="${travel.userId != 0 && not empty userNameList}">
		<td>
			<form:select path="userId" items="${userNameList}" disabled= 'true' />
		</td>
	</c:if>
	
	<c:if test="${travel.userId == 0 && not empty userNameList}">
		<td>
			<form:select path="userId" items="${userNameList}" />
		</td>
	</c:if>
	<c:if test="${!(travel.userId == 0 && not empty userNameList)}">
		<td>
			<form:hidden path="userId" value="${user.id}"/>
		</td>
	</c:if>
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
		<td><form:errors path="seyehatYeri" cssClass="error"/></td>
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
		<td><form:errors path="gidisAmac" cssClass="error"/></td>
	</tr>
	
	<tr>
		<td>
			<form:label path="seyehatBas">
				<spring:message text="Seyehat Başlangıcı"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatBas" cssClass="datepicker"  />
		</td>
		<td><form:errors path="seyehatBas" cssClass="error"/></td>
	</tr>	
	<tr>
		<td>
			<form:label path="seyehatSon">
				<spring:message text="Seyehat Sonu"/>
			</form:label>
		</td>
		<td>
			<form:input path="seyehatSon" cssClass="datepicker" />
		</td>
		<td><form:errors path="seyehatSon" cssClass="error"/></td>
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
		<td><form:errors path="seyehatMik" cssClass="error"/></td>
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
		<td><form:errors path="projeKod" cssClass="error"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${travel.id != 0}">
				<input type="submit"
					value="<spring:message text="Edit Travel"/>" />
			</c:if>
			<c:if test="${travel.id == 0}">
				<input type="submit"
					value="<spring:message text="Add Travel"/>" />
			</c:if>
		</td>
	</tr>
</table>
</form:form>
</body>
</html>