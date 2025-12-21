package com.timposulabs.security;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

	// membuat user konfigurasi dari database
	@Bean
	public UserDetailsManager userDetailsManager(DataSource dataSource) {
		return new JdbcUserDetailsManager(dataSource);		
	}
	
	// konfig custom login page
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		
		httpSecurity.authorizeHttpRequests(configurer -> 
					configurer
						.requestMatchers("/").hasRole("GUEST")
						.requestMatchers("/user/**").hasAnyRole("USERS", "ADMIN")
						.requestMatchers("/admin/**").hasRole("ADMIN")
						.anyRequest().authenticated()
				).formLogin(form ->
					form
						.loginPage("/loginPage")
						.loginProcessingUrl("/authentication")
						.permitAll()
				).logout(logout -> 
					logout.permitAll()
				).exceptionHandling(configurer ->
					configurer.accessDeniedPage("/access-denied")
				);
		
		return httpSecurity.build();
	}
}
