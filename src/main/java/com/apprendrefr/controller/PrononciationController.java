package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;

@Controller
public class PrononciationController {

    @GetMapping("/prononciation")
        public String allerSurPrononciation(){
            return"prononciation";
        }
    }


