package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PreparationController {

    @GetMapping("/preparation")
    public String preparation()
    {
        return "preparation";
    }
    //
    @GetMapping("/aubureau")
    public String allerAuBureau()
    {
        return "au-bureau";
    }

    @GetMapping("/lesgens")
    public String allerLesGens()
    {
        return "les-gens";
    }
    @GetMapping("/lesport")
    public String allerLeSport()
    {
        return "le-sport";
    }

}
