<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<title>BrainStorm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Major+Mono+Display" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
	<link rel="icon" type="image/png" href="./brainstormlogo.png">

<style type="text/css">
	.vid-container{
		position: relative;
		height: 100vh;
		overflow: hidden;
		background-color:black;
	}
	
	.bgvid{
		margin-top:20px;
		position: absolute;
		left:0;
		top:0;
		width: 100vw;
	}
	.font{
	
	font-family: 'Major Mono Display', monospace;
	font-size: 30px;
	font-weight: 900;
	display: inline-block;
	
	}
	
	.tbl{
	
	margin-left: 700px;
	margin-top: 150px;
	
	}
	.sitenamehome{
	color: white;
	
    font-size: 55px;
    font-family: 'Fredoka One', cursive;
    text-shadow: 2px 2px 4px #000000;
    display: inline-block;
    animation: text 3s 1;
    
	}
	.logoboxhome{

display: inline-block;
margin-left: -46px;

}


</style>
</head>
<body>




<div class="vid-container">
  <img class="bgvid"  src="./chill.gif" >  
          
<audio autoplay loop >

  <source src="./CRVedit.mp3" type="audio/mpeg" >

</audio>
 



	<div class="container">
		<div class="notification">
			<h1 class="font">
				Welcome,
				<c:out value="${user.name}" />
			</h1>
		

		</div>

		
		<!-- table ideas -->
		<div class="tbl">
		
		<h1 class="sitenamehome">BrainStorms</h1>
		<img class="logoboxhome" src="./brainstormlogo.png" alt="logo" width="80">
		<h1 class="sitenamehome"> Near You</h1>
		
			<table class="table is-bordered is rounded is-striped is-narrow is-hoverable is-fullwidth">
			<thead class="dashtable has-background-grey-light ">
				<tr>
					<td>Storm Name</td>
					<td>Creator</td>
					<td>Going</td>

					<td>Your Status</td>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${ideas}" var="idea">
				<tr class="has-background-grey-lighter">
					<td><marquee >"${idea.name}"</marquee></td>
					<td><a href="/storms/${idea.id}" >${idea.creator}</a></td>
					<td>${idea.getUsers().size() }</td>
				
					<td><c:choose>
						<c:when test="${idea.getUsers().indexOf(user)!= -1}">
							<a href="/storms/${idea.id}/unlike">Going</a>
						</c:when>
							<c:otherwise>
									<a href="/storms/like/${idea.id}">Not Going</a> 
								</c:otherwise>
							</c:choose>	

					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>	     

		<div class="buttons has-addons">
			<a href="/storms/new" class="button is-large is-dark is-inverted is-outlined">Create Storm</a>	
			<a href="/storms/new" class="button is-large is-dark is-inverted is-outlined">Campus</a>
			<a href="/storms/new" class="button is-large is-dark is-inverted is-outlined">Your Storms</a>
			<a href="/storms/new" class="button is-large is-dark is-inverted is-outlined">Messages</a>
			<a href="/logout" class="button is-large is-dark is-inverted is-outlined">Log Out</a>
			
		</div>
		
		
		</div>
		

	</div>
</div>
</body>
</html>