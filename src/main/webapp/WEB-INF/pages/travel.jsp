<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@page pageEncoding="UTF-8"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="<c:url value="javascript/deleteConfirmation.js" />"></script>  
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
</head>

<body>
<c:url value="/j_spring_security_logout" var="logoutUrl" />

<ul class="nav pull-right">
  <li id="fat-menu" class="dropdown pull-right">
    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown"> ${userSession.username} <b class="caret"></b></a>
    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
    <li><a tabindex="-1" href="/hihi/travels">Seyehatler</a></li>
    <c:if test="${not empty userNameList }">
    <li><a tabindex="+1" href="/hihi/users">Kullanıcı Listesi</a></li>
    </c:if>
    <li><a tabindex="+1" href="/hihi/userAdd/${userSession.id}">Kişisel Bilgiler</a></li>
    <li class="divider"></li>
    <li><a tabindex="+1" href="${logoutUrl}">Çıkış</a></li>
    </ul>
  </li>
</ul>

<br><br>
<c:url var="searchByName" value="/travels/byName" ></c:url>
<c:if test="${not empty userNameList }">
<form:form action="${searchByName}" commandName="travel">
	Kullanıcı: 
	<form:select path="userId" items="${userNameList}" >
	</form:select>
	<span style="display:inline-block; width:12;"></span><button type="submit"><span class="glyphicon glyphicon-search"></span></button>
</form:form>
</c:if>
<br>
<br>
<c:url var="searchAction" value="/travels" ></c:url>
<form:form action="${searchAction}" commandName="travel">	
	<table>
		<tr>
		<td>
			<form:label path="seyehatBas">
				<spring:message text="Başlangıç"/>
			</form:label>
		</td>
		
		<td>
			<form:label path="seyehatSon">
			<span style="display:inline-block; width:12;"></span>
				<spring:message text="Bitiş"/>
			</form:label>
		</td>
		</tr>
		<tr>
		<td>
			<form:input path="seyehatBas" cssClass="datepicker"/>
		</td>
		<td><form:errors path="seyehatBas" cssClass="error"/></td>
		<td>
			<form:input path="seyehatSon" cssClass="datepicker" />
		</td>
		<td><form:errors path="seyehatSon" cssClass="error"/></td>
		<td><span style="display:inline-block; width:12;"></span><button type="submit"><span class="glyphicon glyphicon-search">
			</span></button>
		</td>
	</tr>
	</table>
