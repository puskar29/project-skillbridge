package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.OrganizerDao;
import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.service.InternshipService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class InternshipController {

    private final InternshipService internshipService;
    private final OrganizerDao organizerDao;

    public InternshipController(InternshipService internshipService, OrganizerDao organizerDao) {
        this.internshipService = internshipService;
        this.organizerDao = organizerDao;
    }

    @GetMapping("/organizer/internship/add")
    private String openInternship(Model model, Principal principal){
        if (!isApproved(principal)) {
            return "redirect:/organizer/home?error=not-approved";
        }
        return "organizer/add-internship";
    }

    @PostMapping("/organizer/internship/add")
    private String addInternship(@ModelAttribute Internship internship,
                                 @RequestParam(name = "skillsText", required = false) String skillsText,
                                 Principal principal
                                 ){
        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
        internship.setOrganizer(currentOrganizer);
        if (currentOrganizer == null || !currentOrganizer.isApproved()) {
            return "redirect:/organizer/home?error=not-approved";
        }
        internship.setCompany(currentOrganizer.getOrganizationName());

        List<String> skills = new ArrayList<>();

        if (skillsText != null && !skillsText.isBlank()){
            for (String skill : skillsText.split("[,\\r\\n]+")){
                String trimed = skill.trim();
                if (!trimed.isEmpty() && !skills.contains(trimed)){
                    skills.add(trimed);
                }
            }
        }


        internship.setSkills(skills);
        internship.setCreatedAt(LocalDate.now());
        internshipService.addInternship(internship);
        return "redirect:/organizer/internship/add?success";
    }

    @GetMapping("/organizer/internship/manage")
    private String showInternship(Model model, Principal principal){
        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
        if (currentOrganizer == null || !currentOrganizer.isApproved()) {
            return "redirect:/organizer/home?error=not-approved";
        }
        model.addAttribute("intern_list", internshipService.getInternshipsByOrganizer(currentOrganizer));
        return "organizer/manage-internships";
    }

    @GetMapping("/organizer/internship/edit/{id}")
    public String editInternshipForm(@PathVariable Long id, Model model, Principal principal){
        if (!isApproved(principal)) {
            return "redirect:/organizer/home?error=not-approved";
        }
        Internship internship = internshipService.getInternshipById(id);
        model.addAttribute("internship", internship);
        model.addAttribute("edit", true);
        return "organizer/add-internship";
    }

    @PostMapping("/organizer/internship/edit/{id}")
    public String editInternship(@PathVariable Long id,
                                 @ModelAttribute Internship internship,
                                 @RequestParam(name = "skillsText", required = false) String skillsText,
                                 Model model,
                                 Principal principal){
        model.addAttribute("edit", true);
        List<String> skills = new ArrayList<>();
        if (skillsText != null && !skillsText.isBlank()){
            for (String skill : skillsText.split("[,\\r\\n]+")){
                String trimed = skill.trim();
                if (!trimed.isEmpty() && !skills.contains(trimed)){
                    skills.add(trimed);
                }
            }
        }

        internship.setId(id);
        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        if (!currentOrganizer.isApproved()) {
            return "redirect:/organizer/home?error=not-approved";
        }
        internship.setCompany(currentOrganizer.getOrganizationName());
        internship.setOrganizer(currentOrganizer);
        internship.setSkills(skills);
        internshipService.updateInternship(internship);
        return "redirect:/organizer/internship/manage?updated";
    }

    private boolean isApproved(Principal principal) {
        return principal != null
                && organizerDao.findByEmailIgnoreCase(principal.getName())
                .map(Organizer::isApproved)
                .orElse(false);
    }



    @GetMapping("/organizer/internship/delete/{id}")
    public String deleteInternship(@PathVariable long id){
        Internship internship = internshipService.getInternshipById(id);

        internshipService.deleteInternship(internship);

        return "redirect:/organizer/internship/manage";
    }
}
