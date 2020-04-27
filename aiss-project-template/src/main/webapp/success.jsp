<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultado de b�squeda</title>
<link href="css/ResultadoStyle.css" rel="stylesheet">
</head>
<body>

	<c:forEach items="${requestScope.recipes}" var="recipes">
		<div class="receta">
			<div class="izq">
				<img src="<c:out value="${recipes.recipe.image}"/>"><br />
				
				<form id="videoYoutube" action="/SearchVideoController" method="post" accept-charset="UTF-8">
					<input id="name" name="label" type="hidden"value="${recipes.recipe.label}" /> 
					<input id="image" name="image" type="hidden"value="${recipes.recipe.image}" /> 
					<input id="ingredients" name="ingredients" type="hidden"value="${recipes.recipe.ingredients}" /> 
					<input type="submit"class="btn btn-default" name="buscarVideo" value="Tutorial">
					
				</form>
			


			</div>
			<div class="dcha">
				<h2>
					<c:out value="${recipes.recipe.label}" />
				</h2>
				<p>Ingredientes:</p>
				<div class="ingredientes">
					<c:forEach items="${recipes.recipe.ingredients}" var="ingredient">
						<p>
							<c:out value="${ingredient.text}" />
						</p>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>>