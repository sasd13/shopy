<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<div id="menu">
	<ul>
   		<li><a href="<c:url value="/index"/>"><span>Accueil</span></a></li>
   		<li class="active has-sub"><a href="#"><span>Article</span></a>
    		<ul>
    			<li><a href="<c:url value="/article"/>"><span>Articles</span></a></li>
         		<c:if test="${sessionScope.right == 2 || sessionScope.right == 0}">
         			<li><a href="<c:url value="/admin/category"/>"><span>Catégories</span></a></li>
      			</c:if>
      		</ul>
   		</li>
   		<c:if test="${sessionScope.right == 2 || sessionScope.right == 0}">
   			<li class="active has-sub"><a href="#"><span>Affiliation</span></a>
    			<ul>
         			<li><a href="<c:url value="/admin/record"/>"><span>Affiliations</span></a></li>
         		</ul>
   			</li>
   		</c:if>
   		<li class="active has-sub"><a href="#"><span>Vente</span></a>
    		<ul>
    			<li><a href="<c:url value="/saleslot"/>"><span>Ventes</span></a></li>
    			<c:if test="${sessionScope.right == 1 || sessionScope.right == 0}">
         			<li><a href="<c:url value="/seller/proforma"/>"><span>Proformas</span></a></li>
         		</c:if>
      		</ul>
   		</li>
   		<c:if test="${sessionScope.right == 2 || sessionScope.right == 0}">
   			<li class="active has-sub"><a href="#"><span>Utilisateur</span></a>
    			<ul>
    				<li><a href="<c:url value="/admin/profiles"><c:param name="users" value="sellers"/></c:url>"><span>Vendeurs</span></a></li>
         			<li><a href="<c:url value="/admin/profiles"><c:param name="users" value="admins"/></c:url>"><span>Gestionnaires</span></a></li>
         		</ul>
   			</li>
   		</c:if>
   		<li><a href="<c:url value="/profile"/>"><span>Profil</span></a></li>
   		<li><a href="<c:url value="/logout"/>"><span>Déconnexion</span></a></li>
	</ul>
</div>