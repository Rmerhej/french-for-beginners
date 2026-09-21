package com.apprendrefr.controller;

import com.apprendrefr.entity.Exercise;
import com.apprendrefr.service.ExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
@Controller
public class EvaluationController {

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping("/testEval")
    public String aller(Model model) {
        List<Exercise> exercises = exerciseService.findByLessonTitleContaining("Test");
        model.addAttribute("exercises", exercises != null ? exercises : new ArrayList<>());
        return "evaluation";
    }
}
