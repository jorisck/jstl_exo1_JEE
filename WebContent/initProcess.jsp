<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<! doctype html>
<html>
	<head>
		<meta charset="utf-8"> 
		<title>
			Gestion des Param d'une page
		</title>
	</head>
	<body>
		<c:out value="Voici la liste des données encodées par l'utilisateur"/>
		<c:forEach var="parametre" items="${paramValues}">
			<ul>
				<li><b><c:out value="${parametre.key}"/></b> :</li>
				<c:forEach var="value" items="${parametre.value}">
					<c:out value="${value }"/>
				</c:forEach>
			</ul>
		</c:forEach>
		
		<p>
			<b>Vous vous nommez</b>
		</p>
		
		<c:out value="${param.nom }"/> <c:out value="${param.prenom }"/>
		
		<p> <b>Vous avez visitez les pays suivants:</b></p>
		
		<c:choose>
			<c:when test="${!empty paramValues.pays}">
				<c:forEach var="pays" items="${paramValues.pays}">
					<c:out value="${pays}"></c:out>					
				</c:forEach>
			</c:when>		
			<c:otherwise>
			
			Vous n'avez visitez aucun pays
			</c:otherwise>
		</c:choose>
		
		<p><b>Vous avez aussi visitez les pays suivants:</b></p>
		<c:choose>
			<c:when test="${!empty param.autre }">
				<c:forTokens var="autre" items="${param.autre}" delims=",">
					<c:out value="${autre }"></c:out>
				</c:forTokens>
			</c:when>
			<c:otherwise> Vous n'avez pas visité d'autres pays</c:otherwise>
		</c:choose>
		
		
	</body>
</html>