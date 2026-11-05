package com.puskar.skillbridge.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
    String uploadProfileImg(MultipartFile imageFile);
}
