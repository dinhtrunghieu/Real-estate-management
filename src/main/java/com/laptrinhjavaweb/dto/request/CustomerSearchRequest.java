package com.laptrinhjavaweb.dto.request;

import com.laptrinhjavaweb.dto.AbstractDTO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CustomerSearchRequest extends AbstractDTO {
    private String fullName;
    private Integer phone;
    private String email;
    private Long staffId;
}
