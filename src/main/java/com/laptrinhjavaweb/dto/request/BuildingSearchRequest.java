package com.laptrinhjavaweb.dto.request;

import com.laptrinhjavaweb.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class BuildingSearchRequest extends AbstractDTO {
    private String name;
    private Integer floorArea;
    private String district;
    private String ward;
    private String street;
    private Integer numberOfBasement;
    private String level;
    private String direction;
    private String[] type;
    private Integer costRentFrom;
    private Integer costRentTo;
    private Integer areaRentFrom;
    private Integer areaRentTo;
    private String managerName;
    private Integer managerPhone;
    private Long staffId;

}
