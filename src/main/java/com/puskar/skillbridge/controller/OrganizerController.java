package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.ApplicationDao;
import com.puskar.skillbridge.dao.OrganizerDao;
import com.puskar.skillbridge.dao.RegistrationDao;
import com.puskar.skillbridge.model.*;
import com.puskar.skillbridge.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Controller
public class OrganizerController {

    private final OrganizerDao organizerDao;

    private final UploadService uploadService;

    private final ApplicationDao applicationDao;

    private final RegistrationDao registrationDao;

    public OrganizerController(OrganizerDao organizerDao, UploadService uploadService, ApplicationDao applicationDao, RegistrationDao registrationDao) {
        this.organizerDao = organizerDao;
        this.uploadService = uploadService;
        this.applicationDao = applicationDao;
        this.registrationDao = registrationDao;
    }

    @GetMapping("/organizer/home")
    public String openOrganizerDashboard(Model model, Principal principal){
        String username = (principal != null) ? principal.getName() : "organizer";
        model.addAttribute("username", username);
        if (principal != null) {
            organizerDao.findByEmailIgnoreCase(principal.getName())
                    .ifPresent(org -> {
                        model.addAttribute("organizer", org);
                        model.addAttribute("applications",
                                applicationDao.findByInternshipOrganizerIdOrderByAppliedAtDesc(org.getId()));
                        model.addAttribute("registrations",
                                registrationDao.findByWorkshopOrganizerAccountIdOrderByRegisteredAtDesc(org.getId()));
                    });
        }
        return "organizer/dashboard";
    }

    @GetMapping("/organizer/pending")
    public String pending(){
        return "organizer/pending";
    }

    @GetMapping("/organizer/profile")
    public String organizerProfile(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        Organizer organizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        model.addAttribute("organizer", organizer);
        model.addAttribute("memberSince", organizer.getCreatedAt() == null ? null
                : organizer.getCreatedAt().format(DateTimeFormatter.ofPattern("MMM yyyy", Locale.ENGLISH)));
        return "organizer/profile";
    }

    @GetMapping("/organizer/profile/edit")
    public String editOrganizerProfile(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        Organizer organizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        model.addAttribute("organizer", organizer);
        return "organizer/edit-profile";
    }

    @PostMapping("/organizer/profile/update")
    public String updateOrganizerProfile(@ModelAttribute Organizer form, Principal principal) {
        if (principal == null) return "redirect:/login";
        Organizer organizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        organizer.setFirstName(form.getFirstName());
        organizer.setLastName(form.getLastName());
        organizer.setPhone(form.getPhone());
        organizer.setOrganizationName(form.getOrganizationName());
        organizer.setOrganizationType(form.getOrganizationType());
        organizer.setPosition(form.getPosition());
        organizer.setWebsite(form.getWebsite());
        organizer.setOrganizationDescription(form.getOrganizationDescription());

        organizerDao.save(organizer);
        return "redirect:/organizer/profile?success";
    }

    @PostMapping("/organizer/profile/photo")
    public String uploadOrganizerPhoto(
            @RequestParam("profileImage") MultipartFile imageFile,
            Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        Organizer organizer = organizerDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        String fileName = uploadService.uploadProfileImg(imageFile);

        if (fileName != null) {
            organizer.setProfileImage(fileName);
            organizerDao.save(organizer);
        }

        return "redirect:/organizer/profile";
    }

    @GetMapping("/organizer/applications")
    public String applications(Model model, Principal principal) {

        Organizer organizer = organizerDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        model.addAttribute(
                "applications",
                applicationDao.findByInternshipOrganizerIdOrderByAppliedAtDesc(
                        organizer.getId()
                )
        );

        return "organizer/applications";
    }

    @PostMapping("/organizer/applications/{id}/status")
    public String updateApplicationStatus(
            @PathVariable Long id,
            @RequestParam ApplicationStatus status,
            Principal principal) {

        Organizer organizer = organizerDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        Application application = applicationDao
                .findByIdAndInternshipOrganizerId(id, organizer.getId())
                .orElseThrow();

        application.setStatus(status);
        applicationDao.save(application);

        return "redirect:/organizer/applications";
    }

    @GetMapping("/organizer/registrations")
    public String registrations(Model model, Principal principal) {

        Organizer organizer = organizerDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        model.addAttribute(
                "registrations",
                registrationDao.findByWorkshopOrganizerAccountIdOrderByRegisteredAtDesc(
                        organizer.getId()
                )
        );

        return "organizer/registrations";
    }

    @PostMapping("/organizer/registrations/{id}/status")
    public String updateRegistrationStatus(
            @PathVariable Long id,
            @RequestParam RegistrationStatus status,
            Principal principal) {

        Organizer organizer = organizerDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        Registration registration = registrationDao
                .findByIdAndWorkshopOrganizerAccountId(id, organizer.getId())
                .orElseThrow();

        registration.setStatus(status);
        registrationDao.save(registration);

        return "redirect:/organizer/registrations";
    }
}
