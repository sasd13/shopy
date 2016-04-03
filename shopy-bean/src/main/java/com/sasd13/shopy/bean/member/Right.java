package com.sasd13.shopy.bean.member;

public enum Right {
	
    UNKNOWN("UNKNOWN", 0),
    SELLER("SELLER", 1),
    MANAGER("MANAGER", 2),
    ADMINISTRATOR("ADMINISTRATOR", 3);

    private String name;
    private long level;

    private Right(String name, int level) {
        this.name = name;
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public long getLevel() {
        return level;
    }

    public Right find(String name) {
        Right right = UNKNOWN;

        for (Right bufferedRight : values()) {
            if (bufferedRight.getName().equalsIgnoreCase(name)) {
                right = bufferedRight;
            }
        }

        return right;
    }

    public Right find(int level) {
        Right right = UNKNOWN;

        for (Right bufferedRight : values()) {
            if (bufferedRight.getLevel() == level) {
                right = bufferedRight;
            }
        }

        return right;
    }
}
