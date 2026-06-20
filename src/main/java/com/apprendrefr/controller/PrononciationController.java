package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PrononciationController {


    @GetMapping("/prononciation")
    public String allerSurPrononciation(){
        return"prononciation";
    }


@GetMapping("/lessons/prononciation")
public String allerSurPrononciationDeLessonsPrononciation(){
    return"prononciation";
}

}

