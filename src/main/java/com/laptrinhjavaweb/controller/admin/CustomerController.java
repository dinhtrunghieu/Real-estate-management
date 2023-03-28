package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.MyUserDetail;
import com.laptrinhjavaweb.dto.Response.CustomerResponse;
import com.laptrinhjavaweb.dto.request.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerSearchRequest;
import com.laptrinhjavaweb.dto.request.TransactionDTO;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.ITransactionService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import com.laptrinhjavaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {

    @Autowired
    private MessageUtils messageUtil;

    @Autowired
    IUserService userService;

    @Autowired
    ICustomerService customerService;

    @Autowired
    ITransactionService transactionService;



    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView findCustomer(@ModelAttribute("customerSearch") CustomerSearchRequest model,
                                         HttpServletRequest request) {
        MyUserDetail user = SecurityUtils.getPrincipal();
        List<String> role = SecurityUtils.getAuthorities();
        Long StaffId = user.getId();
        ModelAndView mav = new ModelAndView("admin/customer/list");
        Map<Long, String> userName = userService.getStaffMaps(StaffId);
        mav.addObject("staffmaps", userName);
        DisplayTagUtils.of(request, model);
        List<CustomerResponse> CustomerResponse = customerService.findCustomer(role, StaffId, model, new PageRequest(model.getPage() - 1, model.getMaxPageItems()));
        model.setListResult(CustomerResponse);
        model.setTotalItems(customerService.findSearchTotalItems(model));
        mav.addObject(SystemConstant.MODEL, model);
        initMessageResponse(mav, request);
        return mav;
    }

    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView createCustomer(@ModelAttribute(SystemConstant.MODEL) CustomerDTO model) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject(SystemConstant.BUTTON, "Thêm");
        return mav;
    }


    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView updateBuilding(@PathVariable("id") Long customerId) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO CustomerEditDTO = customerService.getCustomerById(customerId);
        mav.addObject(SystemConstant.MODEL, CustomerEditDTO);
        Map<String,String> code = transactionService.getCode();
        Map<String, Object> data = transactionService.getData(code, customerId);
        mav.addObject("transactionCode", code);
        mav.addObject("transactionData", data);
        mav.addObject("customerId", customerId);
        return mav;
    }
}
