package com.puskar.skillbridge.model;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Level {
    BEGINNER("Beginner"),
    INTERMEDIATE("Intermediate"),
    ADVANCE("Advance");

    private final String displayName;

    Level(String displayName) {
        this.displayName = displayName;
    }

    @JsonValue
    public String getDisplayName(){
        return displayName;
    }
}
