<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Article</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Article</h1>
		<form name="form_article" action="<c:url value="/article"/>" method="post">
			<span class="form-message">${message}</span>
			<c:if test="${not empty article && article.id > 0}">
				<c:choose>
					<c:when test="${sessionScope.right == 2 || sessionScope.right == 0}">
						<input type="hidden" name="article_id" value="<c:out value="${article.id}"/>" required />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="article_id" value="<c:out value="${article.id}"/>" required disabled/>
					</c:otherwise>				
				</c:choose>
			</c:if>
			<c:choose>
				<c:when test="${sessionScope.right == 2 || sessionScope.right == 0}">
					<fieldset class="row1">
						<legend>Informations</legend>
						<div>
							<label class="label-input">Code</label>
							<input type="text" name="article_code" value="<c:out value="${article.code}"/>" required/>
						</div>
						<div>
							<label class="label-input">Nom</label>
							<input type="text" name="article_name" value="<c:out value="${article.name}"/>" required/>
						</div>
						<div>
							<label class="label-input">Catégorie</label>
							<select name="article_categories" required>
								<c:forEach var="category" items="${categories}">
									<c:choose>
										<c:when test="${not empty article && article.category.id == category.id }">
											<option value="<c:out value="${category.id}"/>" selected="selected"><c:out value="${category.name}"/></option>
										</c:when>
										<c:otherwise>
											<option value="<c:out value="${category.id}"/>"><c:out value="${category.name}"/></option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div>
							<label class="label-input">Prix unitaire (KMF)</label>
							<input type="number" step="0.01" name="article_unitprice" min="0" value="<c:out value="${article.unitPrice}"/>" required/>
						</div>
						<div>
							<label class="label-input">Quantité d'alerte</label>
							<input type="number" step="0.01" name="article_quantityalert" min="0" value="<c:out value="${article.quantityAlert}"/>" required/>
						</div>
						<div>
							<label class="label-input">Emplacement</label>
							<input type="text" name="article_location" value="<c:out value="${article.location}"/>" />
						</div>
					</fieldset>
					<fieldset class="row1">
						<legend>Description</legend>
						<div>
							<textarea name="article_description"><c:out value="${article.description}"/></textarea>
						</div>
					</fieldset>
					<table class="buttons">
						<tr>
							<td><input type="submit" class="button" value="Enregistrer"/></td>
							<c:if test="${not empty article}">
								<td>
									<a class="button" href="
										<c:url value="/article"/>">
										Nouveau
									</a>
								</td>
							</c:if>
						</tr>
					</table>
				</c:when>
				<c:otherwise>
					<fieldset class="row1">
						<legend>Informations</legend>
						<div>
							<label class="label-input">Code</label>
							<input type="text" name="article_code" value="<c:out value="${article.code}"/>" required disabled/>
						</div>
						<div>
							<label class="label-input">Nom</label>
							<input type="text" name="article_name" value="<c:out value="${article.name}"/>" required disabled/>
						</div>
						<div>
							<label class="label-input">Catégorie</label>
							<select name="article_categories" required disabled>
								<c:forEach var="category" items="${categories}">
									<c:choose>
										<c:when test="${not empty article && article.category.id == category.id }">
											<option value="<c:out value="${category.id}"/>" selected="selected"><c:out value="${category.name}"/></option>
										</c:when>
										<c:otherwise>
											<option value="<c:out value="${category.id}"/>"><c:out value="${category.name}"/></option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div>
							<label class="label-input">Prix unitaire (KMF)</label>
							<input type="number" step="0.01" name="article_unitprice" min="0" value="<c:out value="${article.unitPrice}"/>" required disabled/>
						</div>
						<div>
							<label class="label-input">Quantité d'alerte</label>
							<input type="number" step="0.01" name="article_quantityalert" min="0" value="<c:out value="${article.quantityAlert}"/>" required disabled/>
						</div>
						<div>
							<label class="label-input">Emplacement</label>
							<input type="text" name="article_location" value="<c:out value="${article.location}"/>" disabled/>
						</div>
					</fieldset>
					<fieldset class="row1">
						<legend>Description</legend>
						<div>
							<textarea name="article_description" disabled><c:out value="${article.description}"/></textarea>
						</div>
					</fieldset>
				</c:otherwise>
			</c:choose>
		</form>
		<div class="csstable">
			<table>
				<tr>
					<td class="td-width-xsmall">N°</td>
					<td class="td-width-small">Code</td>
					<td>Nom</td>
					<td class="td-width-small">Catégorie</td>
					<td class="td-width-small">Prix unitaire</td>
					<td class="td-width-small">Disponibilité</td>
				</tr>
				<c:forEach var="article" items="${articles}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/article"><c:param name="id" value="${article.id}"/></c:url>"><c:out value="${article.code}"/></a></td>
						<td><span><c:out value="${article.name}"/></span></td>
						<td><c:out value="${article.category.name}"/></td>
						<td><c:out value="${article.unitPrice}"/> KMF</td>
						<td><c:out value="${article.quantity}"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>