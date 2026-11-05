package com.puskar.skillbridge.config;

import com.puskar.skillbridge.model.Role;
import com.puskar.skillbridge.model.User;
import com.puskar.skillbridge.repository.UserRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Locale;

@Configuration
public class AdminInitializer {

    @Value("${app.admin.email:admin@skillbridge.com}")
    private String adminEmail;

    @Value("${app.admin.password:Admin@123}")
    private String adminPassword;

    @Bean
    public CommandLineRunner initSuperAdmin(UserRepository userRepository, PasswordEncoder passwordEncoder){
        return args -> {
            if (!userRepository.existsByEmailIgnoreCase(adminEmail)){
                User admin = new User(
                        "Super",
                        "Admin",
                        adminEmail.toLowerCase(),
                        passwordEncoder.encode(adminPassword),
                        "9766479723",
                        Role.ADMIN
                );

                admin.setEnabled(true);
                userRepository.save(admin);
                System.out.println("Super Admin created successfully!");
                System.out.println("Email: " + adminEmail);
                System.out.println("Password: " + adminPassword);

            }
        };
    }

}
