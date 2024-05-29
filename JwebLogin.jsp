<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/web1.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
	 body {
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 min-height: 100vh;
	 background: url('image/wallpapersden.com_1.jpg') no-repeat;
	 background-size: cover;
	 background-position: center;
	   	
 }

		.wrapper{
	position: relative;
	width: 400px;
	height: 440px;
	background: transparent;
	border: 2px solid rgba(255,255, 255, .5);
	border-radius: 20px;
	backdrop-filter: blur(20px);
	box-shadow: 0 0 30px rgba(255,255, 255, .5);
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	transition: height .2s ease;
}
</style>
</head>
<body>


<c:set var="sreg" value = "${sesreg}"/>
<c:choose>
	<c:when test= "${sreg == 'success' }">
	<script>
   		swal("${sesreg}");
	</script>
	</c:when>
</c:choose>
<c:remove var = "sreg" scope = "session"/>


<c:set var="logfail" value = "${logfail}"/>
<c:choose>
	<c:when test= "${logfail == 'Login Failed' }">
	<script>
   		swal("${logfail}");
	</script>
	</c:when>
</c:choose>
<c:remove var = "logfail" scope = "session"/>



<c:set var="emailexist" value = "${emailexist}"/>
<c:choose>
	<c:when test= "${emailexist == 'Already Exist' }">
	<script>
   		swal("Your Email ${emailexist}","Please LogIn Or Try With Another Email.");
	</script>
	</c:when>
</c:choose>
<c:remove var = "emailexist" scope = "session"/>


				<img src="image/logop.png" class="logo" width="100" height="75" >
	<header>
		<nav class = "navigation">	
			<a href="#">Home</a>
			<a href="#">Videos</a>
			<a href="#">Artical</a>
			<a href="#">Help</a>
		
		</nav>
		</header> 
		<div class = "wrapper">
			<div class = "form-box login">
				<h2>Login</h2>
				<form id="dologin">
				
	
					<div class="input-box">				
							<span class="icon"><ion-icon name="mail"></ion-icon></span>
							<input type="email" required id = "email" name="email">
							<label>Email</label>
					</div>
						<div class="input-box">
							<span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
							<input type="password" required id= "password" name="password">
							<label>Password</label>
					</div>
					<div class="remember-forgot">
						<label><input type="checkbox">Remember Me</label>
						<a href="forgetpass">Forgot Password?</a>
					</div>
					<button type="submit" class="btn">Login</button>
					<div class="login-register">
						<p>Don't Have An Account?<a href="regform" class="register-link">Register</a></p>
					</div>
				</form>
			</div>
		
			
			
		</div>
	
	
	
	<script>
        $(document).ready(function(){
           
          
           $("#dologin").submit(function(event){
            
               event.preventDefault();
               ajaxPost();
               
           });
   
           function ajaxPost()
           {
            var email = $("#email").val();
            var password = $("#password").val();
            //alert(email);
           // alert(password);
           //console.log(email +" "+password);
               var formData={
                   email:$("#email").val(),
                   password:$("#password").val(),
                   
                           }
               
       //   alert(formData);
   //console.log("formdata::"+JSON.stringify(formData));
           $.ajax({
      
               type:"post",
               contentType:"application/json",
               url:"http://localhost:8080/SpringMvcNew2/JdoLogin",
               data:JSON.stringify(formData),
              
              // dataType:"application/text",
            success:function(data)
            {
               console.log(data);
                if(data == 'logsuccess')
                {
                    console.log("redired to employee page");
                    location.assign("http://localhost:8080/SpringMvcNew2/Jdash");
                }
                else
                {
                    console.log("err");
                    alert("err");
                }
                     //console.log(status);
           }, 
           
           });
        }
   
        });
   
   
       </script>
		
</body>
</html>