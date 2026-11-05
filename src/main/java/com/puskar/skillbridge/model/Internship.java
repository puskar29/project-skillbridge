package com.puskar.skillbridge.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "internship_tbl")
public class Internship implements Serializable {

    @Serial
    private static final long serialVersionUID = 2123L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "internship_id")
    private Long id;

    @NotBlank
    @Column(name = "internship_title")
    private String title;

    @NotBlank
    @Column(name = "internship_company")
    private String company;

    @Column(name = "internship_description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "internship_location")
    private String location;

    @Column(name = "internship_duration")
    private String duration;

    @Enumerated(EnumType.STRING)
    private  EmployeeType type;

    @Column(name = "internship_stipend")
    private String stipend;

    @Column(name = "internship_deadline")
    private LocalDate deadline;

    private boolean active = true;

    @ElementCollection
    private List<String> skills = new ArrayList<>();

    @CreationTimestamp
    @Column(name = "internship_createdAt")
    private LocalDate createdAt;

    @UpdateTimestamp
    @Column(name = "internship_updatedAt")
    private LocalDate updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "organizer_id")
    private Organizer organizer;

    public String getSkillsText() {
        return skills == null ? "" : String.join("\n", skills);
    }

    public Internship() {
    }

    public Internship(Long id, String title, String company, String description, String location, EmployeeType type, String duration, String stipend, LocalDate deadline, boolean active, List<String> skills, LocalDate createdAt, LocalDate updatedAt) {
        this.id = id;
        this.title = title;
        this.company = company;
        this.description = description;
        this.location = location;
        this.type = type;
        this.duration = duration;
        this.stipend = stipend;
        this.deadline = deadline;
        this.active = active;
        this.skills = skills;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public EmployeeType getType() {
        return type;
    }

    public void setType(EmployeeType type) {
        this.type = type;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getStipend() {
        return stipend;
    }

    public void setStipend(String stipend) {
        this.stipend = stipend;
    }

    public LocalDate getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDate deadline) {
        this.deadline = deadline;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Organizer getOrganizer() {
        return organizer;
    }

    public void setOrganizer(Organizer organizer) {
        this.organizer = organizer;
    }
}
