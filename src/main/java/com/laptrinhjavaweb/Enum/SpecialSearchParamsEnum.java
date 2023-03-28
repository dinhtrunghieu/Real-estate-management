package com.laptrinhjavaweb.Enum;

public enum SpecialSearchParamsEnum {
    STAFF_ID("staffId"),
    RENT_PRICE_FROM("costRentFrom"),
    RENT_PRICE_TO("costRentTo"),
    RENT_AREA_FROM("areaRentFrom"),
    RENT_AREA_TO("areaRentTo");

    private final String value;

    SpecialSearchParamsEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
