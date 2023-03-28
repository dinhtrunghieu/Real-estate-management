package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.Response.CustomerResponse;
import com.laptrinhjavaweb.dto.Response.ResponseDTO;
import com.laptrinhjavaweb.dto.request.*;
import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import org.springframework.data.domain.PageRequest;

import java.util.List;


public interface ICustomerService {
    List<CustomerResponse> findCustomer(List<String> role, Long staffId, CustomerSearchRequest model, PageRequest pageRequest);

    int findSearchTotalItems(CustomerSearchRequest model);

    ResponseDTO assignmentBuilding(AssignmentDTO value, List<String> role );

    CustomerDTO getCustomerById(Long customerId);

    ResponseDTO updateAndSaveBuilding(CustomerDTO value, List<String> role );

    ResponseDTO deleteCustomer(DeleteDTO value, List<String> role );


    List<CustomerEnitity> findById(Long idCustomer,  TransactionEntity transactionEntity);
}
