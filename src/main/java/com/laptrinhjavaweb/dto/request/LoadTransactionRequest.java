package com.laptrinhjavaweb.dto.request;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoadTransactionRequest {
    private Long customerId;
    private String transactionCode;

}
