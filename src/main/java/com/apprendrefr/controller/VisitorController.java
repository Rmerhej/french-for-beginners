package com.apprendrefr.controller;

import com.apprendrefr.service.VisitorTrackerService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VisitorController {

    private final VisitorTrackerService tracker;

    public VisitorController(VisitorTrackerService tracker) {
        this.tracker = tracker;
    }

    @GetMapping("/visitor/heartbeat")
    public void heartbeat(HttpServletRequest request,
                          HttpServletResponse response) {
       // System.out.println("HEARTBEAT reçu");

        String visitorId = null;

        if (request.getCookies() != null) {

            for (Cookie cookie : request.getCookies()) {

                if ("VISITOR_ID".equals(cookie.getName())) {
                    visitorId = cookie.getValue();
                    break;
                }
            }
        }

        visitorId = tracker.registerVisitor(visitorId);

        Cookie cookie = new Cookie("VISITOR_ID", visitorId);

        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24 * 365);

        response.addCookie(cookie);

        tracker.heartbeat(visitorId);
    }

}