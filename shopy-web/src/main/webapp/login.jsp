<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Connexion</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<h1>Gestion de ventes</h1>
		<form name="form_login" action="<c:url value="/login"/>" method="post">
			<span class="form-message">${message}</span>
			<fieldset class="row1">
				<legend>Connexion</legend>
				<div>
					<label class="label-input">Identifiant</label>
					<input type="text" name="user_login" required/>
				</div>
				<div>
					<label class="label-input">Mot de passe</label>
					<input type="password" name="user_password" required/>
				</div>
			</fieldset>
			<div class="buttons">
				<input type="submit" class="button" value="Entrer"/>
			</div>
		</form>
		<div class="content">
			<a href="<c:url value="/register"/>">Nouveau utilisateur</a>
		</div>
	</body>
</html>