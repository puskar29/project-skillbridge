package com.puskar.skillbridge.service;

import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Workshop;

import java.util.List;

public interface WorkshopService {
    public void addWorkshop(Workshop workshop);

    public List<Workshop> getAllWorkshop();

    public Workshop getWorkshopById(Long id);

    public void updateWorkshop(Workshop workshop);

    public void deleteWorkshop(Workshop workshop);

    public void toggleActive(Long id);

    List<Workshop> getWorkshopByOrganizer(Organizer organizer);

    List<Workshop> getActiveWorkshops();

    List<Workshop> searchActive(String keyword);
}
