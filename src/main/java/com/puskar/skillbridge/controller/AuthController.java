package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.UserDao;
import com.puskar.skillbridge.model.Gender;
import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Student;
import com.puskar.skillbridge.model.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.List;

@Controller
public class AuthController {

    private final PasswordEncoder passwordEncoder;
    private final UserDao userDao;

    public AuthController(PasswordEncoder passwordEncoder, UserDao userDao) {
        this.passwordEncoder = passwordEncoder;
        this.userDao = userDao;
    }


    @GetMapping("/signup")
    public String signupPage() {
        return "signup";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/auth/register")
    public String register(
            @RequestParam String role,
            @RequestParam("first_name") String firstName,
            @RequestParam("last_name") String lastName,
            @RequestParam String email,
            @RequestParam(required = false) String phone,
            @RequestParam String password,
            @RequestParam("confirm_password") String confirmPassword,
            @RequestParam(required = false) String dob,
            @RequestParam(required = false) String gender,
            @RequestParam(required = false) String college,
            @RequestParam(required = false) String major,
            @RequestParam(name = "graduation_year", required = false) Integer graduationYear,
            @RequestParam(name = "study_year", required = false) String studyYear,
            @RequestParam(required = false) String skills,
            @RequestParam(name = "organization_name", required = false) String organizationName,
            @RequestParam(name = "organization_type", required = false) String organizationType,
            @RequestParam(required = false) String position,
            @RequestParam(required = false) String website,
            @RequestParam(name = "organization_description", required = false) String organizationDescription) {

        String cleanEmail = email == null ? "" : email.trim().toLowerCase();
        boolean organizerSignup = "ORGANIZER".equalsIgnoreCase(role);
        String selectedRole = organizerSignup ? "ORGANIZER" : "STUDENT";

        if (cleanEmail.isBlank() || password == null || password.isBlank()) {
            return "redirect:/signup?error=required&role=" + selectedRole;
        }

        if (userDao.existsByEmailIgnoreCase(cleanEmail)) {
            return "redirect:/signup?error=email&role=" + selectedRole;
        }

        if (!password.equals(confirmPassword)) {
            return "redirect:/signup?error=password&role=" + selectedRole;
        }

        if (organizerSignup && (organizationName == null || organizationName.isBlank())) {
            return "redirect:/signup?error=organization&role=ORGANIZER";
        }

        String passwordHash = passwordEncoder.encode(password);
        User user;

        if (organizerSignup) {
            user = Organizer.fromSignup(
                    trim(firstName),
                    trim(lastName),
                    cleanEmail,
                    passwordHash,
                    trim(phone),
                    trim(organizationName),
                    trim(organizationType),
                    trim(position),
                    trim(website),
                    trim(organizationDescription)
            );
        } else {
            LocalDate dateOfBirth = null;

            if (dob != null && !dob.isBlank()) {
                try {
                    dateOfBirth = LocalDate.parse(dob);
                } catch (DateTimeParseException ex) {
                    return "redirect:/signup?error=dob&role=STUDENT";
                }
            }

            List<String> skillList = skills == null || skills.isBlank()
                    ? List.of()
                    : Arrays.stream(skills.split(","))
                            .map(String::trim)
                            .filter(skill -> !skill.isEmpty())
                            .toList();

            user = Student.fromSignup(
                    trim(firstName),
                    trim(lastName),
                    cleanEmail,
                    passwordHash,
                    trim(phone),
                    dateOfBirth,
                    parseGender(gender),
                    trim(college),
                    trim(major),
                    graduationYear,
                    trim(studyYear),
                    skillList
            );
        }

        userDao.save(user);

        return "redirect:/login?registered=true";
    }

    private Gender parseGender(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }

        try {
            return Gender.valueOf(value);
        } catch (IllegalArgumentException ex) {
            return null;
        }
    }

    private String trim(String value) {
        return value == null ? null : value.trim();
    }
}
