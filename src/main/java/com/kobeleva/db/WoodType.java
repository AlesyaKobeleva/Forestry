package com.kobeleva.db;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "woodTypes")
public class WoodType {

    private String species;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    private String area;

    public WoodType(String species, String area) {
        super();
        this.species = species;
        this.area = area;
    }

    @Override
    public String toString() {
        return "WoodType [species=" + species + ", area=" + area + "]";
    }

}