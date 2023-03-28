package com.laptrinhjavaweb.repository.Custom;

import com.laptrinhjavaweb.Builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.dto.request.CustomerSearchRequest;
import com.laptrinhjavaweb.entity.CustomerEnitity;
import org.springframework.data.domain.PageRequest;

import java.util.List;

public interface CustomerRepositoryCustom  {
    List<CustomerEnitity> findCustomer(CustomerSearchRequest value, PageRequest pageable);
    int findTotalItemsBuilding(CustomerSearchRequest value);
}
