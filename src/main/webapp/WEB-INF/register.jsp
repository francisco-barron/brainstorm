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
	<link rel="icon" type="image/png" href="./brainstormlogo.png">
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
	.brain{
	
	margin-left: 55px;
	
	}
	.sitename{
	color: white;
    margin-left: 450px;
    margin-top: 250px;
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
	letter-spacing: 8px ;
	
	
	}
	
	}

.logobox{

display: inline-block;
margin-left: -100px;

}


</style>
</head>
<body>




<div class="vid-container">
  <img class="bgvid"  src="./astheticrain.gif" >  
          
<audio autoplay loop >

  <source src="./index1.mp3" type="audio/mpeg" >

</audio>

<div class="container">

<div>

  <h1 class="sitename">BrainStorm</h1>
  <img class="logobox" src="./brainstormlogo.png" alt="logo" width="150">

 <div class="login">
 





            <div class="columns is-centered">
              <article class="card is-rounded">
                <div class="card-content">
                  <h5>
                   <form:errors path="user.*" />
                                   
            
                  </h5>
                  
                  <form:form method="POST" action="/registration"
						modelAttribute="user">
                  <p class="control has-icon">
                    <form:label path="name">Name:</form:label>
					<form:input path="name" class="input" />
                    <i class="fa fa-envelope"></i>
                  </p>
                  <p class="control has-icon">
                    <form:label path="email">Email:</form:label>
					<form:input path="email" class="input" />
                    <i class="fa fa-envelope"></i>
                  </p>
                  <p class="control has-icon">
                    <form:label path="password">Password:</form:label>
					<form:input path="password" class="input" type="password"/>
                    <i class="fa fa-lock"></i>
                  </p>
                     <p class="control has-icon">
                    <form:label path="passwordConfirmation">Confirm Password:</form:label>
					<form:input path="passwordConfirmation" class="input" type="password"/>
                    <i class="fa fa-lock"></i>
                  </p>
         
                  <p class="control">
                    <button class="button is-dark is-medium is-fullwidth">
                      <i class="fa fa-user"></i>
                      Sign Up
                    </button>
                  
                  </p>
                  
                  </form:form>
                  
 
       
                  Already a member?<a href="/"> Log In!</a>
                
                </div>
              </article>
            </div>
          </div>
    
 
   </div>
 </div>
 


</div>

	
</body>
<body>
	<div class="container">


		<!-- left and right -->
		<section>
			<div class="columns">

				<!-- registration -->
				<div class="column">
					<div >
						<h1 class="title">Register</h1>
					</div>
					

					<!-- left column -->


					<form:form method="POST" action="/registration"
						modelAttribute="user">
						<table class="mytable">

							<tr>
								<td ><form:label path="name">Name:</form:label></td>
								<td><form:input path="name"
										class="input" /></td>
							</tr>
							<tr>
								<td><form:label path="email">Email:</form:label></td>
								<td ><form:input path="email"
										class="input" /></td>
							</tr>

							<tr>
								<td><form:label path="password">password:</form:label></td>
								<td ><form:input path="password"
										type="password" class="input" /></td>
							</tr>
							<tr>
								<td ><form:label
										path="passwordConfirmation">password Confirmation:</form:label></td>
								<td ><form:input
										path="passwordConfirmation" type="password" class="input" /></td>
							</tr>
						</table>
						<div >
							<input type="submit" value="Register!" class="button" />
						</div>
					</form:form>
					<p></p>
					
					<p >
						<form:errors path="user.*" />
					</p>
				</div>


			</div>
		</section>
	</div>
</body>
</html>