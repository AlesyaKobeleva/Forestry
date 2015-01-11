package com.kobeleva.config;


public class MasterHandler {
    private String cuttingSection;
    private String species;

    @Override
    public String toString() {
        return "Master = " + cuttingSection + " / " + species;
    }

    public String getCuttingSection() {
        return cuttingSection;
    }

    public void setCuttingSection(String cuttingSection) {
        this.cuttingSection = cuttingSection;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }
}
