package com.skilldistillery.Contracting.data;

import com.skilldistillery.Contracting.entities.Job;

public interface JobDAO {
	
	Job addJob(Job job);
	
	boolean removeJob(int id);
	
	Job updateJob(Job job);
	
	Job markJobComplete(int id);
	// update (mark complete) methods
	

}
