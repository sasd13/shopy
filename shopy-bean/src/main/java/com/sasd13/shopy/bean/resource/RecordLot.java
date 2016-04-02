package com.sasd13.shopy.bean.resource;

import com.sasd13.shopy.bean.member.Manager;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class RecordLot {
    
    private Timestamp recordDate;
    private List<Record> records;
    private Manager manager;

    public RecordLot() {
        records = new ArrayList<>();
    }

    public Timestamp getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Timestamp recordDate) {
        this.recordDate = recordDate;
    }

    public List<Record> getRecords() {
        return records;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }
}
