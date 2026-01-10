package com.timposulabs.security;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

	// membuat user konfigurasi dari database
	@Bean
	public UserDetailsManager userDetailsManager(DataSource dataSource) {
		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager(dataSource);
		
		// set query untuk mendapatkan user berdasarkan username
		jdbcUserDetailsManager.setUsersByUsernameQuery(
				"SELECT user_id, user_password, active FROM accounts WHERE user_id=?");
		
		// set query untuk mendapatkan role berdasarkan username
		jdbcUserDetailsManager.setAuthoritiesByUsernameQuery(
				"SELECT user_id, user_role FROM roles WHERE user_id=?");
		
		return jdbcUserDetailsManager;		
	}
	
	// Bean untuk Password Encoder BCrypt
	@Bean
	public PasswordEncoder passwordEncoder() {
	    // Angka 12 adalah 'High security' (log rounds) cocok production. Standar adalah 10-12.
	    return new BCryptPasswordEncoder(12);
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
