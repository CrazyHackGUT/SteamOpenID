<html>
	<head>
		<title>Works.CrazyHackGUT.RU</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		
		<!-- Additional data JS -->
		<script type="text/javascript" src="http://crazyhackgut.ru/wp-includes/js/jquery/jquery.js?ver=1.12.4"></script>
		<script>
			function RequestUserData(SID) {
				// Convert SID
				jQuery.ajax({
					url: 'https://api.crazyhackgut.ru/ISteamFunctions/ConvertSID.php?sid=' + SID,
					dataType: 'json',
					success: function(data, textStatus) {
						document.getElementById("data-sid64").innerHTML = data['SteamID64'];
						document.getElementById("data-sid2").innerHTML = data['SteamID2'];
						document.getElementById("data-sid3").innerHTML = data['SteamID3'];
					}
				});
				
				// Request primary user data
				jQuery.ajax({
					url: 'https://api.crazyhackgut.ru/ISteamFunctions/GetPlayerInformation.php?target=' + SID,
					dataType: 'json',
					success: function(data, textStatus) {
						document.getElementById("data-username").innerHTML = data.response.username;
						document.getElementById("data-avatar").innerHTML = '<img src="' + data.response.avatar.full + '" class="img-thumbnail"/>';
					}
				});
			}
		</script>
		
		<!-- Custom styles -->
		<style>
			html, body {height:100%; margin:0; background-color: #222; color: #999;}
			.bodyclass {padding: 50px;}
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
									<td class="tCenter" id="data-avatar">
									
									</td>
								</tr>
								<tr>
									<td class="tCenter">
										<h2>Привет, <b id="data-username">... загрузка имени ...</b>!</h2>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<table>
							<tbody>
								<tr>
									<td class="tText"><h3>SteamID2: <b id="data-sid2">... загрузка ...</b></h3></td>
								</tr>
								<tr>
									<td class="tText"><h3>SteamID3: <b id="data-sid3">... загрузка ...</b></h3></td>
								</tr>
								<tr>
									<td class="tText"><h3>SteamID64: <b id="data-sid64">... загрузка ...</b></h3></td>
								</tr>
								<br>
								<tr>
									<td class="tText"><center><a role="button" class="btn btn-primary btn-sm" href="?act=deauthorize"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Выйти</a></center></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		
		<script>RequestUserData("{SteamID}");</script>
	</body>
</html>