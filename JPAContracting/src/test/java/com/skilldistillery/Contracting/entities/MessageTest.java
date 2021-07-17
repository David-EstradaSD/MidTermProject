package com.skilldistillery.Contracting.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class MessageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Message message;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAContracting");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		message = em.find(Message.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		message = null;
	}

	@Test
	@DisplayName("testing Message entity mapping")
	void test() {
		assertNotNull(message);
		assertEquals("Always be coding!", message.getMessageBody());
	}
	
	@Test
	@DisplayName("test Message to User ManyToOne mapping")
	void test1() {
		assertNotNull(message);
		assertEquals("admin", message.getUser().getUsername());
	}
	
	@Test
	@DisplayName("test Message to Job ManyToOne mapping")
	void test2() {
		assertNotNull(message);
		assertEquals("Skill Distillery Midterm", message.getJob().getJobName());
	}

}
