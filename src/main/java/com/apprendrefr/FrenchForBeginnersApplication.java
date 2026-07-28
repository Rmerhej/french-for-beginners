package com.apprendrefr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "com.apprendrefr")
@EnableJpaRepositories(basePackages = "com.apprendrefr.repository")
@EntityScan(basePackages = "com.apprendrefr.entity")
public class FrenchForBeginnersApplication {

	public static void main(String[] args) {
		SpringApplication.run(FrenchForBeginnersApplication.class, args);
	}

}
