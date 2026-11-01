package com.apprendrefr.controller;

import com.apprendrefr.entity.Lesson;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SitePlanControllerTest {

    private static Lesson lesson(String title, String level) {
        Lesson l = new Lesson();
        l.setTitle(title);
        l.setLevel(level);
        return l;
    }

    @Test
    void groupsByLevelSortedWithUnlevelledLast() {
        Map<String, List<Lesson>> result = SitePlanController.groupByLevel(List.of(
                lesson("Zèbre", "B1"), lesson("Alpha", "A1"), lesson("Beta", "A1"),
                lesson("Sans niveau", null), lesson("Vide", " ")));

        assertEquals(List.of("A1", "B1", SitePlanController.NO_LEVEL), new ArrayList<>(result.keySet()));
        assertEquals("Alpha", result.get("A1").get(0).getTitle());
        assertEquals("Beta", result.get("A1").get(1).getTitle());
        assertEquals(2, result.get(SitePlanController.NO_LEVEL).size());
    }

    @Test
    void ignoresLessonsWithoutTitleAndNullList() {
        assertTrue(SitePlanController.groupByLevel(null).isEmpty());
        assertTrue(SitePlanController.groupByLevel(List.of(lesson(null, "A1"), lesson(" ", "A1"))).isEmpty());
    }
}
