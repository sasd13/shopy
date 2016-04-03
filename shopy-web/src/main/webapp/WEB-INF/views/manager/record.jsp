<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Affiliation</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Affiliation</h1>
		<form name="form_record" action="<c:url value="/admin/record"/>" method="post">
			<span class="form-message">${message}</span>
			<c:if test="${not empty record && record.id > 0}">
				<input type="hidden" name="record_id" value="<c:out value="${record.id}"/>" required/>
			</c:if>
			<fieldset class="row1">
				<legend>Informations</legend>
				<div>
					<label class="label-input">Article</label>
					<select name="record_articles" required>
						<c:forEach var="article" items="${articles}">
							<c:choose>
								<c:when test="${not empty record && record.article.id == article.id }">
									<option value="<c:out value="${article.id}"/>" selected="selected"><c:out value="${article.code}"/> - <c:out value="${fn:substring(article.name, 0, 50)}"/></option>
								</c:when>
								<c:otherwise>
									<option value="<c:out value="${article.id}"/>"><c:out value="${article.code}"/> - <c:out value="${fn:substring(article.name, 0, 50)}"/></option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div>
					<label class="label-input">Fournisseur</label>
					<select name="record_providers" required>
						<c:forEach var="provider" items="${providers}">
							<c:choose>
								<c:when test="${not empty record && record.provider.id == provider.id }">
									<option value="<c:out value="${provider.id}"/>" selected="selected"><c:out value="${fn:substring(provider.name, 0, 50)}"/></option>
								</c:when>
								<c:otherwise>
									<option value="<c:out value="${provider.id}"/>"><c:out value="${fn:substring(provider.name, 0, 50)}"/></option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div>
					<label class="label-input">Quantité</label>
					<input type="number" step="0.01" name="record_quantity" min="0" value="<c:out value="${record.quantity}"/>" required/>
				</div>
				<div>
					<label class="label-input">Prix unitaire envisagé (KMF)</label>
					<input type="number" step="0.01" name="record_desiredunitsellingprice" min="0" value="<c:out value="${record.desiredUnitSellingPrice}"/>"/>
				</div>
				<div>
					<label class="label-input">Méthode prix</label>
					<c:choose>
						<c:when test="${record.priceMethod == 1 }">
							<input type="radio" name="record_pricemethod" value="none" /><label for="none" class="label-radio">Non</label>
							<input type="radio" name="record_pricemethod" value="lifo" checked /><label for="lifo" class="label-radio">LIFO</label>
							<input type="radio" name="record_pricemethod" value="fifo" /><label for="fifo" class="label-radio">FIFO</label>
							<input type="radio" name="record_pricemethod" value="cump" /><label for="cump" class="label-radio">CUMP</label>
						</c:when>
						<c:when test="${record.priceMethod == 2 }">
							<input type="radio" name="record_pricemethod" value="none" /><label for="none" class="label-radio">Non</label>
							<input type="radio" name="record_pricemethod" value="lifo" /><label for="lifo" class="label-radio">LIFO</label>
							<input type="radio" name="record_pricemethod" value="fifo" checked /><label for="fifo" class="label-radio">FIFO</label>
							<input type="radio" name="record_pricemethod" value="cump" /><label for="cump" class="label-radio">CUMP</label>
						</c:when>
						<c:when test="${record.priceMethod == 3 }">
							<input type="radio" name="record_pricemethod" value="none" /><label for="none" class="label-radio">Non</label>
							<input type="radio" name="record_pricemethod" value="lifo" /><label for="lifo" class="label-radio">LIFO</label>
							<input type="radio" name="record_pricemethod" value="fifo" /><label for="fifo" class="label-radio">FIFO</label>
							<input type="radio" name="record_pricemethod" value="cump" checked /><label for="cump" class="label-radio">CUMP</label>
						</c:when>
						<c:otherwise>
							<input type="radio" name="record_pricemethod" value="none" checked /><label for="none" class="label-radio">Non</label>
							<input type="radio" name="record_pricemethod" value="lifo" /><label for="lifo" class="label-radio">LIFO</label>
							<input type="radio" name="record_pricemethod" value="fifo" /><label for="fifo" class="label-radio">FIFO</label>
							<input type="radio" name="record_pricemethod" value="cump" /><label for="cump" class="label-radio">CUMP</label>
						</c:otherwise>
					</c:choose>
				</div>
			</fieldset>
			<table class="buttons">
				<tr>
					<td><input type="submit" class="button" value="Enregistrer"/></td>
					<c:if test="${not empty record}">
						<td>
							<a class="button" href="
								<c:url value="/admin/record"/>">
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
					<td class="td-width-small">Date</td>
					<td class="td-width-small">Article code</td>
					<td>Article nom</td>
					<td class="td-width-small">Quantité</td>
				</tr>
				<c:forEach var="record" items="${records}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/admin/record"><c:param name="id" value="${record.id}"/></c:url>"><c:out value="${record.date}"/></a></td>
						<td><c:out value="${record.article.code}"/></td>
						<td><c:out value="${record.article.name}"/></td>
						<td><c:out value="${record.quantity}"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>