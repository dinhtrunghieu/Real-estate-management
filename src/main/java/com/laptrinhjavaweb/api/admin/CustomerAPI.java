package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.MyUserDetail;
import com.laptrinhjavaweb.dto.Response.ResponseDTO;
import com.laptrinhjavaweb.dto.request.*;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.ITransactionService;
import com.laptrinhjavaweb.service.IUserService;
import org.omg.IOP.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "CustomerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    ICustomerService customerService;

    @Autowired
    IUserService userService;

    @Autowired
    ITransactionService transactionService;



    @GetMapping("/{customerId}/staffs")
    public ResponseDTO loadStaff(@PathVariable("customerId") String id) {
        Long customerId = Long.parseLong(id);
        Integer status = 1;
        ResponseDTO result = userService.findStaffAssignmentCustomer(status, customerId);
        return result;
    }

    @PostMapping(value = "/creatTransaction")
    public ResponseDTO creatTransaction(@RequestBody CreatTransactionRequest value) {
        MyUserDetail user = SecurityUtils.getPrincipal();
        Long staffId = user.getId();
        transactionService.creatTransaction(value, staffId);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Succses");
        return responseDTO;
    }

    @GetMapping("/getData")
    public List<TransactionDTO> loadTransaction(@RequestBody LoadTransactionRequest value) {
        List<TransactionDTO> result = transactionService.findBytransaction(value);
        return result;
    }

    @PostMapping("/assignmentCustomer")
    public ResponseDTO AssignmentBuilding(@RequestBody AssignmentDTO value) {
        List<String> role = SecurityUtils.getAuthorities();
        ResponseDTO responseDTO = customerService.assignmentBuilding(value, role);
        return responseDTO;
    }

    @PostMapping(value = "/saveBuilding")
    public ResponseDTO updateOrSave(@RequestBody CustomerDTO value) {
        List<String> role = SecurityUtils.getAuthorities();
        ResponseDTO responseDTO = customerService.updateAndSaveBuilding(value, role);
        return responseDTO;
    }

    @DeleteMapping("/deleteCustomer")
    public ResponseDTO deleteBuilding(@RequestBody DeleteDTO value) {
        List<String> role = SecurityUtils.getAuthorities();
        ResponseDTO responseDTO = customerService.deleteCustomer(value, role);
        return responseDTO;
    }

}
