<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Client</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Client</h1>
		<form name="form_client" action="<c:url value="/seller/client"/>" method="post">
			<span class="form-message">${message}</span>
			<c:if test="${not empty client && client.id > 0}">
				<input type="hidden" name="client_id" value="<c:out value="${client.id}"/>" required/>
			</c:if>
			<fieldset class="row1">
				<legend>Identité</legend>
				<div>
					<label class="label-input">Nom</label>
					<input type="text" name="client_name" value="<c:out value="${client.name}"/>" required/>
				</div>
			</fieldset>
			<fieldset class="row1">
				<legend>Coordonnées</legend>
				<div>
					<label class="label-input">Téléphone</label>
					<input type="tel" name="client_phone" value="<c:out value="${client.phone}"/>" required/>
				</div>
				<div>
					<label class="label-input">Email</label>
					<input type="email" name="client_email" value="<c:out value="${client.email}"/>" />
				</div>
			</fieldset>
			<fieldset class="row1">
				<legend>Adresse</legend>
				<div>
					<label class="label-input">Rue</label>
					<input type="text" name="client_address_location" value="<c:out value="${client.address.location}"/>" />
				</div>
				<div>
					<label class="label-input">Code postal</label>
					<input type="number" name="client_address_zipcode" min="0" value="<c:out value="${client.address.zipCode}"/>" />
				</div>
				<div>
					<label class="label-input">Ville</label>
					<input type="text" name="client_address_city" value="<c:out value="${client.address.city}"/>" required/>
				</div>
				<div>
					<label class="label-input">Pays</label>
					<select name="client_address_countries" required>
						<option value="Comores" selected="selected">Comores</option>
					</select>
				</div>
			</fieldset>
			<table class="buttons">
				<tr>
					<td><input type="submit" class="button" value="Enregistrer"/></td>
					<c:if test="${not empty client}">
						<td>
							<a class="button" href="
								<c:url value="/seller/client"/>">
								Nouveau
							</a>
						</td>
					</c:if>
				</tr>
			</table>
		</form>
		<div class="csstable">
			<table>
				<tr>
					<td class="td-width-xsmall">N°</td>
					<td>Nom</td>
				</tr>
				<c:forEach var="client" items="${clients}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/seller/client"><c:param name="id" value="${client.id}"/></c:url>"><c:out value="${client.name}"/></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>