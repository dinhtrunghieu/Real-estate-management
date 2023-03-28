package com.laptrinhjavaweb.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SaveBuildingRequest {
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
    private String costDescription;
    private String serviceFee;
    private String carFree;
    private String motorBikeFee;
    private String overTimeFee;
    private String [] Type ;
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
}
