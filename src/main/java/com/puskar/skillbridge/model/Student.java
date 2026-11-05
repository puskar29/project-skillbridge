package com.puskar.skillbridge.model;

import jakarta.persistence.*;

import java.io.Serial;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "students")
@DiscriminatorValue("STUDENT")
@PrimaryKeyJoinColumn(name = "user_id")
public class Student extends User {

    @Serial
    private static final long serialVersionUID = 1002L;

    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", length = 20)
    private Gender gender;

    @Column(name = "college", length = 120)
    private String college;

    @Column(name = "major", length = 80)
    private String major;

    @Column(name = "graduation_year")
    private Integer graduationYear;

    @Column(name = "study_year", length = 20)
    private String studyYear;

    @ElementCollection
    @CollectionTable(
            name = "student_skills",
            joinColumns = @JoinColumn(name = "student_id")
    )
    @Column(name = "skill", length = 80)
    private List<String> skills = new ArrayList<>();

    public Student() {
        super();
    }

    public Student(String firstName, String lastName, String email,
                   String passwordHash, String phone) {
        super(firstName,  lastName, email, passwordHash, phone, Role.STUDENT);
    }

    /** Convenience helper for the signup controller. */
    public static Student fromSignup(String firstName, String lastName, String email,
                                     String passwordHash, String phone,
                                     LocalDate dateOfBirth, Gender gender,
                                     String college, String major,
                                     Integer graduationYear, String studyYear,
                                     List<String> skills) {
        Student student = new Student(firstName, lastName, email, passwordHash, phone);
        student.setDateOfBirth(dateOfBirth);
        student.setGender(gender);
        student.setCollege(college);
        student.setMajor(major);
        student.setGraduationYear(graduationYear);
        student.setStudyYear(studyYear);
        student.setSkills(skills == null ? new ArrayList<>() : skills);
        return student;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public Integer getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(Integer graduationYear) {
        this.graduationYear = graduationYear;
    }

    public String getStudyYear() {
        return studyYear;
    }

    public void setStudyYear(String studyYear) {
        this.studyYear = studyYear;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }
}
