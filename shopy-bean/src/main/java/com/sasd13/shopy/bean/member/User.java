package com.sasd13.shopy.bean.member;

import java.sql.Timestamp;

public abstract class User {
	
    private long id;
    private String firstName, lastName;
    private String login;
    private Timestamp signDate;
    private Status status;

    public abstract Right getRight();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public Timestamp getSignDate() {
        return signDate;
    }

    public void setSignDate(Timestamp signDate) {
        this.signDate = signDate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
