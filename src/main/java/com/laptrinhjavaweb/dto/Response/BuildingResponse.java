package com.laptrinhjavaweb.dto.Response;

import com.laptrinhjavaweb.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class BuildingResponse extends AbstractDTO {
    private Long id;
    private String name;
    private String addRess;
    private String managerName;
    private Integer managerPhone;
    private Integer floorArea;
    private String describeArea;
    private Integer rentPrice;
    private String serviceFee;
    private String brokerageFee;
    private String rentType;
    private String direction;

}
