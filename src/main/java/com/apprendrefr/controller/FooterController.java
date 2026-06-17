package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FooterController {

    @GetMapping("/about")
    public String allerSurAbout(){
        return "about";

    }
    @GetMapping("/contact")
    public String allerSurContact(){
        return "contact";

    }
    @GetMapping("/rgpd")
    public String allerSurRgpd(){
        return "rgpd";

    }
    @GetMapping("/secourscatholique")
    public String allerSurSecourscatholique(){
        return "redirect:https://www.secours-catholique.org/";

    }
}
