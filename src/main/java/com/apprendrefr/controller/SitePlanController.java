package com.apprendrefr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/** Page « Plan du site » : les rubriques du site (la liste des leçons est sur « Toutes les leçons »). */
@Controller
public class SitePlanController {

    @GetMapping("/plan-du-site")
    public String plan() {
        return "plan-du-site";
    }
}
