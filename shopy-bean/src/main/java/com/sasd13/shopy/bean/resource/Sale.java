package com.sasd13.shopy.bean.resource;

public class Sale {

    private long id;
    private double quantity, unitPrice, refund;
    private Product product;

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getQuantity() {
        return this.quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return this.unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getRefund() {
        return this.refund;
    }

    public void setRefund(double refund) {
        this.refund = refund;
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
