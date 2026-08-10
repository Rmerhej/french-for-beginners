package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LaFranceController {

    @GetMapping("/laFrance")
    public String goToLaFrance() {
        return "laFrance-index";
    }

}
