package com.puskar.skillbridge.service;

import com.puskar.skillbridge.dao.WorkshopDao;
import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Workshop;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class WorkshopServiceImp implements WorkshopService {

    @Autowired
    private WorkshopDao workshopDao;

    @Override
    public void addWorkshop(Workshop workshop) {
        workshopDao.save(workshop);
    }

    @Override
    public List<Workshop> getAllWorkshop() {
        return workshopDao.findAll();
    }

    @Override
    public Workshop getWorkshopById(Long id) {
        return workshopDao.findById(id).get();
    }

    @Override
    public void updateWorkshop(Workshop workshop) {
        workshopDao.save(workshop);
    }

    @Override
    public void deleteWorkshop(Workshop workshop) {
        workshopDao.delete(workshop);
    }

    @Override
    public void toggleActive(Long id) {
        Workshop workshop = workshopDao.findById(id).orElseThrow(
                () -> new RuntimeException("Workshop not found with id: " + id)
        );
     workshop.setActive(!workshop.isActive());
     workshopDao.save(workshop);
    }

    @Override
    public List<Workshop> getWorkshopByOrganizer(Organizer organizer) {
        return workshopDao.findByOrganizerAccount(organizer);
    }

    @Override
    public List<Workshop> getActiveWorkshops() {
        return workshopDao.findByActiveTrueOrderByCreatedAtDesc();
    }
}
