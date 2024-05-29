<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">

    <!-- Bootstrap CSS -->
	
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
        <!-- Add these lines to the <head> section of your HTML file -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
 <script>
    $(document).ready(function() {
        $('#jsonTable').DataTable();
        $("#tablesec").show();
        $("#editSection").hide();
        
        
    });
    
     function toggleAllCheckboxes() {
        var checkboxes = document.querySelectorAll('table input[type="checkbox"]');
        checkboxes.forEach(function (checkbox) {
            checkbox.checked = !checkbox.checked;
        });
    } 
    </script>
    
    <style>
     body {
      display: flex;
      align-items: center;
     
      margin: 0;
    }
 #upload-container {
      position: relative;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      overflow: hidden;
      cursor: pointer;
       border: 2px solid black; /* Added border */
    }

    #upload-icon {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    #upload-input {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      opacity: 0;
      cursor: pointer;
    }
    
    
     .image-container {
      width: 80px; /* Double the circle size for both width and height */
      height: 80px;
      border-radius: 50%; /* Creates a circular shape */
      overflow: hidden; /* Ensures the image stays within the circular container */
      border: 2px solid black; /* Black border with 2px width */
    }

    .image-container img {
      width: 100%; /* Make the image fill the container */
      height: auto; /* Maintain the image's aspect ratio */
      display: block; /* Remove extra spacing below the image */
    }
    </style>
  </head>
  <body>
  
  
	
		<div class="main--content">
			<div class="header--wrapper">
				<div class="header--title">
					<span>
					<c:set var = "seslog" value = "${seslog}" />
					<c:choose>
						<c:when test = "${seslog == 'Login Success' }">
							<script>
								swal("${seslog}","Welcome ${sesemail}");
							</script>
						</c:when>
					</c:choose>
					<c:remove var = "seslog" scope = "session" />
							${sesemail}
							</span>
							
					<h2>Dashboard</h2>
				</div>
				<div class="user--info">
					<div class="search--box">
					<ion-icon name="search-outline"></ion-icon>
					<input type="text" placeholder="Search"> 
					</div>
					
					
							 <div class="image-container">
	
    
<c:set var="sesimagename" value="${sesimagename}" />

<c:choose>
    <c:when test="${sesimagename eq 'null' or empty sesimagename}">
        <img id="upload-icon" src="upload/male.png" >
    </c:when>
    <c:otherwise>
        <img id="upload-icon" src="upload/${sesimagename}" >
    </c:otherwise>
