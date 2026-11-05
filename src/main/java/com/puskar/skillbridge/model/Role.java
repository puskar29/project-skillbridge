package com.puskar.skillbridge.model;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Role {
    STUDENT("Student"),
    ORGANIZER("Organizer"),
    ADMIN("Administrator");

    private final String displayName;

    Role(String displayName) {
        this.displayName = displayName;
    }

    @JsonValue
    public String getDisplayName() {
        return displayName;
    }
}
