package com.puskar.skillbridge.config;

import com.puskar.skillbridge.dao.OrganizerDao;
import com.puskar.skillbridge.dao.StudentDao;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;

@ControllerAdvice
public class CurrentUserModelAdvice {

    private final StudentDao studentDao;
    private final OrganizerDao organizerDao;

    public CurrentUserModelAdvice(StudentDao studentDao, OrganizerDao organizerDao) {
        this.studentDao = studentDao;
        this.organizerDao = organizerDao;
    }

    @ModelAttribute
    public void addCurrentUser(Principal principal, org.springframework.ui.Model model) {
        if (principal == null) {
            return;
        }

        studentDao.findByEmailIgnoreCase(principal.getName())
                .ifPresent(student -> model.addAttribute("student", student));
        organizerDao.findByEmailIgnoreCase(principal.getName())
                .ifPresent(organizer -> model.addAttribute("organizer", organizer));
    }
}
