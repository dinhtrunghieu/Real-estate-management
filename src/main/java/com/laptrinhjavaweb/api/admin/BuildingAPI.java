package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Response.ResponseDTO;
import com.laptrinhjavaweb.dto.request.AssignmentDTO;
import com.laptrinhjavaweb.dto.request.CreatTransactionRequest;
import com.laptrinhjavaweb.dto.request.DeleteDTO;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController(value = "BuildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private IBuildingService buildingService;


    @Autowired
    private IUserService userService;


    @PostMapping(value = "/saveBuilding")
    public ResponseDTO updateOrSave(@RequestBody BuildingDTO value) {
        buildingService.updateAndSaveBuilding(value);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Succses");
        return responseDTO;
    }



    @DeleteMapping("/deletebuilding")
    public ResponseDTO deleteBuilding(@RequestBody DeleteDTO buildingId) {
        ResponseDTO responseDTO = new ResponseDTO();
        buildingService.deleteBuilding(buildingId);
        responseDTO.setMessage("Succses");
        return responseDTO;
    }

    @PostMapping("/assignmentBuilding")
    public ResponseDTO AssignmentBuilding(@RequestBody AssignmentDTO value) {
        ResponseDTO responseDTO = new ResponseDTO();
        buildingService.assignmentBuilding(value);
        responseDTO.setMessage("Succses");
        return responseDTO;
    }

    @GetMapping("/{buildingid}/staffs")
    public ResponseDTO loadStaff(@PathVariable("buildingid") String id) {
        Long buildingid = Long.parseLong(id);
        Integer status = 1;
        ResponseDTO result = userService.findStaffAssignmentBuilding(status, buildingid);
        return result;
    }
}