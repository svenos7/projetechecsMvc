<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"></c:set>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<title>club</title>
</head>
<body>
	<div class="container">
		<h1>Liste de clubs</h1>
		<table class="table">
			<tr>
				<td>id</td>
				<td>nom</td>
				<td>adresse</td>
				<td>code postal</td>
				<td>ville</td>
				<td>pays</td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="c" items="${clubs}">
				<tr>
					<td>${c.id}</td>
					<td>${c.nom}</td>
					<td>${c.adresse.numero}&nbsp;${c.adresse.rue}</td>
					<td>${c.adresse.codePostal}</td>
					<td>${c.adresse.ville}</td>
					<td>${c.adresse.pays}</td>
					<td><a href="${ctx}/club/edit?id=${c.id}"
						class="btn btn-outline-info">editer</a></td>
					<td><a href="${ctx}/club/delete?id=${c.id}"
						class="btn btn-outline-danger">supprimer</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>