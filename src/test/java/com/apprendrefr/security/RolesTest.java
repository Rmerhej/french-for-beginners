package com.apprendrefr.security;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class RolesTest {
    @Test
    void normalize_acceptsAllHistoricalForms() {
        assertEquals("ROLE_ADMIN", Roles.normalize("ADMIN"));
        assertEquals("ROLE_ADMIN", Roles.normalize("ROLE_ADMIN"));
        assertEquals("ROLE_ADMIN", Roles.normalize("role_admin"));
        assertEquals("ROLE_USER", Roles.normalize("USER"));
        assertEquals("ROLE_USER", Roles.normalize("ROLE_USER"));
    }
    @Test
    void normalize_blankFallsBackToLeastPrivilegedRole() {
        assertEquals("ROLE_USER", Roles.normalize(null));
        assertEquals("ROLE_USER", Roles.normalize(" "));
    }
    @Test
    void isAllowed_onlyKnownRoles() {
        assertTrue(Roles.isAllowed("admin"));
        assertTrue(Roles.isAllowed("ROLE_USER"));
        assertFalse(Roles.isAllowed("SUPERADMIN"));
        assertFalse(Roles.isAllowed(""));
        assertFalse(Roles.isAllowed(null));
    }
}