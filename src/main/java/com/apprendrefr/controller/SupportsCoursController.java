package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class SupportsCoursController {

    @GetMapping("/supports-de-cours")
    public String allerSupportCours(){
        return "supports-de-cours";

    }

    @GetMapping("/adjectif")
    public String allerSurAdjectif(){
        return "adjectif";

    }
    @GetMapping("/pronoms")
    public String allerSurPronoms(){
        return "pronoms";

    }

}
