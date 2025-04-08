package com.csc340.security_jpa_demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import static freemarker.template.utility.Collections12.singletonList;

@SpringBootApplication
public class SecurityJpaDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SecurityJpaDemoApplication.class, args);
	}

	public SecurityJpaDemoApplication(FreeMarkerConfigurer freeMarkerConfigurer) {
		freeMarkerConfigurer.getTaglibFactory().setClasspathTlds(singletonList("/META-INF/security.tld"));
	}

}
