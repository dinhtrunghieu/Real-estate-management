package com.laptrinhjavaweb.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreatTransactionRequest {
    private Long idCustomer;
    private String transactionCode;
    private String note;

}
