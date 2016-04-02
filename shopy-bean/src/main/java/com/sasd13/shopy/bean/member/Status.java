package com.sasd13.shopy.bean.member;

public enum Status {
	
    UNKNOWN("UNKNOWN"),
    DISABLED("DISABLED"),
    ENABLED("ENABLED"),
    PENDING("PENDING");

    private String name;

    private Status(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public Status find(String name) {
        Status status = UNKNOWN;

        for (Status bufferedStatus : values()) {
            if (bufferedStatus.getName().equalsIgnoreCase(name)) {
                return bufferedStatus;
            }
        }

        return status;
    }
}
