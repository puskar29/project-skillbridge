package com.puskar.skillbridge.service;

import com.puskar.skillbridge.dao.InternshipDao;
import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Organizer;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class InternshipServiceImp implements InternshipService{

    @Autowired
    private InternshipDao internshipDao;

    @Override
    public void addInternship(Internship internship) {
        internshipDao.save(internship);
    }

    @Override
    public List<Internship> getInternships() {
        return internshipDao.findAll();
    }

    @Override
    public Internship getInternshipById(Long id) {
        return internshipDao.findById(id).get();
    }

    @Override
    public void updateInternship(Internship internship) {
        internshipDao.save(internship);
    }

    @Override
    public void deleteInternship(Internship internship) {
        internshipDao.delete(internship);
    }

    @Override
    public void toggleActive(Long id) {
        Internship internship = internshipDao.findById(id).orElseThrow(
                () -> new RuntimeException("Internship not found with id: " + id)
        );

        internship.setActive(!internship.isActive());
        internshipDao.save(internship);
    }

    @Override
    public List<Internship> getInternshipsByOrganizer(Organizer organizer) {
        return internshipDao.findByOrganizer(organizer);
    }

    @Override
    public List<Internship> getActiveInternships() {
        return internshipDao.findByActiveTrueOrderByCreatedAtDesc();
    }
}
