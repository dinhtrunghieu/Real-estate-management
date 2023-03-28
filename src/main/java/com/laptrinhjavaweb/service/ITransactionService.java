package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.request.CreatTransactionRequest;
import com.laptrinhjavaweb.dto.request.LoadTransactionRequest;
import com.laptrinhjavaweb.dto.request.TransactionDTO;

import java.util.List;
import java.util.Map;

public interface ITransactionService {
    List<TransactionDTO> findBytransaction(LoadTransactionRequest value);
    Map<String,String> getCode();

    Map<String, Object> getData(Map<String, String> code, Long customerId);

    void creatTransaction(CreatTransactionRequest value, Long staffId);
}
