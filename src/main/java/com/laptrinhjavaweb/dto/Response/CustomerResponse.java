package com.laptrinhjavaweb.dto.Response;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CustomerResponse {
    private Long id;
    private String fullName;
    private String staffName;
    private Integer phone;
    private String email;
    private String demand;
    private String createdBy;
    private String createdDate;
    private String status;
}
