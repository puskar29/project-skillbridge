package com.puskar.skillbridge.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;


@Entity
@Table(name = "workshop_tbl")
public class Workshop implements Serializable {

    @Serial
    private static final long serialVersionUID = 251635L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(name = "workshop_title")
    private String title;

    @NotBlank
    @Column(name = "workshop_organizer")
    private String organizer;

    @Column(name = "workshop_description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "workshop_location")
    private String location;

    @Column(name = "workshop_duration")
    private String duration;

    @Enumerated(EnumType.STRING)
    private  Level level;

    @Column(name="workshop_participation")
    private Integer maxParticipation;

    @Column(name = "workshop_category")
    private String category;

    @Column(name = "workshop_deadline")
    private LocalDate deadline;

    private boolean active = true;

    @CreationTimestamp
    @Column(name = "workshop_createdAt")
    private LocalDate createdAt;

    @UpdateTimestamp
    @Column(name = "workshop_updatedAt")
    private LocalDate updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "organizer_account_id")
    private Organizer organizerAccount;

    public Workshop() {
    }

    public Workshop(Long id, String title, String organizer, String description, String location, String duration, Level level, Integer maxParticipation, String category, LocalDate deadline, boolean active, LocalDate createdAt, LocalDate updatedAt) {
        this.id = id;
        this.title = title;
        this.organizer = organizer;
        this.description = description;
        this.location = location;
        this.duration = duration;
        this.level = level;
        this.maxParticipation = maxParticipation;
        this.category = category;
        this.deadline = deadline;
        this.active = active;
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

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
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

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Integer getMaxParticipation() {
        return maxParticipation;
    }

    public void setMaxParticipation(Integer maxParticipation) {
        this.maxParticipation = maxParticipation;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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


    public Organizer getOrganizerAccount() {
        return organizerAccount;
    }

    public void setOrganizerAccount(Organizer organizerAccount) {
        this.organizerAccount = organizerAccount;
    }
}
