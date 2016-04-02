package com.sasd13.shopy.bean.member;

public class Manager extends User {

    @Override
    public Right getRight() {
        return Right.MANAGER;
    }
}
