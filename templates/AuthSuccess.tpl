<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Works.CrazyHackGUT.RU</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		
		<!-- Additional data JS -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script>
			var LoadSteamID = false;
			var LoadMainData = false;
			var TimerID = 0;
			
			function RequestUserData(SID) {
				// Graphic fixes
				LoadSteamID = false;
				LoadMainData = false;
				document.getElementById("state-update").innerHTML = "Загружаю информацию...";
				
				// Convert SID
				jQuery.ajax({
					url: 'https://api.crazyhackgut.ru/ISteamFunctions/ConvertSID.php?sid=' + SID,
					dataType: 'json',
					success: function(data, textStatus) {
						document.getElementById("data-sid64").innerHTML = data['SteamID64'];
						document.getElementById("data-sid2").innerHTML = data['SteamID2'].replace("STEAM_1", "STEAM_0");
						document.getElementById("data-sid3").innerHTML = data['SteamID3'];
						LoadSteamID = true;
						OnLoadingData();
					}
				});
				
				// Request primary user data
				jQuery.ajax({
					url: 'https://api.crazyhackgut.ru/ISteamFunctions/GetPlayerInformation.php?target=' + SID,
					dataType: 'json',
					success: function(data, textStatus) {
						document.getElementById("data-username").innerHTML = data.response.username;
						document.getElementById("data-avatar").innerHTML = '<img src="' + data.response.avatar.full + '" class="img-thumbnail"/>';
						LoadMainData = true;
						OnLoadingData();
					}
				});
			}
			
			function OnLoadingData() {
				if (LoadMainData == true && LoadSteamID == false)
					document.getElementById("state-update").innerHTML = "Ожидание ответа сервера-конвертера SteamID...";
				else if (LoadMainData == false && LoadSteamID == true)
					document.getElementById("state-update").innerHTML = "Ожидание ответа сервера информации об аккаунте...";
				else if (LoadMainData == true && LoadSteamID == true)
					document.getElementById("state-update").innerHTML = "Обновить сведения об аккаунте";
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
									<td class="tCenter" id="data-avatar">
									
									</td>
								</tr>
								<tr>
									<td class="tCenter">
										<h2>Привет, <b id="data-username">unnamed</b>!</h2>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<table>
							<tbody>
								<tr>
									<td class="tText"><center><h3>SteamID2: <b id="data-sid2">STEAM_0:0</b></h3></center></td>
								</tr>
								<tr>
									<td class="tText"><center><h3>SteamID3: <b id="data-sid3">[U:1:0]</b></h3></center></td>
								</tr>
								<tr>
									<td class="tText"><center><h3>SteamID64: <b id="data-sid64">76561197960265728</b></h3></center></td>
								</tr>
								<br>
								<tr>
									<td class="tText"><center>
										<a role="button" class="btn btn-default btn-sm" href="#Steam_UpdateInformation" onClick="RequestUserData('{SteamID}')"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> <span id="state-update">Обновить сведения об аккаунте</span></a>
										<a role="button" class="btn btn-primary btn-sm" href="?act=deauthorize"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Выйти</a>
									</center></td>
								</tr>
								<tr>
									<td class="tText"><center style="padding-top: 5px;">
										<a role="button" class="btn btn-info btn-sm" href="https://github.com/CrazyHackGUT/SteamOpenID" target="_blank"><span class="glyphicon glyphicon-hdd" aria-hidden="true"></span> Открыть репозиторий на GitHub</a>
									</center></td>
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
