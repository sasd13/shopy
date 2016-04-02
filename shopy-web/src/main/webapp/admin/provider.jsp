<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Fournisseur</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Fournisseur</h1>
		<form name="form_provider" action="<c:url value="/admin/provider"/>" method="post">
			<span class="form-message">${message}</span>
			<c:if test="${not empty provider && provider.id > 0}">
				<input type="hidden" name="provider_id" value="<c:out value="${provider.id}"/>" required/>
			</c:if>
			<fieldset class="row1">
				<legend>Identité</legend>
				<div>
					<label class="label-input">Nom</label>
					<input type="text" name="provider_name" value="<c:out value="${provider.name}"/>" required/>
				</div>
				<div>
					<label class="label-input">Type</label>
					<c:choose>
						<c:when test="${provider.type == 0 }">
							<input type="radio" name="provider_type" value="professional" /><label for="professional" class="label-radio">Professionnel</label>
							<input type="radio" name="provider_type" value="particular" checked /><label for="particular" class="label-radio">Particulier</label>
						</c:when>
						<c:otherwise>
							<input type="radio" name="provider_type" value="professional" checked /><label for="professional" class="label-radio">Professionnel</label>
							<input type="radio" name="provider_type" value="particular" /><label for="particular" class="label-radio">Particulier</label>
						</c:otherwise>
					</c:choose>
				</div>
			</fieldset>
			<fieldset class="row1">
				<legend>Coordonnées</legend>
				<div>
					<label class="label-input">Téléphone</label>
					<input type="tel" name="provider_phone" value="<c:out value="${provider.phone}"/>" required/>
				</div>
				<div>
					<label class="label-input">Email</label>
					<input type="email" name="provider_email" value="<c:out value="${provider.email}"/>" />
				</div>
			</fieldset>
			<fieldset class="row1">
				<legend>Adresse</legend>
				<div>
					<label class="label-input">Rue</label>
					<input type="text" name="provider_address_location" value="<c:out value="${provider.address.location}"/>" />
				</div>
				<div>
					<label class="label-input">Code postal</label>
					<input type="number" name="provider_address_zipcode" min="0" value="<c:out value="${provider.address.zipCode}"/>" />
				</div>
				<div>
					<label class="label-input">Ville</label>
					<input type="text" name="provider_address_city" value="<c:out value="${provider.address.city}"/>" required/>
				</div>
				<div>
					<label class="label-input">Pays</label>
					<select name="provider_address_countries" required>
						<option value="Comores" selected="selected">Comores</option>
					</select>
				</div>
			</fieldset>
			<table class="buttons">
				<tr>
					<td><input type="submit" class="button" value="Enregistrer"/></td>
					<c:if test="${not empty provider}">
						<td>
							<a class="button" href="
								<c:url value="/admin/provider"/>">
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
					<td class="td-width-medium">Type</td>
				</tr>
				<c:forEach var="provider" items="${providers}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/admin/provider"><c:param name="id" value="${provider.id}"/></c:url>"><c:out value="${provider.name}"/></a></td>
						<td>
							<c:choose>
								<c:when test="${provider.type == 0}">
									particulier
								</c:when>
								<c:otherwise>
									professionnel
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>