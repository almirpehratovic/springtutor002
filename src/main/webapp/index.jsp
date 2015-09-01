<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Spring Tutor 002</title>
		<style>
			body {
				background-color: lightblue;
				margin-left: 20px;
			}
			#result {
				float: right;
				width: 50%;
			}
			.result td{
				padding: 5px;
			}
			.result img{
				width: 200px;
				height: 300px;
			}	
		</style>
	</head> 
	<body>
		<c:url value="/movies" var="postUrl" />
		<div id="result">
			<c:if test="${not empty searchResult}">
				<h3>Search Result</h3>
				<table class="result">
					<tbody>
						<tr>
							<td rowspan="3">
								<img src="${searchResult.poster}" alt="image"/>
							</td>
							<td>${searchResult.title}</td>
							<td>${searchResult.year}</td>
						</tr>
						<tr>
							<td colspan="2">${searchResult.plot}</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
		<h1>Search movie database</h1>
		<form id="searchForm" method="post" action="${postUrl}">
			<table>
				<tbody>
					<tr>
						<td>Title:</td>
						<td><input name="title"/></td>
					</tr>
					<tr>
						<td>Year:</td>
						<td><input name="year"/></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="Search" />
		</form>
	</body>
</html>
