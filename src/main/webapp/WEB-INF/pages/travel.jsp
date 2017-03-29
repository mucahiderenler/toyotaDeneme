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
  
  <script>
  (function ($) {
	  'use strict';
	  /*global jQuery, $*/
	  /*jslint nomen: true, evil: true*/
	  $.fn.extend({
	    popConfirm: function (options) {
	      var defaults = {
	          title: 'Onay',
	          content: 'Emin misiniz ?',
	          placement: 'right',
	          container: 'body',
	          yesBtn: 'Evet',
	          noBtn: 'Hayır'
	        },
	        last = null;
	      options = $.extend(defaults, options);
	      return this.each(function () {
	        var self = $(this),
	          arrayActions = [],
	          arrayDelegatedActions = [],
	          eventToConfirm,
	          optName,
	          optValue,
	          i,
	          elmType,
	          code,
	          form;
	        // Load data-* attriutes
	        for (optName in options) {
	          if (options.hasOwnProperty(optName)) {
	            optValue = $(this).attr('data-confirm-' + optName);
	            if (optValue) {
	              options[optName] = optValue;
	            }
	          }
	        }
	        // If there are jquery click events
	        if (jQuery._data(this, "events") && jQuery._data(this, "events").click) {
	          // Save all click handlers
	          for (i = 0; i < jQuery._data(this, "events").click.length; i = i + 1) {
	            arrayActions.push(jQuery._data(this, "events").click[i].handler);
	          }
	          // unbind it to prevent it firing
	          $(self).unbind("click");
	        }
	        // If there are jquery delegated click events
	        if (self.data('remote') && jQuery._data(document, "events") && jQuery._data(document, "events").click) {
	          // Save all delegated click handlers that apply
	          for (i = 0; i < jQuery._data(document, "events").click.length; i = i + 1) {
	            elmType = self[0].tagName.toLowerCase();
	            if (jQuery._data(document, "events").click[i].selector && jQuery._data(document, "events").click[i].selector.indexOf(elmType + "[data-remote]") !== -1) {
	              arrayDelegatedActions.push(jQuery._data(document, "events").click[i].handler);
	            }
	          }
	        }
	        // If there are hard onclick attribute
	        if (self.attr('onclick')) {
	          // Extracting the onclick code to evaluate and bring it into a closure
	          code = self.attr('onclick');
	          arrayActions.push(function () {
	            eval(code);
	          });
	          $(self).prop("onclick", null);
	        }
	        // If there are href link defined
	        if (!self.data('remote') && self.attr('href')) {
	          // Assume there is a href attribute to redirect to
	          arrayActions.push(function () {
	            window.location.href = self.attr('href');
	          });
	        }
	        // If the button is a submit one
	        if (self.attr('type') && self.attr('type') === 'submit') {
	          // Get the form related to this button then store submiting in closure
	          form = $(this).parents('form:first');
	          arrayActions.push(function () {
	            // Add the button name / value if specified
	            if(typeof self.attr('name') !== "undefined") {
	              $('<input type="hidden">').attr('name', self.attr('name')).attr('value', self.attr('value')).appendTo(form);
	            }
	            form.submit();
	          });
	        }
	        self.popover({
	          trigger: 'manual',
	          title: options.title,
	          html: true,
	          placement: options.placement,
	          container: options.container,
	          //Avoid using multiline strings, no support in older browsers.
	          content: options.content + '<p class="button-group" style="margin-top: 10px; text-align: center;"><button type="button" class="btn btn-small confirm-dialog-btn-abort">' + options.noBtn + '</button> <button type="button" class="btn btn-small btn-danger confirm-dialog-btn-confirm">' + options.yesBtn + '</button></p>'
	        }).click(function (e) {
	          if (last && last !== self) {
	            last.popover('hide').removeClass('popconfirm-active');
	          }
	          last = self;
	        });
	        $(document).on('click', function () {
	          if (last) {
	            last.popover('hide').removeClass('popconfirm-active');
	          }
	        });
	        self.bind('click', function (e) {
	          eventToConfirm = e;
	          e.preventDefault();
	          e.stopPropagation();
	          $('.popconfirm-active').not(self).popover('hide').removeClass('popconfirm-active');
	          self.popover('show').addClass('popconfirm-active');
	          $(document).find('.popover .confirm-dialog-btn-confirm').one('click', function (e) {
	            for (i = 0; i < arrayActions.length; i = i + 1) {
	              arrayActions[i].apply(self);
	            }
	            for (i = 0; i < arrayDelegatedActions.length; i = i + 1) {
	              arrayDelegatedActions[i].apply(self, [eventToConfirm.originalEvent]);
	            }
	            self.popover('hide').removeClass('popconfirm-active');
	          });
	          $(document).find('.popover .confirm-dialog-btn-abord').bind('click', function (e) {
	            self.popover('hide').removeClass('popconfirm-active');
	          });
	        });
	      });
	    }
	  });
	}(jQuery));
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
	    				<span class="glyphicon glyphicon-plus"></span> Add
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
	
	
	<c:if test="${ not empty userList }">
	<a href="<c:url value='/travels/exportExcel'/>">
	<button type="button" class="btn btn-info">
		<span class="glyphicon glyphicon-download"></span>Export to Excel
		</button>
	</a>
	</c:if>

<c:url value="/j_spring_security_logout" var="logoutUrl" />


</body>