package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PrononciationController {

    @GetMapping("/prononciation")
        public String allerSurLogin(){
        return"login";
        }
    @GetMapping("/lessons/prononciation")
    public String allerSurPrononciation(){
        return"prononciation";
    }
    }


