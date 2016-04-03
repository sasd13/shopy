<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Connexion</title>
		<jsp:include page="inc/css-commons.jsp"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css"/>
	</head>
	
	<body>
		<h1>Gestion de ventes</h1>
		<form name="form_login" action="<c:url value="/login"/>" method="post">
			<span class="form-message">${message}</span>
			<fieldset class="row1">
				<legend>Connexion</legend>
				<div>
					<label class="label-input">Identifiant</label>
					<input type="text" name="username" required/>
				</div>
				<div>
					<label class="label-input">Mot de passe</label>
					<input type="password" name="password" required/>
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