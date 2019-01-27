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
                   <c:out value="${error}" />
                                   
            
                  </h5>
                  
                  <form method="post" action="/login">
                  <p class="control has-icon">
                    <label for="email">Email</label>
					<input type="text" id="email" name="email" class="input" />
                    <i class="fa fa-envelope"></i>
                  </p>
                  <p class="control has-icon">
                   <label for="password">Password</label>
                   <input type="password" id="password" name="password" class="input" />
                    <i class="fa fa-lock"></i>
                  </p>
                  <p class="control">
                    <label class="checkbox">
                      <input type="checkbox">
                      Remember me
                    </label>
                  </p>
                  <p class="control">
                    <button class="button is-dark is-medium is-fullwidth">
                      <i class="fa fa-user"></i>
                      Login
                    </button>
                  
                  </p>
                  </form>
                  <br>
                  <br>
                  Not a member?<a href="/signup">   Sign up!</a>
                
                </div>
              </article>
            </div>
          </div>
    
 
   </div>
 </div>
 


</div>

	
</body>

</html>