package com.skilldistillery.Contracting.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.TaskDAO;
import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.Task;

@Controller
public class TaskController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TaskDAO taskDAO;

	@RequestMapping(path = "setTaskComplete.do")
	public String updateTaskComplete(RedirectAttributes redir, int id) {
		
		Task task = taskDAO.updateTaskisComleteByTaskId(id);
		
		if(!task.getIsComplete()) {
			redir.addFlashAttribute("taskCompleteFlag", true);
			return "redirect:Error.do";
		}
		
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}

	@RequestMapping(path = "addNewTaskToJob.do", method = RequestMethod.POST)
	public String createTaskByJobId(RedirectAttributes redir, Task task) {
		
		Task managedTask = taskDAO.createTask(task);
		
		if(managedTask == null) {
			redir.addFlashAttribute("taskCreationFlag", true);
			return "redirect:Error.do";
		}
		
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}

}
