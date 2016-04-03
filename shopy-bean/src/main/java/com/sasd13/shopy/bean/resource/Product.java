package com.sasd13.shopy.bean.resource;

import com.sasd13.shopy.bean.Category;

public class Product {

    private long id;
    private String code, name, description, unitMeasure;
    private float quantity, currentUnitPrice;
    private Category category;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUnitMeasure() {
        return unitMeasure;
    }

    public void setUnitMeasure(String unitMeasure) {
        this.unitMeasure = unitMeasure;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

    public float getCurrentUnitPrice() {
        return currentUnitPrice;
    }

    public void setCurrentUnitPrice(float currentUnitPrice) {
        this.currentUnitPrice = currentUnitPrice;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
