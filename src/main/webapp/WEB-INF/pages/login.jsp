<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>Login Form</title>
  
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value="css/login.css" />">
</head>
<body>
  <div class="login">
  <h1> Login</h1>
  <h6>${message}</h6>
   <form id="loginForm" method="post" action="<c:url value='j_spring_security_check' />">
      <input type="text" name="username" placeholder="Kullanıcı Adı" />
      <input type="password" name="password"  placeholder="Şifre"/>  
      <input type="submit" class="btn btn-primary btn-block btn-large btn-success" value="Giriş" />
   
   </form>
   </div>
</body>
</html>