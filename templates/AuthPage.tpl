<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Works.CrazyHackGUT.RU | Авторизация</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		
		<!-- Auth JS -->
		<!-- <script>{JSAUTH}</script> -->
		<script>
			function Auth() {
				document.location = "{AuthURL}";
			}
		</script>
		
		<!-- Custom styles -->
		<style>
			html, body {height:100%; margin:0; background-color: #222; color: #999;}
			.bodyclass {padding: 5px;}
			.tableMain {height:100%;width:100%;margin: 0 auto;text-align:center;}
			.tText {padding-right: 20px;padding-left: 20px;}
			.tCenter {text-align:center;}
		</style>
	</head>
	<body class="bodyclass">
		<table class="tableMain">
			<tbody>
				<tr>
					<td align="center" valign="center">
						<table>
							<tbody>
								<tr>
									<td class="tCenter">
										<h2>Привет, <b>посетитель</b>!</h2>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<table>
							<tbody>
								<tr>
									<td class="tText"><center><h3>Не желаешь авторизоваться?</h3></center></td>
								</tr>
								<tr>
									<td class="tText"><center>
										<a role="button" class="btn btn-primary btn-sm" href="#" onClick="Auth()"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Авторизоваться</a>
										<a role="button" class="btn btn-default btn-sm" href="http://crazyhackgut.ru/openid_steam/" target="_blank"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Как это работает?</a>
										<a role="button" class="btn btn-info btn-sm" href="https://github.com/CrazyHackGUT/SteamOpenID" target="_blank"><span class="glyphicon glyphicon-hdd" aria-hidden="true"></span> Открыть репозиторий на GitHub</a>
									</center></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>