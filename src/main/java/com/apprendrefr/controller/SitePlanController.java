package com.apprendrefr.controller;

import com.apprendrefr.entity.Lesson;
import com.apprendrefr.service.LessonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/** Page « Plan du site » : toutes les rubriques et les leçons, rangées par niveau. */
@Controller
public class SitePlanController {

    static final String NO_LEVEL = "Autres leçons";

    private final LessonService lessonService;

    public SitePlanController(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @GetMapping("/plan-du-site")
    public String plan(Model model) {
        model.addAttribute("lessonsByLevel", groupByLevel(lessonService.findAll()));
        return "plan-du-site";
    }

    /** Regroupe par niveau (ordre alphabétique : A1, A2, B1…), leçons triées par titre, sans niveau à la fin. */
    static Map<String, List<Lesson>> groupByLevel(List<Lesson> lessons) {
        Map<String, List<Lesson>> byLevel = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        List<Lesson> withoutLevel = new ArrayList<>();
        if (lessons != null) {
            for (Lesson lesson : lessons) {
                if (lesson == null || lesson.getTitle() == null || lesson.getTitle().isBlank()) {
                    continue;
                }
                String level = lesson.getLevel();
                if (level == null || level.isBlank()) {
                    withoutLevel.add(lesson);
                } else {
                    byLevel.computeIfAbsent(level.trim(), k -> new ArrayList<>()).add(lesson);
                }
            }
        }
        Comparator<Lesson> byTitle = Comparator.comparing(Lesson::getTitle, String.CASE_INSENSITIVE_ORDER);
        Map<String, List<Lesson>> result = new LinkedHashMap<>();
        byLevel.forEach((level, list) -> {
            list.sort(byTitle);
            result.put(level, list);
        });
        if (!withoutLevel.isEmpty()) {
            withoutLevel.sort(byTitle);
            result.put(NO_LEVEL, withoutLevel);
        }
        return result;
    }
}
