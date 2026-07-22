package com.apprendrefr.service;

import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class VisitorTrackerService {

    private final Map<String, Instant> visitors = new ConcurrentHashMap<>();

    private static final long TIMEOUT_SECONDS = 300;

    public String registerVisitor(String visitorId) {

        if (visitorId == null || visitorId.isBlank()) {
            visitorId = UUID.randomUUID().toString();
        }

        visitors.put(visitorId, Instant.now());

        cleanup();

        return visitorId;
    }

    public void heartbeat(String visitorId) {

       // System.out.println("Visitor : " + visitorId);
        if (visitorId != null) {
            visitors.put(visitorId, Instant.now());
        }

        cleanup();
    }

    public int getOnlineVisitors() {

        cleanup();

        return visitors.size();
    }

    private void cleanup() {

        Instant limit = Instant.now().minusSeconds(TIMEOUT_SECONDS);

        visitors.entrySet().removeIf(
                e -> e.getValue().isBefore(limit)
        );
    }

}