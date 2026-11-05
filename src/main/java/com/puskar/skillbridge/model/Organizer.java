package com.puskar.skillbridge.model;

import jakarta.persistence.*;

import java.io.Serial;

/**
 * Organizer account. Extends {@link User} so login, email, password and
 * role handling are shared with students.
 */
@Entity
@Table(name = "organizers")
@DiscriminatorValue("ORGANIZER")
@PrimaryKeyJoinColumn(name = "user_id")
public class Organizer extends User {

    @Serial
    private static final long serialVersionUID = 1003L;

    @Column(name = "organization_name", nullable = false, length = 120)
    private String organizationName;

    @Column(name = "organization_type", length = 60)
    private String organizationType;

    @Column(name = "position", length = 80)
    private String position;

    @Column(name = "website", length = 160)
    private String website;

    @Column(name = "organization_description", columnDefinition = "TEXT")
    private String organizationDescription;

    /**
     * New organizers start unapproved. An admin can flip this to true from
     * the super-admin dashboard before the organizer can publish opportunities.
     */
    @Column(name = "approved", nullable = false)
    private boolean approved = false;

    public Organizer() {
    }

    public Organizer(String firstName, String lastName, String email,
                     String passwordHash, String phone) {
        super(firstName, lastName, email, passwordHash, phone, Role.ORGANIZER);
    }

    /** Convenience helper for the signup controller. */
    public static Organizer fromSignup(String firstName, String lastName, String email,
                                       String passwordHash, String phone,
                                       String organizationName, String organizationType,
                                       String position, String website,
                                       String organizationDescription) {
        Organizer organizer = new Organizer(firstName, lastName, email, passwordHash, phone);
        organizer.setOrganizationName(organizationName);
        organizer.setOrganizationType(organizationType);
        organizer.setPosition(position);
        organizer.setWebsite(website);
        organizer.setOrganizationDescription(organizationDescription);
        return organizer;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getOrganizationType() {
        return organizationType;
    }

    public void setOrganizationType(String organizationType) {
        this.organizationType = organizationType;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getOrganizationDescription() {
        return organizationDescription;
    }

    public void setOrganizationDescription(String organizationDescription) {
        this.organizationDescription = organizationDescription;
    }

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }
}
