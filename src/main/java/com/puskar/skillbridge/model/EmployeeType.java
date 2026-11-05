package com.puskar.skillbridge.model;


import com.fasterxml.jackson.annotation.JsonValue;

public enum EmployeeType {
    FULL_TIME("Full Time"),
    PART_TIME("Part Time"),
    CONTRACT("Contract"),
    REMOTE("Remote");

    private final String displayName;

    EmployeeType(String displayName) {
        this.displayName = displayName;
    }

    @JsonValue
    public String getDisplayName(){
        return displayName;
    }
}
