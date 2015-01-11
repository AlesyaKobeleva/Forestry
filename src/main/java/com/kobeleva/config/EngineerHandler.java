package com.kobeleva.config;


public class EngineerHandler {
    private String woodType;
    private Integer woodLength;
    private Integer woodCount;
    private String species;

    @Override
    public String toString() {
        return "Engineer = " + species + " / " + woodType + " / " + woodCount;
    }

    public String getWoodType() {
        return woodType;
    }

    public void setWoodType(String woodType) {
        this.woodType = woodType;
    }

    public Integer getWoodLength() {
        return woodLength;
    }

    public void setWoodLength(Integer woodLength) {
        this.woodLength = woodLength;
    }

    public Integer getWoodCount() {
        return woodCount;
    }

    public void setWoodCount(Integer woodCount) {
        this.woodCount = woodCount;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }
}
