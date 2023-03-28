package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.Response.CustomerResponse;
import com.laptrinhjavaweb.dto.request.CustomerDTO;
import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.service.ICustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private ICustomerService customerService;

    public List<CustomerResponse> convertFromEntitytoCustomerEditDTO(List<CustomerEnitity> enitity) {
        List<CustomerResponse> result = new ArrayList<>();
        CustomerResponse customerResponse = new CustomerResponse();
        for (CustomerEnitity value : enitity){
            customerResponse = modelMapper.map(value, CustomerResponse.class);
            List<UserEntity> userEntities = value.getUsers();
            StringJoiner staffName = new StringJoiner(",");
            for (UserEntity item : userEntities){
                staffName.add(item.getFullName());
            }
            java.util.Date now = value.getCreatedDate();
            SimpleDateFormat dinhDang = new SimpleDateFormat("dd/MM/yyyy");
            customerResponse.setStaffName(staffName.toString());
            if (now != null) {
                String date = dinhDang.format(now);
                customerResponse.setCreatedDate(date);
            }
            result.add(customerResponse);
        }
        return result;
    }

    public CustomerDTO convertToCustomerEditDTO(CustomerEnitity entity) {
        CustomerDTO results = modelMapper.map(entity, CustomerDTO.class);
        return results;
    }

    public CustomerEnitity convertToCustomerEntity(CustomerDTO entity) {
        CustomerEnitity results = modelMapper.map(entity, CustomerEnitity.class);
        return results;
    }
}
