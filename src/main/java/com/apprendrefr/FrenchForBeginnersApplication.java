package com.apprendrefr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = "com.apprendrefr")
@SpringBootApplication
public class FrenchForBeginnersApplication {

	public static void main(String[] args) {
		SpringApplication.run(FrenchForBeginnersApplication.class, args);
	}

}
