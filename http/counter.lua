return function (connection, req, args)
   dofile("httpserver-header.lc")(connection, 200, 'html')

   connection:send([===[
<!DOCTYPE html>
<html>
	<head>
		<script>
			document.addEventListener("DOMContentLoaded", function ()
				{
					var number = window.location.search;
					if ( number == '')  number = 0;
					else number = number.substring(1,);

					number = parseInt(number) + 1;
					document.getElementById('count').innerHTML = number;
					window.location.search = '?' + number;
				}
			)
		</script>
	</head>
	<body>
		<br>This page reloads itself as fast as it can to test the server.</br>
		<br>It is meant as a stress test to see when and if the server fails.</br>
		<h1 id="count" class="countclass">
		</h1>
	</body>
</html>
]===])
end
