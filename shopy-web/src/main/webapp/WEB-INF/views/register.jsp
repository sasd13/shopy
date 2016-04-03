<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Nouveau utilisateur</title>
		<jsp:include page="inc/css-commons.jsp"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css"/>
	</head>
	
	<body>
		<h1>Nouveau utilisateur</h1>
		<c:choose>
			<c:when test="${registered}">
				<div class="content">
					<p>Utilisateur enregistré</p>
					<br/>
					<p>Votre identifiant : <b><c:out value="${message}"/></b></p>
					<br/>
					<p>Un administrateur devra activer votre compte pour vous connecter</p>
					<br/>
				</div>
			</c:when>
			<c:otherwise>
				<form name="form_profile" action="<c:url value="/register"/>" method="post">
					<span class="form-message">${message}</span>
					<fieldset class="row1">
						<legend>Identité</legend>
						<div>
							<label class="label-input">Prénom</label>
							<input type="text" name="user_firstname" value="<c:out value="${user.firstName}"/>" required/>
						</div>
						<div>
							<label class="label-input">Nom</label>
							<input type="text" name="user_lastname" value="<c:out value="${user.lastName}"/>" required/>
						</div>
					</fieldset>
					<fieldset class="row1">
						<legend>Connexion</legend>
						<div>
							<label class="label-input">Compte</label>
							<input type="radio" name="user_type" value="seller" checked /><label for="seller" class="label-radio">Vendeur</label>
							<input type="radio" name="user_type" value="admin" /><label for="admin" class="label-radio">Gestionnaire</label>
						</div>
						<div>
							<label class="label-input">Mot de passe</label>
							<input type="password" name="user_password" required/>
							<span>4 caractères minimums</span>
						</div>
						<div>
							<label class="label-input">Confirmer mot de passe</label>
							<input type="password" name="user_confirmpassword" required/>
						</div>
					</fieldset>
					<fieldset class="row1">
						<legend>Récupération du mot de passe</legend>
						<div>
							<label class="label-input">Email</label>
							<input type="email" name="user_email" value="<c:out value="${user.email}"/>" required/>
						</div>
					</fieldset>
					<div class="buttons">
						<input type="submit" class="button" value="Enregistrer"/>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
		<div class="content">
			<a href="<c:url value="/login"/>">Connexion</a>
		</div>
	</body>
</html>