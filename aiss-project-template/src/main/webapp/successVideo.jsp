<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="aiss.model.edamam.Recipe"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="aiss.model.edamam.Recipe"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="aiss.model.edamam.Ingredient"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tutorial de la receta</title>
<link href="css/VideoStyle.css" rel="stylesheet">
</head>

<body>
	<c:choose>
		<c:when test="${not empty param.label}">
			<c:forEach items="${requestScope.videos}" var="item">
				<iframe id="video" width="880" height="495" src="https://www.youtube.com/embed/<c:out value="${item.id.videoId}"/>" frameborder="0" allowfullscreen></iframe>
			<div class="receta">
				<h2>
					<c:out value="${requestScope.recipe2.label}" />
				</h2>
				<p>Ingredientes:</p>
				<div class="ingredientes">
					<c:forEach items="${requestScope.recipe2.ingredients}" var="ingredient">
						<p>
							<c:out value="${ingredient.text}"/>
						</p>
					</c:forEach>
				</div>
			</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<span>No hay resultados.</span>
		</c:otherwise>
	</c:choose>
	
</body>

</html>