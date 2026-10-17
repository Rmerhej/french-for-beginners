package com.apprendrefr.config;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SecurityConfigRememberMeKeyTest {

    @Test
    void blankKeyGeneratesRandomKey() {
        String a = SecurityConfig.resolveRememberMeKey("");
        String b = SecurityConfig.resolveRememberMeKey(null);
        assertEquals(64, a.length());
        assertNotEquals(a, b);
    }

    @Test
    void shortKeyIsRejected() {
        assertThrows(IllegalStateException.class, () -> SecurityConfig.resolveRememberMeKey("trop-court"));
    }

    @Test
    void validKeyIsKept() {
        String key = "0123456789abcdef0123456789abcdef";
        assertEquals(key, SecurityConfig.resolveRememberMeKey(key));
    }
}