</c:choose>
  							</div>


				</div>
			</div> 
			
			
			<div class="card--container">
				<h3 class="main--title">todays Data</h3>
				<div class="card--wrapper">
					
					<div class="payment--card light-red">
						<div class="card--header">
							<div class="amount">
								<span class="title">Payment Amount</span>
								<span class="amount-value">500.00</span>
							</div>
								<i class="icon dark-red"><ion-icon name="logo-yen"></ion-icon></i>
						</div>
						<span class="card-detail">**** **** **** 2856</span>
					</div>
					
					
					<div class="payment--card light-purple">
						<div class="card--header">
							<div class="amount">
								<span class="title">Payment Order</span>
								<span class="amount-value">200.00</span>
							</div>
								<i class="icon dark-purple"><ion-icon name="list-sharp"></ion-icon></i>
						</div>
						<span class="card-detail">**** **** **** 4532</span>
					</div>
					
					
					<div class="payment--card light-green">
						<div class="card--header">
							<div class="amount">
								<span class="title">Payment Customer</span>
								<span class="amount-value">350.00</span>
							</div>
								<i class="icon dark-green"><ion-icon name="people-sharp"></ion-icon></i>
						</div>
						<span class="card-detail">**** **** **** 5543</span>
					</div>
					
					
					<div class="payment--card light-blue"> 
						<div class="card--header">
							<div class="amount">
								<span class="title">Payment Proceed</span>
								<span class="amount-value">250.00</span>
							</div>
								<i class="icon dark-blue"><ion-icon name="checkmark-circle-sharp"></ion-icon></i>
						</div>
						<span class="card-detail">**** **** **** 9873</span>
					</div>
					
				</div>
			</div>
			
			
			
			<div class="tabular--wrapper">
				<h3 class="main--title">Finance data</h3><button onclick="toggleAllCheckboxes()">Select All Checkboxes</button>
				<div class="table-container">
				<button id="bttn">Table View</button>
				<section id = "tablesec">				
					<table id="jsonTable" class="display" style="width:100%">
    <thead>
        <tr>
            					<th>Id</th>
								<th>Fullname</th>
								<th>Username</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Email</th>
								<th>Gender</th>
								<th>DOB</th>
								<th>Langauge</th>
								<th>City</th>
								<th>Password</th>
								<th>Image Name</th>
								<th>Edit</th>
								<th>Delete</th>
            <!-- Add more columns as needed -->
        </tr>
    </thead>
    
    <script>
    $(document).ready(function() {
    	$(document).on('click', '#jsonTable .getid', function() {
    		location.reload();
            console.log("Delete button clicked!");
          var row = $(this).closest('tr');
            var id = row.find('td:eq(0)').text();
            console.log("ID: " + id); 
            
            $.ajax({
                type: "DELETE",  
                contentType: "application/json",
                url: "http://localhost:8080/SpringMvcNew2/deletebyid/" + id, 
                dataType: "text",
                success: function(data) {
                    if (data == "Deleted") {
                        alert("Data Deleted Successfully");
                    }
                    console.log(data);
                },
            });
            
            
    	});
    	
        // Setting up event handler outside the populateTable function
        $(document).on('click', '#jsonTable .getvalues', function() {
        	$("#tablesec").hide();
        	$("#editSection").show();
        	
            console.log("Edit button clicked!");
            var row = $(this).closest('tr');
            var id = row.find('td:eq(0)').text();
            console.log("ID: " + id);
            $("#id").val(id);
            
            var fullname = row.find('td:eq(1)').text();
            console.log("Fullname: " + fullname);
            $("input[name='fullname']").val(fullname);
            
            var username = row.find('td:eq(2)').text();
            console.log("Username: " + username);
            $("input[name='username']").val(username);
            
            var phone = row.find('td:eq(3)').text();
            console.log("Phone: " + phone);
            $("input[name='phone']").val(phone);
            
            var address = row.find('td:eq(4)').text();
            console.log("Address: " + address);
            $("input[name='address']").val(address);
            
            var email = row.find('td:eq(5)').text();
            console.log("Email: " + email);
            $("input[name='email']").val(email);
            
            var gender = row.find('td:eq(6)').text();
            console.log("Gender: " + gender);
            $("input[name='gender'][value='" + gender + "']").prop("checked", true);
            
            var dob = row.find('td:eq(7)').text();
            console.log("DOB: " + dob);
            $("input[name='dob']").val(dob);
            													/* checkBox */
            var language = row.find('td:eq(8)').text();
            console.log("Language: " + language);

            // Uncheck all checkboxes initially
            $("input[name='language']").prop("checked", false);

            // Check the checkboxes based on the language value
            if (language.includes("Hindi")) {
                $("input[value='Hindi']").prop("checked", true);
            }

            if (language.includes("English")) {
                $("input[value='English']").prop("checked", true);
            }
            
            
            
            var city = row.find('td:eq(9)').text();
            console.log("City: " + city);
            $("select[name='city']").val(city);
            
            
            var password = row.find('td:eq(10)').text();
            console.log("Password: " + password);
            $("input[name='password']").val(password);
            
            var imagename = row.find('td:eq(11)').text();
            console.log("ImageName: " + imagename);
            
            // Rest of your code here
        });

        $("#bttn").click(function(){
        	$("#editSection").hide();
        	 $("#tablesec").show();
        	 
        	 
            $.get("http://localhost:8080/SpringMvcNew2/gettablelist", function(data, status){
                populateTable(data);
            });
        });

        function populateTable(jsonData) // jsonData name does not matter it can be user define.
        {
            var tableBody = $('table tbody');
            
            $.each(jsonData, function(index, data) {
                var row = '<tr>' +
                    '<td>' + data.id + '</td>' +
                    '<td>' + data.fullname + '</td>' +
                    '<td>' + data.username + '</td>' +
                    '<td>' + data.phone + '</td>' +
                    '<td>' + data.address + '</td>' +
                    '<td>' + data.email + '</td>' +
                    '<td>' + data.gender + '</td>' +
                    '<td>' + data.dob + '</td>' +
                    '<td>' + data.language + '</td>' +
                    '<td>' + data.city + '</td>' +
                    '<td>' + data.password + '</td>' +
                    '<td>' + data.imagename + '</td>' +
                    '<td id="tdId"><button type="button" class="getvalues">Edit</button></td>' +
                    '<td><button type="button" class="getid">Delete</button></td>' +
                    '</tr>';
                
                tableBody.append(row);
            });
        }
    });

