<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Contenu pedagogique</title>
</head>
<body>
	<div class="container">
		<h1>Liste des contenus pedagogiques</h1>
		<table class="table">
			<tr>
				<td>id</td>
				<td>Titre</td>
				<td>Auteur</td>
				<td>Type</td>
				<td>Prix</td>
				<td>Ressources</td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="cp" items="${contenus }">
				<tr>
					<td>${cp.id }</td>
					<td>${cp.titre }</td>
					<td>${cp.auteur }</td>
					<td><c:choose>
							<c:when
								test="${cp.getClass().name == 'projetechec.entity.Video' }">video</c:when>
							<c:otherwise>livre</c:otherwise>
						</c:choose></td>
					<td>${cp.prix }</td>
					<td><c:choose>
							<c:when
								test="${cp.getClass().name == 'projetechec.entity.Video' }">${cp.url }</c:when>
							<c:otherwise>${cp.isbn }</c:otherwise>
						</c:choose></td>
					<td><a
						href="${ctx }/contenu/edit?id=${cp.id }&type=${cp.getClass().simpleName }"
						class="btn btn-outline-info">editer</a></td>
					<td><a href="${ctx }/contenu/delete?id=${cp.id}"
						class="btn btn-outline-danger">supprimer</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="btn-group">
			<a href="${ctx }/contenu/livre" class="btn btn-outline-info">Ajouter
				livre</a> <a href="${ctx }/contenu/video" class="btn btn-outline-info">Ajouter
				video</a>
		</div>

	</div>
</body>
</html>