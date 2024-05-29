<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/web1.css">
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
</style>
</head>
<body>


				<img src="image/logop.png" class="logo" width="100" height="75" >
	
		<div class = "wrapper">
			
		<div class = "form-box register">
				<h2>Registration</h2>
				<form id="RegForm">
				
						<div class="input-box">
							<span class="icon"><ion-icon name="person-circle-outline"></ion-icon></ion-icon></span>
							<input type="text" name = "fullname" required>
							<label>Full Name</label>
						</div>
						
						<div class="input-box">
							<span class="icon"><ion-icon name="person-circle-outline"></ion-icon></ion-icon></span>
							<input type="text" name = "username" required>
							<label>Username</label>
						</div>
					
					 <div class="input-box">
					 	<span class="icon"><ion-icon name="call-outline"></ion-icon></span>
                    	<input required type="text" name="phone" id="phone" > 
                    	<label>Phone Number</label>
           			</div>

						<div class="input-box">
							<span class="icon"><ion-icon name="person-circle-outline"></ion-icon></ion-icon></span>
							<input type="text" name = "address" required>
							<label>Address</label>
						</div>
					
					<div class="input-box">
							<span class="icon"><ion-icon name="mail"></ion-icon></span>
							<input type="email" name= "email" required>
							<label>Email</label>
					</div>
					
					<div class="input-gender" >
						<label>Gender :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" value="male">Male &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" value="female">Female
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>Language :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="language" value="Hindi">Hindi &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="language" value="English">English
					</div>
					<br>
					
					<div class="input-gender" >
						<label for="birthday">Date Of Birth :</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="date" id="birthday" name="dob">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>City :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name ="city">
							<option>select</option>
							<option>Raigarh</option>
							<option>Nagpur</option>
							<option>Rajnandgaon</option>
							<option>Raipur</option>
							<option>Bilaspur</option>							
						</select>
					</div>
					
						
					
						<div class="input-box">
							<span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
							 <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1" />
							<label>Password</label>
						</div>
						
						<!-- <div class="input-box">
							<span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
							<input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16" id="pass2" onkeyup="checkPass(); return false;" />
							<span id="confirmMessage" class="confirmMessage"></span>
							
							<label>Password Confirm</label>
						</div> -->
						
					<div class="remember-forgot">
						<label><input type="checkbox">I agree to the terms & conditions. </label>
						
					</div>
					<button type="submit" class="btn" name="action" value="register">Register</button>
					<div class="login-register">
						<p>Already Have An Account?<a 
						href="log"
						 class="login-link">Login</a></p>
					</div>
				</form>
			</div>
			
			
		</div>
		
		
		
<script>
$(document).ready(function(){
	$("#RegForm").submit(function(event){
		event.preventDefault();
		ajaxPost();
	}); 
	
	function ajaxPost()
	{
		var formData = {
				 fullname : $("input[name='fullname']").val(),
				 username : $("input[name='username']").val(),
				 phone : $("input[name='phone']").val(),
				 address : $("input[name='address']").val(),
				 email : $("input[name='email']").val(),
				 gender: $("input[name='gender']:checked").val(),
			     language: $("input[name='language']:checked").val(),
				dob : $("input[name='dob']").val(),
				city: $("select[name='city']").val(),
				password : $("input[name='password']").val(),
				}
			console.log(formData);
		
		//Do Post
		$.ajax({
			type : "post",
			contentType:"application/json",
			url:"http://localhost:8080/SpringMvcNew2/savereg" ,
			data:JSON.stringify(formData) , 
			datatype:"application/json",
			success:function(data)
			{
				if(data=="savereg")
					{
					alert("Data Saved Successfully");
					console.log("redired to login page");
	                  location.assign("http://localhost:8080/SpringMvcNew2/JwebLogin");
					}
				console.log(data);
			},
		});
		//ajaxPost();
	}
 });
 
</script>
</body>
</html>