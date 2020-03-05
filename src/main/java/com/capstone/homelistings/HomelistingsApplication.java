package com.capstone.homelistings;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@Configuration
@ComponentScan("com.capstone.homelistings")
public class HomelistingsApplication {

	public static void main(String[] args) {
		SpringApplication.run(HomelistingsApplication.class, args);
	}

}
