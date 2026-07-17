package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CultureController {
    @GetMapping("/cultureFrancaise")
    public String culture() {
        return "cultureFrancaise";
    }

    @GetMapping("/fetesFrancaise")
    public String goToFetesFrancaise() {
        return "fetesfrancise";
    }
    @GetMapping("/politesse")
    public String goToPolitesse() {
        return "politesse";
    }
    @GetMapping("/lesRegions")
    public String goToLesRegions() {
        return "lesregions";
    }
    @GetMapping("/lesTransports")
    public String goToLesTransports() {
        return "lestransports";
    }
    @GetMapping("/lesRepas")
    public String goToLesRepas() {
        return "lesrepas";
    }
}
