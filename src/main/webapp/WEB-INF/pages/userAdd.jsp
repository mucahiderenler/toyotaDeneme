<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page pageEncoding="UTF-8"%>
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
	<script>
	function houseclean()
	{
	if (document.getElementById('bilgi').checked == true)
	  {
		  document.getElementById('seyehatGun').removeAttribute('disabled');
	  }
	else
	  {
		  document.getElementById('seyehatGun').setAttribute('disabled','disabled');
	  }
	}
	
	function houseclean2()
	{
	if (document.getElementById('bilgi2').checked == true)
	  {
		  document.getElementById('seyehatZaman').removeAttribute('disabled');
	  }
	else
	  {
		  document.getElementById('seyehatZaman').setAttribute('disabled','disabled');
	  }
	}
	</script>
	
<title>Add user</title>
</head>
<body>

<c:url value="/j_spring_security_logout" var="logoutUrl" />

<ul class="nav pull-right">
  <li id="fat-menu" class="dropdown pull-right">
    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown"> ${userSession.username} <b class="caret"></b></a>
    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
    <li><a tabindex="-1" href="/hihi/travels">Seyehatler</a></li>
    <c:if test="${not empty admin }">
    <li><a tabindex="-1" href="/hihi/users">Kullanıcı Listesi</a></li>
    </c:if>
    <li><a tabindex="-1" href="/hihi/userAdd/${userSession.id}">Kişisel Bilgiler</a></li>
    <li class="divider"></li>
    <li><a tabindex="-1" href="${logoutUrl}">Çıkış</a></li>
    </ul>
  </li>
</ul>

<c:url var="addAction" value="/userAdd" ></c:url>
<form:form action="${addAction}" commandName="user">
	<table>
		<tr>
			<td>
				<form:hidden path="id" />
			</td>
		</tr>
	
		<tr>
			<td>
				<form:label path="username">
					<spring:message text="Kullanıcı Adı:"/>
				</form:label>
			</td>
			
			<td>
				<form:input type="username" path="username" class="form-control mx-sm-3" />
			</td>
			<td><form:errors path="username" cssClass="error"/></td>
	    </tr>
	    
	    <tr>
			<td>
				<form:label path="password">
					<spring:message text="Şifre:"/>
				</form:label>
			</td>
			
			<td>
				<form:input type="password" path="password" class="form-control mx-sm-3" aria-describedby="passwordHelpInline"/>
			</td>
			<td><form:errors path="password" cssClass="error"/></td>
	</tr>
	<tr>
		<c:if test="${not empty bolumAdiandId}">
			
			<td>
				<form:label path="bolumId">
					<spring:message text="Bolum adı:"/>
				</form:label>
			</td>
			
			<td>
				<div class="dropdown">
					<form:select path="bolumId" items="${bolumAdiandId}"/>
				</div>
			</td>
		</c:if>
		
	</tr>
	
	<tr>
		
		<td>
			<form:label path="authority">
				<spring:message text="Rolü :"/>
			</form:label>
		</td>
		
		<td>
			<select id="authority" name="authority">
				  <option value="ROLE_ADMIN">ROLE_ADMIN</option>
				  <option value="ROLE_USER">ROLE_USER</option>  
			</select>
		</td>
		<td><form:errors path="authority" cssClass="error"/></td>
	</tr>
	
	<tr>
		<td>
				<spring:message text="<b>Bilgilendirme :</b>"/>
		</td>
		
		<td>
		
		<input type="checkbox" id="bilgi" name="bilgi"  onclick="javascript:houseclean();"/>
			<select id="seyehatGun" name="seyehatGun" disabled>
			  <option value="Pazartesi">Pazartesi</option>
			  <option value="Salı">Salı</option>
			  <option value="Çarşamba">Çarşamba</option>
			  <option value="Perşembe">Perşembe</option>
			  <option value="Cuma">Cuma</option>
			  <option value="Cumartesi">Cumartesi</option>
			  <option value="Pazar">Pazar</option>
			</select>
		</td>
			<td>
				<form:hidden path="seyehatGun" />
			</td>
		<td>
			<input type="checkbox" id="bilgi2" name="bilgi2" value="yes" onclick="javascript:houseclean2();"/>
			<select id="seyehatZaman" name="seyehatZaman" disabled>
			  <option value="Hafta">Hafta</option>
			  <option value="Ay">Ay</option>
			</select>
		</td>
		<td>
				<form:hidden path="seyehatZaman" />
		</td>
	</tr>	
	
	
	<tr>
		<td colspan="2">
			<c:if test="${user.id != 0}">
				<input type="submit" class="btn btn-success"
					value="<spring:message text="Güncelle"/>" />
				<a href="/hihi/users" class="btn btn-danger">İptal</a>
			</c:if>
			<c:if test="${user.id == 0}">
				<input type="submit" class="btn btn-success"
					value="<spring:message text="Ekle"/>" />
				<a href="/hihi/users" class="btn btn-danger">İptal</a>
			</c:if>
		</td>
	</tr>
	</table>
</form:form>




</body>
</html>