</form:form>
	
	<table class="table table-striped table-bordered">
			<thead>
	      <tr>
	      	<th>Bolümü</th>
	      	<th>Müdürü</th>
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
	    				<span class="glyphicon glyphicon-plus"></span> Ekle
	  				</button>
  				</a></th>
	      </tr>
	    </thead>
	    <c:forEach items="${travelListDate}" var="travel">
			<tr>
			<c:forEach items="${userList}" var="user">
				<c:forEach items="${bolumList}" var="bolum">
				<c:if test="${user.id == travel.userId and bolum.id == user.bolumId}">
					<td>${bolum.bolumAdi}</td>
		  			<td>${bolum.bolumMudur}</td>
					<td>${user.username}</td>
					<td>${travel.seyehatBas}</td>
					<td>${travel.seyehatSon}</td>
					<td>${travel.seyehatYeri}</td>
					<td>${travel.gidisAmac}</td>
					<td>${travel.seyehatMik}</td>
					<td>${travel.projeKod}</td>
					<td>
					<a href="<c:url value='/travels/remove/${travel.id}' />" class="link">
					<button type="button" class="btn btn-danger">
		    				<span class="glyphicon glyphicon-minus"></span> Sil
		  				</button> 				
		  			</a>
		  				<a href="<c:url value='/travels/add/${travel.id}' />">
		  				<button type="button" class="btn btn-warning">
		    				<span class="glyphicon glyphicon-pencil"></span> Düzenle
		  				</button>
		  				</a>
		  			</td>
		  			</c:if>
		  			</c:forEach>
	  			</c:forEach>	
		  			<c:forEach items="${bolumList}" var="bolum">
		  				<c:if test="${bolum.id == user.bolumId && user.id == travel.userId }">
		  				<td>${bolum.bolumAdi}</td>
		  				<td>${bolum.bolumMudur}</td>
						<td>${user.username}</td>
						<td>${travel.seyehatBas}</td>
						<td>${travel.seyehatSon}</td>
						<td>${travel.seyehatYeri}</td>
						<td>${travel.gidisAmac}</td>
						<td>${travel.seyehatMik}</td>
						<td>${travel.projeKod}</td>
						<td>
						<a href="<c:url value='/travels/remove/${travel.id}' />" class="link">
						<button type="button" class="btn btn-danger">
			    				<span class="glyphicon glyphicon-minus"></span> Sil
			  				</button>
			  				
			  			</a>
			  				<a href="<c:url value='/travels/add/${travel.id}' />">
			  				<button type="button" class="btn btn-warning">
			    				<span class="glyphicon glyphicon-pencil"></span> Düzenle
			  				</button>
			  				</a>
			  			</td>
			  			</c:if>
	  				</c:forEach>		 
			</tr>
	</c:forEach>
	<c:forEach items="${travelList}" var="travel">
		<tr>
			<c:forEach items="${userList}" var="user">
				<c:forEach items="${bolumList}" var="bolum">
				<c:if test="${user.id == travel.userId && bolum.id == user.bolumId}">
					<td>${bolum.bolumAdi}</td>
		  			<td>${bolum.bolumMudur}</td>
					<td>${user.username}</td>
					<td>${travel.seyehatBas}</td>
					<td>${travel.seyehatSon}</td>
					<td>${travel.seyehatYeri}</td>
					<td>${travel.gidisAmac}</td>
					<td>${travel.seyehatMik}</td>
					<td>${travel.projeKod}</td>
					<td>
					<a href="<c:url value='/travels/remove/${travel.id}' />" class="link">
					<button type="button" class="btn btn-danger">
		    				<span class="glyphicon glyphicon-minus"></span> Sil
		  				</button> 				
		  			</a>
		  				<a href="<c:url value='/travels/add/${travel.id}' />">
		  				<button type="button" class="btn btn-warning">
		    				<span class="glyphicon glyphicon-pencil"></span> Düzenle
		  				</button>
		  				</a>
		  			</td>
		  			</c:if>
		  			</c:forEach>
	  			</c:forEach>
  			
  			<c:forEach items="${bolumList}" var="bolum">
  				<c:if test="${bolum.id == user.bolumId && user.id == travel.userId }">
  				<td>${bolum.bolumAdi}</td>
  				<td>${bolum.bolumMudur}</td>
				<td>${user.username}</td>
				<td>${travel.seyehatBas}</td>
				<td>${travel.seyehatSon}</td>
				<td>${travel.seyehatYeri}</td>
				<td>${travel.gidisAmac}</td>
				<td>${travel.seyehatMik}</td>
				<td>${travel.projeKod}</td>
				<td>
				<a href="<c:url value='/travels/remove/${travel.id}' />" class="link">
				<button type="button" class="btn btn-danger">
	    				<span class="glyphicon glyphicon-minus"></span> Sil
	  				</button>
	  				
	  			</a>
	  				<a href="<c:url value='/travels/add/${travel.id}' />">
	  				<button type="button" class="btn btn-warning">
	    				<span class="glyphicon glyphicon-pencil"></span> Düzenle
	  				</button>
	  				</a>
	  			</td>
	  			</c:if>
  			</c:forEach>	
		</tr>
	</c:forEach>
	</table>
	
	
	<c:if test="${ not empty userList }">
	<a href="<c:url value='/travels/exportExcel'/>">
	<button type="button" class="btn btn-info">
		<span class="glyphicon glyphicon-download"></span>Export to Excel
		</button>
	</a>
	</c:if>

<c:url value="/j_spring_security_logout" var="logoutUrl" />


</body>