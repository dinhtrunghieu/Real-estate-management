package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.MyUserDetail;
import com.laptrinhjavaweb.dto.Response.CustomerResponse;
import com.laptrinhjavaweb.dto.Response.ResponseDTO;
import com.laptrinhjavaweb.dto.request.*;
import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerServiceImpl implements ICustomerService {

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CustomerConverter customerConverter;

    @Autowired
    UserRepository userRepository;

    @Override
    public List<CustomerResponse> findCustomer(List<String> role, Long staffId, CustomerSearchRequest value, PageRequest pageable) {
        if (!role.contains("ROLE_MANAGER")) {
            value.setStaffId(staffId);
        }
        List<CustomerEnitity> customerEnitity = customerRepository.findCustomer(value, pageable);
        List<CustomerResponse> customerResponse = customerConverter.convertFromEntitytoCustomerEditDTO(customerEnitity);
        return customerResponse;
    }

    @Override
    public int findSearchTotalItems(CustomerSearchRequest model) {
        int size = customerRepository.findTotalItemsBuilding(model);
        return size;
    }

    @Override
    public ResponseDTO assignmentBuilding(AssignmentDTO value, List<String> role) {
        ResponseDTO responseDTO = new ResponseDTO();
        if (role.contains("ROLE_MANAGER")) {
            List<UserEntity> staffToAdd = userRepository.findByIdIn(value.getStaffIds());
            Long customerId = value.getId();
            CustomerEnitity customerEntity = customerRepository.findById(customerId).get();
            customerEntity.setUsers(staffToAdd);
            customerRepository.save(customerEntity);
            responseDTO.setMessage("Giao khách hàng thành công");
        } else {
            responseDTO.setMessage("Giao khách hàng thất bại vì bạn không phải là Quản lý");
        }
        return responseDTO;

    }

    @Override
    public CustomerDTO getCustomerById(Long customerId) {
        CustomerEnitity entity = customerRepository.findById(customerId).get();
        CustomerDTO customerDTO = customerConverter.convertToCustomerEditDTO(entity);
        return customerDTO;
    }

    @Transactional
    @Override
    public ResponseDTO updateAndSaveBuilding(CustomerDTO value, List<String> role) {
        ResponseDTO responseDTO = new ResponseDTO();
        MyUserDetail user = SecurityUtils.getPrincipal();
        LocalDate today = LocalDate.now();
        if (value.getId() != null) {
            CustomerEnitity customerEnitity = customerConverter.convertToCustomerEntity(value);
            CustomerEnitity customerCurrent = customerRepository.findById(customerEnitity.getId()).get();
            List<UserEntity> userEntities = customerCurrent.getUsers();
            List<TransactionEntity> transactionEntities = customerCurrent.getTransaction();
            customerEnitity.setTransaction(transactionEntities);
            customerEnitity.setUsers(userEntities);
            customerRepository.save(customerEnitity);
            responseDTO.setMessage("Update thông tin khách hàng thành công !");
        } else {
            CustomerEnitity customerEnitity = customerConverter.convertToCustomerEntity(value);
            Date date = java.sql.Date.valueOf(today);
            customerEnitity.setCreatedDate(date);
            customerEnitity.setCreatedBy(user.getFullName());
            long millis = System.currentTimeMillis();
            customerRepository.save(customerEnitity);
            responseDTO.setMessage("Tạo thông tin khách hàng thành công !");
        }
        return responseDTO;
}

    @Transactional
    @Override
    public ResponseDTO deleteCustomer(DeleteDTO value, List<String> role) {
        ResponseDTO responseDTO = new ResponseDTO();
        if (role.contains("ROLE_MANAGER")) {
            customerRepository.deleteByIdIn(value.getId());
            responseDTO.setMessage("Xóa thành công !");
        } else {
            responseDTO.setMessage("Không thể thao tác vì bạn không phải là quản lý .. ");
        }
        return responseDTO;
    }

    @Override
    public List<CustomerEnitity> findById(Long idCustomer, TransactionEntity value) {
        List<CustomerEnitity> result = new ArrayList<>();
        List<TransactionEntity> transactionEntity = new ArrayList<>();
        transactionEntity.add(value);
        CustomerEnitity customerEnitity = customerRepository.findById(idCustomer).get();
        customerEnitity.setTransaction(transactionEntity);
        result.add(customerEnitity);
        return result;
    }


}
