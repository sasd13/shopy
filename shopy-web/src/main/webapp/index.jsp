<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Accueil</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Acceuil</h1>
		<table id="table-menu">
			<c:choose>
				<c:when test="${sessionScope.right == 1}">
					<tr>
						<td>
							<a class="button-menu" href="
								<c:url value="/saleslot"/>">
								Vente
							</a>
						</td>
						<td>
							<a class="button-menu" href="
								<c:url value="/article"/>">
								Article
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<a class="button-menu" href="
								<c:url value="/seller/client"/>">
								Client
							</a>
						</td>
						<td>
							<a class="button-menu" href="
								<c:url value="/profile"/>">
								Compte
							</a>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
							<a class="button-menu" href="
								<c:url value="/admin/record"/>">
								Affiliation
							</a>
						</td>
						<td>
							<a class="button-menu" href="
								<c:url value="/saleslot"/>">
								Vente
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<a class="button-menu" href="
								<c:url value="/article"/>">
								Article
							</a>
						</td>
						<td>
							<a class="button-menu" href="
								<c:url value="/admin/category"/>">
								Catégorie
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<a class="button-menu" href="
								<c:url value="/admin/profiles">
									<c:param name="users" value="sellers"/>
								</c:url>">
								Utilisateur
							</a>
						</td>
						<td>
							<a class="button-menu" href="
								<c:url value="/profile"/>">
								Compte
							</a>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</body>
</html>