package com.laptrinhjavaweb.Enum;

public enum TransactionEnum {
    CSKH("CHĂM SÓC KHÁCH HÀNG"),
    DDX("DẪN KHÁCH HÀNG ĐI XEM");

    private final String transactionValue;

    TransactionEnum(String transactionValue) {
        this.transactionValue = transactionValue;
    }


    public String getValue() {
        return transactionValue;
    }
}
