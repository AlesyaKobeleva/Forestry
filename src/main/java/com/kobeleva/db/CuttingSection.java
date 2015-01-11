package com.kobeleva.db;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "cuttingSection")
public class CuttingSection {
    private String section;

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public CuttingSection(String section) {

        this.section = section;
    }

    @Override
    public String toString() {
        return section;
    }
}
