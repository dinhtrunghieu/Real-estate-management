package com.laptrinhjavaweb.Builder;

import java.util.List;

public class BuildingSearchBuilder {

    private String name;
    private String district;
    private String street;
    private String ward;
    Integer floorArea;
    private Integer numberOfBasement;
    private String type[];
    private Integer costRentFrom;
    private Integer costRentTo;
    private Integer areaRentFrom;
    private Integer areaRentTo;
    private Long staffId;
    private String direction;
    private String level;
    private String managerName;
    private Integer managerPhone;

    public String getManagerName() {
        return managerName;
    }

    public Integer getManagerPhone() {
        return managerPhone;
    }

    public String getName() {
        return name;
    }

    public String getDistrict() {
        return district;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public String[] getType() {
        return type;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public String getStreet() {
        return street;
    }

    public String getWard() {
        return ward;
    }


    public Integer getCostRentFrom() {
        return costRentFrom;
    }

    public Integer getCostRentTo() {
        return costRentTo;
    }

    public Integer getAreaRentFrom() {
        return areaRentFrom;
    }

    public Integer getAreaRentTo() {
        return areaRentTo;
    }

    public Long getStaffId() {
        return staffId;
    }

    public String getDirection() {
        return direction;
    }

    public String getLevel() {
        return level;
    }

    private BuildingSearchBuilder(Builder builder) {
        this.name = builder.name;
        this.district = builder.district;
        this.numberOfBasement = builder.numberOfBasement;
        this.street = builder.street;
        this.ward = builder.ward;
        this.type = builder.type;
        this.costRentFrom = builder.costRentFrom;
        this.costRentTo = builder.costRentTo;
        this.areaRentFrom = builder.areaRentFrom;
        this.areaRentTo = builder.areaRentTo;
        this.staffId = builder.staffId;
        this.floorArea = builder.floorArea;
        this.managerName = builder.managerName;
        this.managerPhone = builder.managerPhone;
        this.direction = builder.direction;
        this.level = builder.level;

    }

    public static class Builder {


        private String name;
        private String district;
        private String street;
        private String ward;
        private Integer numberOfBasement;
        private String[] type;
        private Integer costRentFrom;
        private Integer costRentTo;
        private Integer areaRentFrom;
        private Integer areaRentTo;
        private Long staffId;
        private Integer floorArea;
        private String direction;
        private String level;
        private String managerName;
        private Integer managerPhone;

        public Builder setManagerName(String managerName) {
            this.managerName = managerName;
            return this;
        }
        public Builder setManagerPhone(Integer managerPhone) {
            this.managerPhone = managerPhone;
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setDistrict(String district) {
            this.district = district;
            return this;
        }

        public Builder setNumberOfBasement(Integer numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public Builder setStreet(String street) {
            this.street = street;
            return this;
        }

        public Builder setWard(String ward) {
            this.ward = ward;
            return this;
        }

        public Builder setType(String type[]) {
            this.type = type;
            return this;
        }

        public Builder setCostRentFrom(Integer costRentFrom) {
            this.costRentFrom = costRentFrom;
            return this;
        }

        public Builder setCostRentTo(Integer costRentTo) {
            this.costRentTo = costRentTo;
            return this;
        }

        public Builder setAreaRentFrom(Integer areaRentFrom) {
            this.areaRentFrom = areaRentFrom;
            return this;
        }

        public Builder setAreaRentTo(Integer areaRentTo) {
            this.areaRentTo = areaRentTo;
            return this;
        }

        public Builder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder setLevel(String level) {
            this.level = level;
            return this;
        }

        public Builder setFloorArea(Integer floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public Builder setDirection(String direction) {
            this.direction = direction;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }
}