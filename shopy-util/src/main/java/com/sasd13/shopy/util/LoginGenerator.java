package com.sasd13.shopy.util;

public class LoginGenerator {
	
    private static final int MAX_ARG_LENGTH = 3;

    public static String generate(String arg, long id) {
        String login = null;

        if (arg.length() >= MAX_ARG_LENGTH) {
            login = arg.substring(0, MAX_ARG_LENGTH).toLowerCase() + String.valueOf(id);
        } else {
            login = arg.substring(0, arg.length()).toLowerCase() + String.valueOf(id);
        }

        return login;
    }
}
