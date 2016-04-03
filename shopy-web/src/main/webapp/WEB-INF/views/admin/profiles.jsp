<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<c:choose>
			<c:when test="${listType == 'admins'}">
				<title>Liste gestionnaires</title>
			</c:when>
			<c:otherwise>
				<title>Liste vendeurs</title>
			</c:otherwise>
		</c:choose>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<c:choose>
			<c:when test="${listType == 'admins'}">
				<h1>Liste gestionnaires</h1>
			</c:when>
			<c:otherwise>
				<h1>Liste vendeurs</h1>
			</c:otherwise>
		</c:choose>
		<div class="csstable">
			<table>
				<tr>
					<td class="td-width-xsmall">N°</td>
					<td>Nom</td>
					<td class="td-width-small">Status</td>
					<c:if test="${(listType == 'sellers' && sessionScope.right == 2) || sessionScope.right == 0}">
						<td class="td-width-small">Option</td>
					</c:if>
				</tr>
				<c:forEach var="user" items="${users}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><c:out value="${user.firstName}"/>&nbsp;<c:out value="${user.lastName}"/></td>
						<td>
							<c:choose>
								<c:when test="${user.status == -2}">
									<c:out value="Supprimé"/>
								</c:when>
								<c:when test="${user.status == -1}">
									<c:out value="Désactivé"/>
								</c:when>
								<c:when test="${user.status == 0}">
									<c:out value="En attente"/>
								</c:when>
								<c:otherwise>
									<c:out value="Activé"/>
								</c:otherwise>
							</c:choose>
						</td>
						<c:if test="${(listType == 'sellers' && sessionScope.right == 2) || sessionScope.right == 0}">
							<td>
								<c:choose>
									<c:when test="${user.status == -2}"></c:when>
									<c:when test="${user.status == -1 || user.status == 0}">
										<c:choose>
											<c:when test="${listType == 'admins'}">
												<a href="
													<c:url value="/admin/profiles">
														<c:param name="users" value="admins"/>
														<c:param name="action" value="activate"/>
														<c:param name="id" value="${user.id}"/>
													</c:url>">
													Activer
												</a>
											</c:when>
											<c:otherwise>
												<a href="
													<c:url value="/admin/profiles">
														<c:param name="users" value="sellers"/>
														<c:param name="action" value="activate"/>
														<c:param name="id" value="${user.id}"/>
													</c:url>">
													Activer
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${listType == 'admins'}">
												<a href="
													<c:url value="/admin/profiles">
														<c:param name="users" value="admins"/>
														<c:param name="action" value="deactivate"/>
														<c:param name="id" value="${user.id}"/>
													</c:url>">
													Désactiver
												</a>
											</c:when>
											<c:otherwise>
												<a href="
													<c:url value="/admin/profiles">
														<c:param name="users" value="sellers"/>
														<c:param name="action" value="deactivate"/>
														<c:param name="id" value="${user.id}"/>
													</c:url>">
													Désactiver
												</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>