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
    @GetMapping("/imperatif")
    public String allerSurImperatif(){
        return "impératif";

    }
    @GetMapping("/passecompse")
    public String allerSurPassecompse(){
        return "le_passé_composé";

    }
    @GetMapping("/adjectifsdemonstratifs")
    public String allerSurAdjectifsDemonstratifs(){
        return "adjectifs-demonstratifs";

    }
    @GetMapping("/expressionstemps")
    public String allerSurExpressionsTemps(){
        return "expressions-temps";

    }
    @GetMapping("/futursimple")
    public String allerSurFutureSimple(){
        return "future-simple";

    }
    @GetMapping("/verbesreguliers")
    public String allerSurVerbesReguliers(){
        return "verbes-reguliers";

    }
    @GetMapping("/auxiliaires")
    public String allerSurAuxiliaires(){
        return "auxiliaires";

    }

}
