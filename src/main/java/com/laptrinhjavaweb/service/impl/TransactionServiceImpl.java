package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.Enum.TransactionEnum;
import com.laptrinhjavaweb.converter.TransactionConverter;
import com.laptrinhjavaweb.dto.request.CreatTransactionRequest;
import com.laptrinhjavaweb.dto.request.LoadTransactionRequest;
import com.laptrinhjavaweb.dto.request.TransactionDTO;
import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.TransactionReposirory;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TransactionServiceImpl implements ITransactionService {
    @Autowired
    TransactionReposirory transactionReposirory;

    @Autowired
    TransactionConverter transactionConverter;

    @Autowired
    ICustomerService customerService;

    @Autowired
    CustomerRepository customerRepository;


    @Override
    public List<TransactionDTO> findBytransaction(LoadTransactionRequest value) {
        String code = value.getTransactionCode();
        CustomerEnitity customerEnitity = customerRepository.findById(value.getCustomerId()).get();
        List<TransactionEntity> transactionEntity = transactionReposirory.findByCustomerAndCode(customerEnitity, code);
        List <TransactionDTO> results =  new ArrayList<>();
        for (TransactionEntity item: transactionEntity){
            TransactionDTO param = transactionConverter.convertToTransactionDTO(item);
            results.add(param);
        }
        return results;
    }

    @Override
    public Map<String,String>  getCode() {
        Map<String,String> result = new HashMap<>();
        for (TransactionEnum value: TransactionEnum.values()) {
            result.put(value.toString(), value.getValue());
        }
        return result;
    }

    @Override
    public Map<String, Object> getData(Map<String, String> code, Long customerId) {
        Map<String, Object> result = new HashMap<>();
        for (Map.Entry<String, String> entry :
                code.entrySet()) {
            String codeT =  entry.getKey();
            CustomerEnitity customerEnitity = customerRepository.findById(customerId).get();
            List<TransactionEntity> transactionEntity = customerEnitity.getTransaction();
            List<TransactionEntity> transactionCode = new ArrayList<>();
            for (TransactionEntity item : transactionEntity){
                if (item.getCode().equals(codeT)){
                    transactionCode.add(item);
                }
            }
            List<TransactionDTO> dataResponses = new ArrayList<>();
            for (TransactionEntity item : transactionCode){
                TransactionDTO transactionDTO = new TransactionDTO();
                transactionDTO = transactionConverter.convertToTransactionDTO(item);
                dataResponses.add(transactionDTO);
            }
            result.put(entry.getKey(), dataResponses);
        }
        return result;
    }

    @Override
    public void creatTransaction(CreatTransactionRequest value, Long staffId) {
        TransactionEntity transactionEntity = new TransactionEntity();
        transactionEntity.setCode(value.getTransactionCode());
        transactionEntity.setNote(value.getNote());
        transactionEntity.setStaffId(staffId);
        List<CustomerEnitity> customerEnitities = customerService.findById(value.getIdCustomer(),transactionEntity);
        transactionEntity.setCustomer(customerEnitities);
        long millis = System.currentTimeMillis();
        java.util.Date now = new Date(millis);
        transactionEntity.setCreatedDate(now);
        transactionReposirory.save(transactionEntity);
    }
}
