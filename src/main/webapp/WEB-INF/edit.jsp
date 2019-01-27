<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">

</head>
<style>
.bottom{

margin-top: 200px;

}

</style>

<body>

	<div class="container">
		<div class="notification">
			<h1 class="title">
				<%-- <c:out value="${user.name}" /> --%>
				Edit  "<c:out value="${idea.name}" />"
			</h1>
		</div>
				<div>
			<a href="/storms">Dashboard</a> | <a href="/logout">Logout</a>
		</div>
		<div>

		</div>
		
		<!-- Form creation -->
		
		<section >
			<div class="columns">
				<div class="column">

					<form:form method="POST" action="/storms/update" modelAttribute="idea">
						<form:input path="id" type="hidden"/>
						<form:input path="users" type="hidden"/>
						<form:input path="creator" type="hidden"/>
						<table>
							<tr>
								<td><form:label path="name">Content:</form:label></td>
								<td><form:input path="name" class="input" /></td>
								<td><form:errors path="name" /></td>
							</tr>

								
						</table>
						<br>
						<div class="buttons has-addons">
							<input type="submit" value="Update" class="button is-dark" />
						</div>
				
					</form:form>


				</div>
				<div class="column"></div>
			</div>

		</section>
		
		
	</div>
</body>
</html>