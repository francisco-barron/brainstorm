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
	.brain{
	
	margin-left: 55px;
	
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
	}

.logobox{


display: inline-block;
margin-left: -46px;

}
.nav{

      margin-left: 367px;
    display: inline-block;
}
.bottom{

margin-top: 200px;

}

.box{

  border-style: solid;
  border-width: 10px;
  border-color: #da889a;
  box-shadow: 17px 21px 18px;
  
}
.boxbrain{

display: inline-block;
margin-left: -100px;

}
.bn{

font-family: 'Fredoka One', cursive;

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

				Create a BrainStorm<img class="logobox" src="../brainstormlogo.png" alt="logo" width="80">
				<div class="nav"><a href="/storms" class="button is-large is-dark is-inverted is-outlined">Dashboard</a><a href="/logout" class="button is-large is-dark is-inverted is-outlined">Log Out</a></div>
				
		
			</h1>
			
		</div>
	</div>
	
		
		<!-- Form -->
		<br>
		<br>
		<section class="bottom">
		<div class="columns is-centered">
              <article class="card is-rounded">
              <div class="box">
                <div class="card-content">
				<div class="column">

					<form:form method="POST" action="/storms/new" modelAttribute="idea">
						<table>
							<tr>
								<td class="is-size-4"><form:label path="name"><h1 class="bn">BrainStorm Name:</h1></form:label></td>
								<td><form:input path="name" class="input" /></td>
								<td><form:errors path="name" /></td>
							</tr>
								
							<tr>
              				<td></td>
              				<td><form:hidden path = "creator" value="${user.name}" /></td>
            				</tr>
	

						</table>
						
						<br>
						<div class="buttons has-addons">
							<input type="submit" value="Create" class="button is-dark" />
						</div>
					</form:form>
	


				</div>
				<div class="column"></div>
			</div>
			</div>
			
			</article>
			</div>
		

		</section>
		
		
		
	</div>
</div>
</body>
</html>