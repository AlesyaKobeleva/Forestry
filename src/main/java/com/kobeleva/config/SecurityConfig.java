package com.kobeleva.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("kobeleva").password("123456").roles("ADMIN", "USER");
        auth.inMemoryAuthentication().withUser("master").password("master").roles("MASTER", "USER");
        auth.inMemoryAuthentication().withUser("engineer").password("eng").roles("ENGINEER", "USER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/profile/**").access("hasRole('ROLE_USER')")
                .antMatchers("/master/**").access("hasRole('ROLE_MASTER')")
                .antMatchers("/engineer/**").access("hasRole('ROLE_ENGINEER')")
                .and()
                .formLogin().loginPage("/login").failureUrl("/login?error")
                .usernameParameter("username").passwordParameter("password")
                .and()
                .logout().logoutSuccessUrl("/login?logout")
                .and()
                .csrf();
    }
}