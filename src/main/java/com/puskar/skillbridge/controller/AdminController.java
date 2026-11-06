package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.OrganizerDao;
import com.puskar.skillbridge.dao.ApplicationDao;
import com.puskar.skillbridge.dao.InternshipDao;
import com.puskar.skillbridge.dao.RegistrationDao;
import com.puskar.skillbridge.dao.StudentDao;
import com.puskar.skillbridge.dao.WorkshopDao;
import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Comparator;

@Controller
public class AdminController {
    private final OrganizerDao organizerDao;
    private final StudentDao studentDao;
    private final InternshipDao internshipDao;
    private final WorkshopDao workshopDao;
    private final ApplicationDao applicationDao;
    private final RegistrationDao registrationDao;

    public AdminController(OrganizerDao organizerDao, StudentDao studentDao,
                           InternshipDao internshipDao, WorkshopDao workshopDao,
                           ApplicationDao applicationDao, RegistrationDao registrationDao) {
        this.organizerDao = organizerDao;
        this.studentDao = studentDao;
        this.internshipDao = internshipDao;
        this.workshopDao = workshopDao;
        this.applicationDao = applicationDao;
        this.registrationDao = registrationDao;
    }

    @GetMapping({"/admin/home", "/admin/dashboard"})
    public String adminDashboard(Model model){
        List<Organizer> organizers = organizerDao.findAll();
        model.addAttribute("organizers", organizers);
        model.addAttribute("pendingCount", organizers.stream().filter(org -> !org.isApproved() && org.isEnabled()).count());
        model.addAttribute("approvedCount", organizers.stream().filter(Organizer::isApproved).count());
        model.addAttribute("rejectedCount", organizers.stream().filter(org -> !org.isEnabled()).count());
        List<Student> students = studentDao.findAll();
        model.addAttribute("students", students.stream()
                .sorted(Comparator.comparing(Student::getCreatedAt,
                        Comparator.nullsLast(Comparator.reverseOrder())))
                .toList());
        model.addAttribute("totalStudents", students.size());
        model.addAttribute("activeStudents", students.stream().filter(Student::isEnabled).count());
        model.addAttribute("inactiveStudents", students.stream().filter(student -> !student.isEnabled()).count());
        model.addAttribute("totalInternships", internshipDao.count());
        model.addAttribute("activeInternships", internshipDao.findByActiveTrueOrderByCreatedAtDesc().size());
        model.addAttribute("totalWorkshops", workshopDao.count());
        model.addAttribute("activeWorkshops", workshopDao.findByActiveTrueOrderByCreatedAtDesc().size());
        model.addAttribute("totalApplications", applicationDao.count());
        model.addAttribute("pendingApplications", applicationDao.findAll().stream()
                .filter(application -> application.getStatus().name().equals("PENDING")).count());
        model.addAttribute("totalRegistrations", registrationDao.count());
        return "super-admin/dashboard";
    }

    @GetMapping({"/admin/organizers", "admin/organizer"})
    public String manageOrganizer(Model model){
        model.addAttribute("organizers", organizerDao.findAll());
        return "super-admin/manage-organizers";
    }

    @PostMapping("/admin/organizers/{id}/status")
    public String updateOrganizerStatus(@PathVariable Long id,
                                        @RequestParam boolean approved) {
        Organizer organizer = organizerDao.findById(id).orElseThrow();
        organizer.setApproved(approved);
        organizer.setEnabled(approved);
        organizerDao.save(organizer);
        return "redirect:/admin/organizers";
    }
}
