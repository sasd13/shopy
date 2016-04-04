<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Catégorie</title>
		<jsp:include page="../inc/css-commons.jsp"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css"/>
	</head>
	
	<body>
		<jsp:include page="../inc/menu.jsp"/>
		<h1>Catégorie</h1>
		<form name="form_category" action="<c:url value="/admin/category"/>" method="post">
			<span class="form-message">${message}</span>
			<c:if test="${not empty category && category.id > 0}">
				<input type="hidden" name="category_id" value="<c:out value="${category.id}"/>" required/>
			</c:if>
			<fieldset class="row1">
				<legend>Informations</legend>
				<div>
					<label class="label-input">Nom</label>
					<input type="text" name="category_name" value="<c:out value="${category.name}"/>" required/>
				</div>
			</fieldset>
			<table class="buttons">
				<tr>
					<td><input type="submit" class="button" value="Enregistrer"/></td>
					<c:if test="${not empty category}">
						<td>
							<a class="button" href="
								<c:url value="/admin/category"/>">
								Nouveau
							</a>
						</td>
					</c:if>
				</tr>
			</table>
		</form>
		<div class="table">
			<table>
				<tr>
					<td class="td-width-xsmall">N°</td>
					<td>Nom</td>
				</tr>
				<c:forEach var="category" items="${categories}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/admin/category"><c:param name="id" value="${category.id}"/></c:url>"><c:out value="${category.name}"/></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>