package com.apprendrefr.service;

import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class ImageService {


    public void processAndSaveImage(MultipartFile file, String destinationPath) throws IOException {
        Thumbnails.of(file.getInputStream())
                .width(800)
                .outputQuality(0.8)
                .toFile(new File(destinationPath));
    }


    public void batchProcessImages(String folderPath) {
        File dir = new File(folderPath);
        if (!dir.exists()) {
            System.err.println("ERREUR : Le dossier n'existe pas à cet emplacement : " + dir.getAbsolutePath());
            return;
        }
        File[] files = dir.listFiles((d, name) -> {
            String n = name.toLowerCase();
            return n.endsWith(".png") || n.endsWith(".jpg") || n.endsWith(".jpeg");
        });


        if (files != null) {
            for (File file : files) {
                try {

                    if (file.length() > 500000) {
                        Thumbnails.of(file)
                                .width(800)
                                .outputQuality(0.75)
                                .toFile(file);
                        System.out.println("Optimisé : " + file.getName());
                    } else {
                        System.out.println("Déjà léger : " + file.getName());
                    }
                } catch (IOException e) {
                    System.err.println("Erreur sur le fichier " + file.getName() + " : " + e.getMessage());
                }
            }
        }
    }
}