<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Edition contenu pedagogique</title>
</head>
<body>
	<div class="container">
		<h1>Edition contenu pedagogique</h1>
		<c:choose>
			<c:when test="${cp.getClass().simpleName =='Livre' }">
				<c:url var="action" value="/contenu/save/livre"></c:url>
			</c:when>
			<c:otherwise>
				<c:url var="action" value="/contenu/save/video"></c:url>
			</c:otherwise>
		</c:choose>
		<form:form action="${action }" method="post" modelAttribute="cp">
			<form:hidden path="version" />
			<div class="form-group">
				<form:label path="id">Id:</form:label>
				<form:input path="id" cssClass="form-control" readonly="true"
					placeholder="generation automatique" />
			</div>
			<div class="form-group">
				<form:label path="titre">Titre:</form:label>
				<form:input path="titre" cssClass="form-control" />
				<form:errors path="titre"></form:errors>
			</div>
			<div class="form-group">
				<form:label path="auteur">Auteur:</form:label>
				<form:input path="auteur" cssClass="form-control" />
			</div>
			<div class="form-group">
				<form:label path="prix">Prix:</form:label>
				<form:input path="prix" cssClass="form-control" />
				<form:errors path="prix"></form:errors>
			</div>
			<c:choose>
				<c:when test="${cp.getClass().simpleName=='Livre' }">
					<div class="form-group">
						<form:label path="isbn">ISBN:</form:label>
						<form:input path="isbn" cssClass="form-control" />
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<form:label path="url">URL:</form:label>
						<form:input path="url" cssClass="form-control" />
					</div>
				</c:otherwise>
			</c:choose>
			<div>
				<button type="submit" class="btn btn-outline-success">enregistrer</button>
				<a href="${ctx}/contenu" class="btn btn-outline-warning">annuler
				</a>
			</div>

		</form:form>
	</div>
</body>
</html>