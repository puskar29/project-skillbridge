package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.StudentDao;
import com.puskar.skillbridge.model.Student;
import com.puskar.skillbridge.service.InternshipService;
import com.puskar.skillbridge.service.UploadService;
import com.puskar.skillbridge.service.WorkshopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

@Controller
public class StudentController {

    private final StudentDao studentDao;
    private final InternshipService internshipService;
    private final WorkshopService workshopService;
    private final UploadService uploadService;

    public StudentController(StudentDao studentDao, InternshipService internshipService, WorkshopService workshopService, UploadService uploadService) {
        this.studentDao = studentDao;
        this.internshipService = internshipService;
        this.workshopService = workshopService;
        this.uploadService = uploadService;
    }

    @GetMapping({"/student/dashboard", "/student/home"})
    public String StudentProfile(Model model, Principal principal){

        if (principal != null){
            Student student = studentDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
            model.addAttribute("student", student);
            if (student != null && student.getCreatedAt() != null) {
                model.addAttribute("memberSince", student.getCreatedAt().format(DateTimeFormatter.ofPattern("MMM yyyy", Locale.ENGLISH)));
            }
        }

        model.addAttribute("internships", internshipService.getActiveInternships());
        model.addAttribute("workshops", workshopService.getActiveWorkshops());

        return "student/dashboard";
    }

    @GetMapping("/student/profile")
    public String studentProfile(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        Student student = studentDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        model.addAttribute("student", student);
        model.addAttribute("memberSince", student.getCreatedAt() == null ? null
                : student.getCreatedAt().format(DateTimeFormatter.ofPattern("MMM yyyy", Locale.ENGLISH)));
        return "student/profile";
    }

    @GetMapping("/student/profile/edit")
    public String editStudentProfile(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        Student student = studentDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        model.addAttribute("student", student);
        return "student/edit-profile";
    }

    @PostMapping({"/student/profile/update", "/studnet/profile/update"})
    public String updateProfile(@ModelAttribute Student studentForm,
                                @RequestParam(required = false) String skillsInput,
                                Principal principal){
        if (principal == null) return "redirect:/login";

        Student student = studentDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        student.setFirstName(studentForm.getFirstName());
        student.setLastName(studentForm.getLastName());
        student.setPhone(studentForm.getPhone());
        student.setCollege(studentForm.getCollege());
        student.setMajor(studentForm.getMajor());
        student.setGraduationYear(studentForm.getGraduationYear());
        student.setStudyYear(studentForm.getStudyYear());
        student.setDateOfBirth(studentForm.getDateOfBirth());
        student.setGender(studentForm.getGender());

        if (skillsInput != null) {
            List<String> skillList = Arrays.stream(skillsInput.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .toList();
            student.setSkills(skillList);
        } else if (studentForm.getSkills() != null && !studentForm.getSkills().isEmpty()) {
            student.setSkills(studentForm.getSkills());
        }

        studentDao.save(student);
        return "redirect:/student/profile?success";
    }

    @PostMapping("/student/profile/photo")
    public String uploadStudentPhoto(
            @RequestParam("profileImage") MultipartFile imageFile,
            Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        Student student = studentDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        String fileName = uploadService.uploadProfileImg(imageFile);

        if (fileName != null) {
            student.setProfileImage(fileName);
            studentDao.save(student);
        }

        return "redirect:/student/profile";
    }
}