</script>
   
    
    
    <tbody>
      

    </tbody>
</table>
</section>
				</div>
			</div>
			
			
			
 <section id="editSection">
				<div style="text-align: center;">
    <img src="image/logop.png" style="width: 100px; height: 75px; display: inline-block;" alt="Logo">
</div>
		<div class = "wrapper">
			
		<div class = "form-box register">
				<h2>Edit Form</h2>
				<form id="editForm" >
				<div class="input-box">
							<span class="icon"><ion-icon name="person-circle-outline"></ion-icon></ion-icon></span>
							<input type="text" id = "id" name = "id" >
							<label>Id</label>
						</div>
				
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
					</div>
					<br>
					<div class="input-gender">
    				<label>Language:</label>
   					 <input type="checkbox" class="language" name="language" value="Hindi">Hindi
    				 <input type="checkbox" class="language" name="language" value="English">English
					</div>
					
					<div class="input-gender" >
						<label for="birthday">Date Of Birth :</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="date" id="birthday" name="dob">
					</div>
					<div class="input-gender">
    <label>City:</label>
    <select name="city">
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
							 <input required name="password" type="text" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1" />
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
					<button type="submit" class="btn" name="action" value="register">update</button>
					<div class="login-register">
						<p>Already Have An Account?<a 
						href="log"
						 class="login-link">Login</a></p>
					</div>
				</form>
			</div>
			
		</div>
		 </section>
		 
		 <script>
		 $(document).ready(function(){
			$("#editForm").submit(function(event){
				location.reload();
				event.preventDefault();
				ajaxPost();
			}); 
			
			function ajaxPost()
			{
				var formData = {
						 id : $("input[name='id']").val(),
						 fullname : $("input[name='fullname']").val(),
						 username : $("input[name='username']").val(),
						 phone : $("input[name='phone']").val(),
						 address : $("input[name='address']").val(),
						 email : $("input[name='email']").val(),
						 gender : $("input[name='gender']").val(),
						 language : $("input[name='language']").val(),
						 
						
						dob : $("input[name='dob']").val(),
						city : $("select[name='city']").val(),
						password : $("input[name='password']").val(),
						}
					console.log(formData);
				
				//Do Post
				$.ajax({
					type : "post",
					contentType:"application/json",
					url:"http://localhost:8080/SpringMvcNew2/updatenewdetail" ,
					data:JSON.stringify(formData) , 
					datatype:"text",
					success:function(data)
					{
						if(data=="updated")
							{
							
							alert("Data Updated Successfully");
							}
						console.log(data);
					},
				});
				//ajaxPost();
			}
		 });
		 
		 </script>
			
			
			
		</div> <!--  main right side div -->

	
	

		
	<!-- For Logo -->
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
     </body>
</html>