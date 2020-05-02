<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Search results</title>
</head>
<body>


<fieldset id="youtube">
<legend>YouTube search for <c:out value="${param.label}"/></legend>
<c:choose>
<c:when test="${not empty param.label}">
<c:forEach items="${requestScope.videos}" var="item">
<iframe src="https://www.youtube.com/embed/<c:out value="${item.id.videoId}"/>"></iframe>
</c:forEach>
</c:when>
<c:otherwise>
<span>No hay resultados.</span>
</c:otherwise>
</c:choose>
</fieldset>

</body>
</html>