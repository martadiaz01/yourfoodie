<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="aiss.model.edamam.Recipe"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="aiss.model.edamam.Recipe"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="aiss.model.edamam.Ingredient"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/newRecipe.css">
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<title>Nueva Receta</title>
</head>
<body>
<div id="panel" class="panel panel-default">
		<div class="panel-heading">
			Nueva Receta
			<c:out value="${name}" />
		</div>
		<div id="cuerpoPanel" class="panel-body">
			<div class="container">
				<form action="/index.html" method="post"class="inicio" accept-charset="UTF-8">
					<input type="submit" class="btn btn-default" id="inicio" name="inicio" value="Inicio">
				</form>
				<form action="/SearchController" method="post" accept-charset="UTF-8">
					<input type="submit" class="btn btn-default" id="recetas" name="recetas" value="Recetas">
					<input type="hidden" id="searchQuery" name="searchQuery" value ="<%= session.getAttribute("recipe") %>">
				</form>
				<p class="bg-primary">${message}</p>

				<form action="/googleDriveFileNewController" method="post"
					accept-charset="UTF-8">
					<input id="recipe" name="recipe" type="hidden" value="${requestScope.recipe}" />
					<c:if test="${not empty file}">
						<input type="hidden" name="id" value="${file.id}">
					</c:if>
					<label for="title">Nombre del archivo:</label> 
					<input type="text" name="title" id="title" class="form-control"
						<c:if test="${not empty file}">
                   		disabled="true" 
                   		value="${file.title}"
             			  </c:if>
						value="<%= session.getAttribute("recipe") %>">
					<div class="content">
						<label for="content">Contenido:</label>
						<textarea id="content" name="content" rows="10" class="form-control">
						<%for(String ingrediente: (List<String>) session.getAttribute("ingredients")) {%>
						<%= ingrediente %>
						<%}; %>
						</textarea>
					</div>
					<div class="bottom_links">
						<input type="submit" class="btn btn-default" id="anyadir" name="anyadir" value="Añadir">
					</div>
				</form>
				<form action="/SearchController" method="post" accept-charset="UTF-8">
					<input type="submit" class="btn btn-default" id="cancelar" name="cancelar" value="Cancelar">
					<input type="hidden" id="searchQuery" name="searchQuery" value ="<%= session.getAttribute("recipe") %>">
				</form>
			</div>
		</div>
	</div>

</body>
</html>
