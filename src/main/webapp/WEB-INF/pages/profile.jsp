<%@page pageEncoding="UTF-8"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>	

<body>
	<div class="container">
		<div class="table-responsive">
		<table class="table table-striped table-bordered">
			<thead>
	      <tr>
	        <th>#</th>
	        <th>Bölümü</th>
	        <th>Müdürü</th>
	        <th>Seyahat Başlangıcı</th>
	        <th>Seyehat Sonu</th>
	        <th>Seyehat Yeri</th>
	        <th>Gidiş Amacı</th>
	        <th>Proje Kodu</th>
	        <th>İşlemler</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>1</td>
	        <td>TME-TK</td>
	        <td>Pitt Cane</td>
	        <td>11/01/2017</td>
	        <td>11/02/2017</td>
	        <td>Usa</td>
	        <td>proje1</td>
	        <td>A8</td>
	        <td><button type="button" class="btn btn-default">
    				<span class="glyphicon glyphicon-minus"></span> Delete
  				</button>
  				<button type="button" class="btn btn-default">
    				<span class="glyphicon glyphicon-pencil"></span> Modify
  				</button>
  			</td>
	      </tr>
	    </tbody>
	  </table>
		</div>
	</div>
</body>
</html>