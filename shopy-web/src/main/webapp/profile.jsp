<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Compte</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Compte</h1>
		<form name="form_profile" action="<c:url value="/profile"/>" method="post">
			<span class="form-message">${message}</span>
			<input type="hidden" name="user_id" value="<c:out value="${user.id}"/>" required/>
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
				<legend>Modification du mot de passe</legend>
				<div>
					<label class="label-input">Mot de passe actuel</label>
					<input type="password" name="user_oldpassword"/>
				</div>
				<div>
					<label class="label-input">Nouveau mot de passe</label>
					<input type="password" name="user_password"/>
				</div>
				<div>
					<label class="label-input">Confirmer mot de passe</label>
					<input type="password" name="user_confirmpassword"/>
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
	</body>
</html>