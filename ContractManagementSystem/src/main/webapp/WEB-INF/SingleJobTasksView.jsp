<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="NavBar.jsp" %>
	
	
	<div>
	<!-- change inline style to css -->
		<div class="card mx-auto mt-3" style="width:95%;">
			<div class="d-flex justify-content-around w-50 mx-auto mt-3">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#EditJob">Edit Job</button>
			  		<a class="btn btn-success" href="?id=${job.id}" role="button">Mark Job as Complete</a>
			  		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#DeleteJob">Delete Job</button>
			</div>
			<div class="container-fluid p-2 m-2">
			    <div class="row">
			    	<div class="col-6">
			    		<h2>${job.jobName}</h2>
			    	</div>
			    	<div class="col-3">
			    		<h4>Start Date</h4>
			    		<p>${job.startDate}</p>
			    	</div>
			    	<div class="col-3">
			    		<h4>Completion Date</h4>
			    		<p>${job.endDate}</p>
			    	</div>
			    </div>
			    <div class="row">
			    	<div class="col-6">
			    		<div class="container-fluid">
			    			<c:choose>
			    				<c:when test="${not empty messages}">
			    					<c:forEach var="message" items="${messages}">
										  <div class="card-body row border mt-1 mb-1 p-0">
    											<div class="border col-2">
    												<h5>${sessionScope.user.username}</h5>
    												<p>Created:</p>
    												<p>${message.creationTime}</p>
    											</div>
    											<div class="container col">
    												<div class="col-8">
    													<p>${message.messageBody}</p>
    												</div>
    												<div class="col">
    													<a href="#" class="btn btn-primary">Go somewhere</a>
    												</div>
    											</div>
	   										</div>
			    					</c:forEach>
			    				</c:when>
			    					<c:otherwise>
			    						 <div class="card-body row border mt-1 mb-1 p-0">
    											<div class="border col-2">
    											</div>
    											<div class="container col">
    												<div class="col-8">
    													<p>No messages recorded yet.</p>
    												</div>
    												<div class="col">
    												</div>
    											</div>
	   										</div>
			    					</c:otherwise>
			    			</c:choose>
			    		</div>
			    		<form action="message.do?id=${job.id }" method="POST">
			    		   <div class="m-2 col" >
    							<label for="messageBody" class="form-label">Reply:</label>
   								 <textarea class="form-control" name="messageBody"></textarea>
  							</div>
			    			<input class="btn btn-primary" type="submit">
			    		</form>
			    	</div>
			    	<div class="col-6">
			    		<c:choose>
					      		<c:when test="${not empty tasks}">
					      		<table class="table">
					      		 	<thead>
										    <tr>
										      <th scope="col">Task Name</th>
										      <th scope="col">Task Details</th>
										      <th scope="col">Priority Number</th>
										      <th scope="col">Begin Date</th>
										      <th scope="col">End Date</th>
										    </tr>
									</thead>
					      			<c:forEach var="task" items="${tasks}">
					      			
										 
										  <tbody>
										    <tr>
										<!--        <th scope="row">1</th>     -->
										      <td>${task.taskName}</td>
										      <td>${task.taskDetails}</td>
										      <td>${task.priorityNumber}</td>
										      <td>${task.beginTime}</td>
										      <td>${task.endTime}</td>
										    </tr>
										  </tbody>
										
					    		  	</c:forEach>
					    		  	</table>
					      		</c:when>
					      		<c:otherwise>No tasks associated with this job.</c:otherwise>
					      		</c:choose>
			    	</div>
			    </div>
			    <div class="row">
			    	<div class="col">
			    		${job.jobDescription}
			    	</div>
			    </div>
			</div>
		</div>
	</div>

<%-- 
	<div class="container">
  	<div class="row">
   		
   		<!-- Left Column -->
   		<div class="col align-self-start">
     		<strong>LEFT COLUMN PLEAE MAKE ME NARROWER</strong>
    	</div>
    	
    	<!-- Center Column -->

    	<div class="col align-self-center">
   
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			  		<h5>

			  		</h5>
			  	</div>
			</div>	
			
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			   		<h5 class="card-title">This is the job for contractor: </h5>
			    		<p class="card-text">${job.jobName} -> ${job.startDate} -> ${job.endDate}</p>
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Messages</th>
					      <th scope="col">Tasks</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <td>
					      	<strong>*** Messages Go Here ***</strong>
					      </td>
					      <td> --%>
<%-- 					      <c:choose>
					    
					      		<c:when test="${not empty tasks}">
					      		 <thead>
										    <tr>
										      <th scope="col">Task Name</th>
										      <th scope="col">Task Details</th>
										      <th scope="col">Priority Number</th>
										      <th scope="col">Begin Date</th>
										      <th scope="col">End Date</th>
										      <th scope="col">Completion Status</th>
										    </tr>
										  </thead>
					      			<c:forEach var="task" items="${tasks}">
					      			<table class="table">
										 
										  <tbody>
										    <tr>
										<!--        <th scope="row">1</th>     -->
										      <td>${task.taskName}</td>
										      <td>${task.taskDetails}</td>
										      <td>${task.priorityNumber}</td>
										      <td>${task.beginTime}</td>
										      <td>${task.endTime}</td>
										      <td>
										      	<c:if test="${task.isComplete}">Completed</c:if>
										      	<c:if test="${!task.isComplete}">
										      		<a class="btn btn-primary" href="setTaskComplete.do?id=${task.id}" role="button">Mark Complete</a>
										      	</c:if>
										      
										      </td>
										    </tr>
										  </tbody>
										</table>
					    		  	</c:forEach>
					      		</c:when>
					      		<c:otherwise>No tasks associated with this job.</c:otherwise>
					      		</c:choose> --%>
<%-- 					      </td>
					    </tr>
					  </tbody>
					</table>    	
			  	</div>
			</div>
			
				<br>
			
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			  		<h5>Job Details: ${job.jobDescription}</h5>
			  	</div>
			</div>

    	</div>
    	
    	<!-- Right Column -->
    	<div class="col align-self-end">
      		<strong>RIGHT PLEASE MAKE ME NARROWER</strong>
    	</div>
    	
  	</div>
	</div>
	 --%>



<%@ include file="DeleteJobModal.jsp" %>
<%@ include file="EditJobModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>