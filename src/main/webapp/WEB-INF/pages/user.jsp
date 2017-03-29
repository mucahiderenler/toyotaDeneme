<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Kullanıcı Adı</th>
		    <th>Bölümü</th>
		    <th>Bölüm Müdürü</th>
		    <th>Rolü</th>
		    <th>Seyehat Bilgilendirme</th>
	        <th>İşlemler   <span style="display:inline-block; width:10;"></span>
	          <a href="<c:url value='/userAdd' />">
	  				<button type="button" class="btn btn-success">
	    				<span class="glyphicon glyphicon-plus"></span> Add
	  				</button>
  				</a>
  			</th>
        </tr>
    </thead>
    <tbody>
     	<c:forEach items="${userList}" var="user">
     	<tr>
				<c:forEach items="${bolumList}" var="bolum">
				<c:if test="${bolum.id == user.bolumId}">
					<td>${user.username}</td>
					<td>${bolum.bolumAdi}</td>
		  			<td>${bolum.bolumMudur}</td>
		  			<td>${user.authority}</td>
		  			<td>${user.seyehatBilgi}</td>
		  			<td>
					<a href="<c:url value='/travels/remove/${travel.id}' />" class="link">
					<button type="button" class="btn btn-danger">
		    				<span class="glyphicon glyphicon-minus"></span> Delete
		  				</button> 				
		  			</a>
		  				<a href="<c:url value='/travels/add/${travel.id}' />">
		  				<button type="button" class="btn btn-warning">
		    				<span class="glyphicon glyphicon-pencil"></span> Modify
		  				</button>
		  				</a>
		  			</td>
		  			</c:if>
		  			</c:forEach>
	  			</c:forEach>
     
    </tbody>
     
</table>
	

</body>
</html>