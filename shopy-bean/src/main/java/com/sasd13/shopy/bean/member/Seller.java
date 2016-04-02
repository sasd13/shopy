package com.sasd13.shopy.bean.member;

public class Seller extends User {

    @Override
    public Right getRight() {
        return Right.SELLER;
    }
}
