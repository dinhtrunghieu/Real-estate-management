package com.laptrinhjavaweb.dto.Response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseDTO {
    private Object Data;
    private String message;
    private String detail;
}
