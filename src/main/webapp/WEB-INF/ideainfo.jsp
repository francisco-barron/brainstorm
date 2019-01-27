<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BrainStorm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Major+Mono+Display" rel="stylesheet">
	<link rel="icon" type="image/png" href="../brainstormlogo.png">
</head>



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
	.login{
	 
  margin-top:50px;
  margin-left: 30px;


	
	}
	.font{
	
	font-family: 'Fredoka One', cursive;
	font-size: 50px;
	font-weight: 900;
	text-shadow: 2px 2px 4px #000000;
	color: white;

	
	}
	.font2{
	
	font-family: 'Fredoka One', cursive;
	font-size: 20px;


	color: black;

	
	}
	.brain{
	
	margin-left: 55px;
	
	}
	.creator{
	
font-size: 31px;
    text-transform: capitalize;
    padding-left: 10px;
    background-color: white;
    color: #000000;
    /* text-shadow: -2px 1px 2px black, 0 0 2px #333333, 0 0 3px black; */
    margin-left: 20px;
    font-family: 'Fredoka One', cursive;
    box-shadow: 10px 10px 5px grey;
    width: 335px;
    border-radius: 4px;
	
	
	}
	.sitename{
	color: white;
    margin-left: 450px;
    margin-top: 320px;
    font-size: 90px;
    font-family: 'Fredoka One', cursive;
    text-shadow: 2px 2px 4px #000000;
    display: inline-block;
    animation: text 5s 1;
    
	}
	@keyframes text{
	0%{
	color:#285c69;
	}
	
	
	
	30%{
	letter-spacing: 25px ;
	
	
	}
	85%{
	letter-spacing: -1px ;
	
	
	}
	.bn{

	font-family: 'Fredoka One', cursive;

}
	}

.logobox{

display: inline-block;
verti
margin-left: -100px;

}
.nav{

      margin-left: 300px;
    display: inline-block;
}
.bottom{

margin-top: 165px;

}
.box{

    border-style: solid;
    width: 500px;
    border-width: 10px;
    border-color: #da889a;
    box-shadow: 10px 10px;
}


}


  
}
.navbox{
width: 1263px;

}

</style>
</head>
<body>





<div class="vid-container">
  <img class="bgvid"  src="../astheticrain.gif" >   
  
  <audio autoplay loop >

  <source src="../stormy.mp3" type="audio/mpeg" >

</audio>
          


<div class="container">
	<div class="navbox">
		<div class="notification is-black">
			<h1 class="font">

				"<c:out value="${idea.name}" />"<img class="logoboxhome" src="../brainstormlogo.png" alt="logo" width="80">
				
				<div class="nav"><a href="/storms" class="button is-large is-dark is-inverted is-outlined">Dashboard</a><a href="/storms" class="button is-large is-dark is-inverted is-outlined">Messages</a><a href="/logout" class="button is-large is-dark is-inverted is-outlined">Log Out</a></div>
				
		
			</h1>
		</div>
	</div>
		<h3 class="creator">
			Created by
				<c:out value="${idea.creator}" />
		</h3>
	<div class="bottom">
		</div>
	

			
		<div>

			<h1 class="font">${idea.getUsers().size() } currently chasing this BrainStorm</h1>
		</div>
		<div>
		<br>
		</div>


		<!-- table ideas -->
		<div class="box">
		<table class="table  is-fullwidth is-bordered">
			<thead class="dashtable">
				<tr>
					<td> People going:</td>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${idea.getUsers()}" var="user">
					<tr>
						<td><marquee class="font2" behavior="alternate">${user.name}</marquee></td>



					</tr>
				</c:forEach>

			</tbody>
		</table>
		</div>


		<a href="/storms/${idea.id}/edit" class="button is-dark">Edit</a> <a
			href="/storms/delete/${idea.id}" class="button is-dark">Delete</a>

	</div>
	
	</div>
	
	
	

</body>
</html>