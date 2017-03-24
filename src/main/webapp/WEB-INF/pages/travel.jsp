<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@page pageEncoding="UTF-8"%>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>


<c:if test="${!empty travelList}">
	<table class="table table-striped table-bordered">
			<thead>
	      <tr>
	        <th>Seyehat Eden</th>
	        <th>Seyehat Başlangıcı</th>
	        <th>Seyehat Sonu</th>
	        <th>Seyehat Yeri</th>
	        <th>Gidiş Amacı</th>
	        <th>Seyehat Miktarı</th>
	        <th>Proje Kodu</th>
	        <th>İşlemler   <span style="display:inline-block; width:10;"></span>
	          <a href="<c:url value='/travels/add/0' />">
	  				<button type="button" class="btn btn-success">
	    				<span class="glyphicon glyphicon-plus"></span> Add
	  				</button>
  				</a></th>
	      </tr>
	    </thead>
	<c:forEach items="${travelList}" var="travel">
		<tr>
		<c:forEach items="${userList}" var="user">
		<c:if test="${user.id == travel.userId }">
			<td>${user.username}</td>
			<td>${travel.seyehatBas}</td>
			<td>${travel.seyehatSon}</td>
			<td>${travel.seyehatYeri}</td>
			<td>${travel.gidisAmac}</td>
			<td>${travel.seyehatMik}</td>
			<td>${travel.projeKod}</td>
			<td>
			<a href="<c:url value='/travels/remove/${travel.id}' />">
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
		</tr>
	</c:forEach>
	</table>
</c:if>

</body>