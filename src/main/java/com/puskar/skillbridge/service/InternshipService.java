package com.puskar.skillbridge.service;

import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Organizer;

import java.util.List;

public interface InternshipService {

    public void addInternship(Internship internship);

    public List<Internship> getInternships();

    public Internship getInternshipById(Long id);

    public void updateInternship(Internship internship);

    public void deleteInternship(Internship internship);

    public void toggleActive(Long id);

    List<Internship> getInternshipsByOrganizer(Organizer organizer);

    List<Internship> getActiveInternships();

    List<Internship> searchActive(String keyword);

}
