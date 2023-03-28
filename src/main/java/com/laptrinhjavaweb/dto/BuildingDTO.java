package com.laptrinhjavaweb.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BuildingDTO {
    private Long id;
    private String name;
    private Integer numberOfBasement;
    private String buildingArea;
    private String describeArea;
    private Integer floorArea;
    private String street;
    private String ward;
    private String district;
    private String structure;
    private Integer rentPrice;
    private String direction;
    private String rentPriceDescription;
    private String serviceFee;
    private String carFee;
    private String motorBikeFee;
    private String overTimeFee;
    private String staffId;
    private String electriCityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decoraTionTime;
    private String managerName;
    private Integer managerPhone;
    private String areaRent;
    private String brokerageFee;
    private String linkOfBuilding;
    private String map;
    private String image;
    private String addRess;
    private String level;
    private String[] type;

    private String imageBase64;

    private String imageName;

    public String[] getType() {
        return type;
    }

    public void setType(String[] type) {
        this.type = type;
    }

    public String getImageBase64() {
        if (imageBase64 != null) {
            return imageBase64.split(",")[1];
        }
        return null;
    }
}