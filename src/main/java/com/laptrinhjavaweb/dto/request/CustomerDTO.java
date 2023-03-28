package com.laptrinhjavaweb.dto.request;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerDTO {
    private Long id;
    private String fullName;
    private Integer phone;
    private String email;
    private String companyName;
    private String demand;
    private String note;
}
