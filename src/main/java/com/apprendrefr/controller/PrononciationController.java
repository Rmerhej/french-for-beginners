package com.apprendrefr.controller;


import com.apprendrefr.service.PrononciationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PrononciationController {


    private final PrononciationService service;



    public PrononciationController(PrononciationService service){
        this.service=service;
    }



    @GetMapping("/prononciation")
    public String afficher(Model model){


        model.addAttribute(
                "prononciations",
                service.findAll()
        );


        return "prononciation";

    }

}