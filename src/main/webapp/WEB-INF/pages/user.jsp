<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="<c:url value="javascript/deleteConfirmation.js" />"></script>
  <script type="text/javascript">
			$(document).ready(function() {
				// Basic confirmation
				$(".link").popConfirm();
				
				// Custom Title, Content and Placement
				$(".button").popConfirm({
					title: "Sil ?",
					content: "Emin misiniz?",
					placement: "bottom"
				});
			});
	</script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users</title>
</head>
<body>
<c:url value="/j_spring_security_logout" var="logoutUrl" />

<ul class="nav pull-right">
  <li id="fat-menu" class="dropdown pull-right">
    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown"> ${user.username} <b class="caret"></b></a>
    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
    <li><a tabindex="-1" href="/hihi/travels">Seyehatler</a></li>
    <li><a tabindex="-1" href="/hihi/users">Kullanıcı Listesi</a></li>
    <li><a tabindex="-1" href="/hihi/userAdd/${user.id}">Kişisel Bilgiler</a></li>
    <li class="divider"></li>
    <li><a tabindex="-1" href="${logoutUrl}">Çıkış</a></li>
    </ul>
  </li>
</ul>

<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Kullanıcı Adı</th>
		    <th>Bölümü</th>
		    <th>Bölüm Müdürü</th>
		    <th>Rolü</th>
		    <th>Seyehat Bilgilendirme</th>
	        <th>İşlemler   <span style="display:inline-block; width:10;"></span>
	          <a href="<c:url value='/userAdd/0' />">
	  				<button type="button" class="btn btn-success">
	    				<span class="glyphicon glyphicon-plus"></span> Ekle
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
		  			<td>${user.seyehatGun}${user.seyehatZaman}
		  			<td>
					<a href="<c:url value='/users/remove/${user.id}' />" class="link">
					<button type="button" class="btn btn-danger">
		    				<span class="glyphicon glyphicon-minus"></span> Sil
		  				</button> 				
		  			</a>
		  				<a href="<c:url value='/userAdd/${user.id}' />">
		  				<button type="button" class="btn btn-warning">
		    				<span class="glyphicon glyphicon-pencil"></span> Düzenle
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