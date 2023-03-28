package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.Enum.BuildingTypesEnum;
import com.laptrinhjavaweb.Enum.DistrictsEnum;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.MyUserDetail;
import com.laptrinhjavaweb.dto.Response.BuildingResponse;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private MessageUtils messageUtil;

    @Autowired
    IBuildingService buildingService;

    @Autowired
    IUserService userService;


    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView findBuildingPage(@ModelAttribute("modelSearch") BuildingSearchRequest model,
                                         HttpServletRequest request) {
        MyUserDetail user = SecurityUtils.getPrincipal();
        List<String> role = SecurityUtils.getAuthorities();
        Long StaffId = user.getId();
        ModelAndView mav = new ModelAndView("admin/building/list");
        Map<Long, String> userName = userService.getStaffMaps(StaffId);
        mav.addObject("staffmaps", userName);
        DisplayTagUtils.of(request, model);
        List<BuildingResponse> buildingDTOS = buildingService.findBuilding(role, StaffId, model, new PageRequest(model.getPage() - 1, model.getMaxPageItems()));
        Map<String, String> districtMap = buildingService.getDistrictValue();
        mav.addObject("districtValue", districtMap);
        model.setListResult(buildingDTOS);
        model.setTotalItems(buildingService.findSearchTotalItems(model));
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

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView createBuilding(@ModelAttribute(SystemConstant.MODEL) BuildingDTO model) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject(SystemConstant.BUTTON, "Thêm");
        Map<String, String> districtMap = buildingService.getDistrictValue();
        mav.addObject("districtValue", districtMap);
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView updateBuilding(@PathVariable("id") Long buildingId) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.getBuildingById(buildingId);
        Map<String, String> districtMap = buildingService.getDistrictValue();
        mav.addObject("districtValue", districtMap);
        mav.addObject(SystemConstant.MODEL, buildingDTO);
        mav.addObject("buildigId", buildingId);
        return mav;
    }

    @ModelAttribute("buildingTypes")
    public List<String> getListType() {
        List<String> results = new ArrayList<>();
        for (BuildingTypesEnum value : BuildingTypesEnum.values()) {
            results.add(value.getBuildingTypeValue());
        }
        return results;
    }
}
