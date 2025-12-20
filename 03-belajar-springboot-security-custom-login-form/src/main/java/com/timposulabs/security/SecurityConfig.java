package com.timposulabs.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
public class SecurityConfig {

	// membuat user yang hanya running di memory
	@Bean
	public InMemoryUserDetailsManager userDetailsManager() {
		
		UserDetails aco = User.builder()
				.username("aco")
				.password("{noop}test123")
				.roles("GUEST")
				.build();
		
		UserDetails ade = User.builder()
				.username("ade")
				.password("{noop}test123")
				.roles("GUEST", "USERS")
				.build();
		
		UserDetails ucup = User.builder()
				.username("ucup")
				.password("{noop}test123")
				.roles("GUEST", "USERS", "ADMIN")
				.build();				
		
		return new InMemoryUserDetailsManager(aco, ade, ucup);
	}
}
