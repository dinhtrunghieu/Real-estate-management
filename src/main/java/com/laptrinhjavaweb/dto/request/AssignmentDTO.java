package com.laptrinhjavaweb.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AssignmentDTO {
    private Long id;
    private Long[] staffIds = new Long[] {};

}
