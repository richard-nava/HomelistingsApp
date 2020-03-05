package com.capstone.homelistings.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.capstone.homelistings.model.Users;


public interface UsersRepository extends JpaRepository<Users, Long> {

	Optional<Users> getByEmail(String email);
	
	@Query("FROM Users WHERE email=?1 AND password=?2")
	Optional<Users>  login(String email, String password);

	@Query("FROM Users WHERE fname=?1 OR lname=?1 OR email=?1")
	List<Users> searchByName(String name);
	
}
