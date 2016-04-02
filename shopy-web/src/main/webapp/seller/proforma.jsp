<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Proforma</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Proforma</h1>
		<div class="csstable">
			<table>
				<tr>
					<td class="td-width-xsmall">N°</td>
					<td class="td-width-small">Date</td>
					<td class="td-width-small">Vente date</td>
					<td class="td-width-small">Vente montant</td>
					<td class="td-width-small">Facturé</td>
				</tr>
				<c:forEach var="proforma" items="${proformas}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/seller/proforma"><c:param name="id" value="${proforma.id}"/></c:url>"><c:out value="${proforma.date}"/></a></td>
						<td><a href="<c:url value="/saleslot"><c:param name="id" value="${proforma.saleslot.id}"/></c:url>"><c:out value="${proforma.saleslot.date}"/></a></td>
						<td><c:out value="${proforma.saleslot.total}"/></td>
						<td><c:out value="${proforma.billed}"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>