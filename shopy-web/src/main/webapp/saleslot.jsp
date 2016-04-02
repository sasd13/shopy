<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Vente</title>
		<jsp:include page="/WEB-INF/head.jsp"/>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/menu.jsp"/>
		<h1>Vente</h1>
		<form name="form_saleslot" action="<c:url value="/saleslot"/>" method="post">
			<span class="form-message">${message}</span>
			<c:if test="${not empty salesLot && salesLot.id > 0}">
				<input type="hidden" name="saleslot_id" value="<c:out value="${salesLot.id}"/>" required/>
			</c:if>
			<c:choose>
				<c:when test="${sessionScope.right == 1 || sessionScope.right == 0}">
					<fieldset class="row1">
						<legend>Informations</legend>
						<div>
							<label class="label-input">Client</label>
							<select name="saleslot_clients">
								<option value="0">Aucun</option>
								<c:forEach var="client" items="${clients}">
									<c:choose>
										<c:when test="${not empty salesLot && salesLot.client.id == client.id }">
											<option value="<c:out value="${client.id}"/>" selected="selected"><c:out value="${client.name}"/></option>
										</c:when>
										<c:otherwise>
											<option value="<c:out value="${client.id}"/>"><c:out value="${client.name}"/></option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div>
							<label class="label-input">Total HT (KMF)</label>
							<input type="number" step="0.01" name="saleslot_total" min="0" value="<c:out value="${salesLot.total}"/>" disabled="disabled"/>
						</div>
						<div>
							<label class="label-input">TVA (%)</label>
							<input type="number" step="0.01" name="saleslot_tva" min="0" value="<c:out value="${salesLot.tva}"/>"/>
						</div>
						<div>
							<label class="label-input">Remise (KMF)</label>
							<input type="number" step="0.01" name="saleslot_refund" min="0" value="<c:out value="${salesLot.refund}"/>"/>
						</div>
						<div>
							<label class="label-input">Total net (KMF)</label>
							<input type="number" name="saleslot_totalnet" min="0" value="<c:out value="${salesLot.total*(1 + (salesLot.tva / 100)) - salesLot.refund}"/>" disabled="disabled"/>
						</div>
						<div>
							<label class="label-input">Facturation différée</label>
							<c:choose>
								<c:when test="${salesLot.delayed == true}">
									<input type="checkbox" name="saleslot_delayed" checked/>
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="saleslot_delayed"/>
								</c:otherwise>
							</c:choose>
						</div>
					</fieldset>
					<c:if test="${not empty salesLot && not empty salesLot.sales}">
						<fieldset class="row1">
							<legend>Liste articles</legend>
							<table>
								<c:forEach var="sale" items="${salesLot.sales}">
									<tr class="row2">
										<td>
											<div>
												<label class="label-input">Nom</label>
												<select name="saleslot_sale_articles">
													<c:forEach var="article" items="${articles}">
														<c:choose>
															<c:when test="${sale.article.id == article.id }">
																<option value="<c:out value="${article.id}"/>" selected="selected"><c:out value="${article.name}"/></option>
															</c:when>
															<c:otherwise>
																<option value="<c:out value="${article.id}"/>"><c:out value="${article.name}"/></option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
											<div>
												<label class="label-input">Quantité</label>
												<input type="number" step="0.01" name="saleslot_sale_quantity" min="0" value="<c:out value="${sale.quantity}"/>" required/>
											</div>
											<div>
												<label class="label-input">Remise (KMF)</label>
												<input type="number" step="0.01" name="saleslot_sale_refund" min="0" value="<c:out value="${sale.refund}"/>"/>
											</div>
										</td>
										<td>
											<div>
												<label class="label-input">Prix unitaire (KMF)</label>
												<input type="number" step="0.01" name="saleslot_sale_unitsellingprice" min="0" value="<c:out value="${sale.unitSellingPrice}"/>" disabled/>
											</div>
											<div>
												<label class="label-input">Montant (KMF)</label>
												<input type="number" step="0.01" name="saleslot_sale_cost" min="0" value="<c:out value="${(sale.quantity*sale.unitSellingPrice) - sale.refund}"/>" disabled/>
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</fieldset>
					</c:if>
					<fieldset class="row1">
						<legend>Nouveau article</legend>
						<div class="saleslot-row-sale-new">
							<div class="col-left">
								<div>
									<label class="label-input">Nom</label>
									<select name="sale_articles">
										<c:forEach var="article" items="${articles}">
											<option value="<c:out value="${article.id}"/>"><c:out value="${article.name}"/></option>
										</c:forEach>
									</select>
								</div>
								<div>
									<label class="label-input">Quantité</label>
									<input type="number" step="0.01" name="sale_quantity" min="0" value="<c:out value="${sale.quantity}"/>"/>
								</div>
								<div>
									<label class="label-input">Remise (KMF)</label>
									<input type="number" step="0.01" name="sale_refund" min="0" value="<c:out value="${sale.refund}"/>"/>
								</div>
							</div>
						</div>
					</fieldset>
					<table class="buttons">
						<tr>
							<c:if test="${not empty salesLot}">
								<td><input type="submit" class="button" name="submit" value="Enregistrer"/></td>
							</c:if>
							<td><input type="submit" class="button" name="submit" value="Ajouter Article"/></td>
							<c:if test="${not empty salesLot}">
								<td><input type="submit" class="button" name="submit" value="Editer Proforma"/></td>
								<td><a class="button" href="<c:url value="/saleslot"/>">Nouveau</a></td>
							</c:if>
						</tr>
					</table>
				</c:when>
				<c:otherwise>
					<fieldset class="row1">
						<legend>Informations</legend>
						<div>
							<label class="label-input">Client</label>
							<select name="saleslot_clients" disabled>
								<option value="0">Aucun</option>
								<c:forEach var="client" items="${clients}">
									<c:choose>
										<c:when test="${not empty salesLot && salesLot.client.id == client.id }">
											<option value="<c:out value="${client.id}"/>" selected="selected"><c:out value="${client.name}"/></option>
										</c:when>
										<c:otherwise>
											<option value="<c:out value="${client.id}"/>"><c:out value="${client.name}"/></option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div>
							<label class="label-input">Total HT (KMF)</label>
							<input type="number" step="0.01" name="saleslot_total" min="0" value="<c:out value="${salesLot.total}"/>" disabled="disabled"/>
						</div>
						<div>
							<label class="label-input">TVA (%)</label>
							<input type="number" step="0.01" name="saleslot_tva" min="0" value="<c:out value="${salesLot.tva}"/>" disabled="disabled"/>
						</div>
						<div>
							<label class="label-input">Remise (KMF)</label>
							<input type="number" step="0.01" name="saleslot_refund" min="0" value="<c:out value="${salesLot.refund}"/>" disabled="disabled"/>
						</div>
						<div>
							<label class="label-input">Total net (KMF)</label>
							<input type="number" name="saleslot_totalnet" min="0" value="<c:out value="${salesLot.total*(1 + (salesLot.tva / 100)) - salesLot.refund}"/>" disabled="disabled"/>
						</div>
						<div>
							<label class="label-input">Facturation différée</label>
							<c:choose>
								<c:when test="${salesLot.delayed == true}">
									<input type="checkbox" name="saleslot_delayed" checked disabled="disabled"/>
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="saleslot_delayed" disabled="disabled"/>
								</c:otherwise>
							</c:choose>
						</div>
					</fieldset>
					<c:if test="${not empty salesLot && not empty salesLot.sales}">
						<fieldset class="row1">
							<legend>Liste articles</legend>
							<table>
								<c:forEach var="sale" items="${salesLot.sales}">
									<tr class="row2">
										<td>
											<div>
												<label class="label-input">Nom</label>
												<select name="saleslot_sale_articles" disabled>
													<c:forEach var="article" items="${articles}">
														<c:choose>
															<c:when test="${sale.article.id == article.id }">
																<option value="<c:out value="${article.id}"/>" selected="selected"><c:out value="${article.name}"/></option>
															</c:when>
															<c:otherwise>
																<option value="<c:out value="${article.id}"/>"><c:out value="${article.name}"/></option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
											<div>
												<label class="label-input">Quantité</label>
												<input type="number" step="0.01" name="saleslot_sale_quantity" min="0" value="<c:out value="${sale.quantity}"/>" required disabled="disabled"/>
											</div>
											<div>
												<label class="label-input">Remise (KMF)</label>
												<input type="number" step="0.01" name="saleslot_sale_refund" min="0" value="<c:out value="${sale.refund}"/>" disabled="disabled"/>
											</div>
										</td>
										<td>
											<div>
												<label class="label-input">Prix unitaire (KMF)</label>
												<input type="number" step="0.01" name="saleslot_sale_unitsellingprice" min="0" value="<c:out value="${sale.unitSellingPrice}"/>" disabled/>
											</div>
											<div>
												<label class="label-input">Montant (KMF)</label>
												<input type="number" step="0.01" name="saleslot_sale_cost" min="0" value="<c:out value="${(sale.quantity*sale.unitSellingPrice) - sale.refund}"/>" disabled/>
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</fieldset>
					</c:if>
				</c:otherwise>
			</c:choose>
		</form>
		<div class="csstable">
			<table>
				<tr>
					<td class="td-width-xsmall">N°</td>
					<td class="td-width-small">Date</td>
					<td class="td-width-small">Montant</td>
					<td class="td-width-small">Différée</td>
					<td>Client</td>
				</tr>
				<c:forEach var="salesLot" items="${salesLots}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><a href="<c:url value="/saleslot"><c:param name="id" value="${salesLot.id}"/></c:url>"><c:out value="${salesLot.date}"/></a></td>
						<td><c:out value="${salesLot.total}"/></td>
						<td>
							<c:choose>
								<c:when test="${salesLot.delayed == true}">
									<c:out value="Oui"/>
								</c:when>
								<c:otherwise>
									<c:out value="Non"/>
								</c:otherwise>
							</c:choose>
						</td>
						<td><c:out value="${salesLot.client.name}"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>