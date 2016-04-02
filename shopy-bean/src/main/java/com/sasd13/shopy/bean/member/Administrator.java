package com.sasd13.shopy.bean.member;

public class Administrator extends User {

    @Override
    public Right getRight() {
        return Right.ADMINISTRATOR;
    }
}
