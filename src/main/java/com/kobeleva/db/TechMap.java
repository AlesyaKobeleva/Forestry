package com.kobeleva.db;

import org.springframework.data.mongodb.core.mapping.Document;


@Document(collection = "techMap")
public class TechMap {
    private String mapType;

    public String getMapType() {
        return mapType;
    }

    public void setMapType(String mapType) {
        this.mapType = mapType;
    }

    public TechMap(String mapType) {

        this.mapType = mapType;
    }
}
