package com.sasd13.shopy.bean.resource;

import com.sasd13.shopy.bean.member.Seller;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SalesLot {

    private long id;
    private Timestamp saleDate;
    private float refund;
    private boolean closed;
    private List<Sale> sales;
    private Seller seller;
	
    public SalesLot() {
        this.sales = new ArrayList<>();
    }
	
    public long getId() {
        return id;
    }
	
    public void setId(long id) {
        this.id = id;
    }
	
    public Timestamp getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Timestamp saleDate) {
        this.saleDate = saleDate;
    }

    public float getRefund() {
        return refund;
    }

    public void setRefund(float refund) {
        this.refund = refund;
    }

    public boolean isClosed() {
        return closed;
    }

    public void setClosed(boolean closed) {
        this.closed = closed;
    }

    public List<Sale> getSales() {
        return sales;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }
    
    public float getTotalSalesWithoutRefund() {
        float total = 0;
        
        for (Sale sale : sales) {
            total += sale.getQuantity()*sale.getUnitPrice()*(1 - sale.getRefund());
        }
        
        return total;
    }
    
    public float getTotalSales() {
        return getTotalSalesWithoutRefund()*(1 - refund);
    }
}
