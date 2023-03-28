package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;

import com.laptrinhjavaweb.dto.Response.BuildingResponse;
import com.laptrinhjavaweb.dto.request.AssignmentDTO;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.dto.request.DeleteDTO;
import org.springframework.data.domain.Pageable;


import java.util.List;
import java.util.Map;


public interface IBuildingService {
    BuildingDTO getBuildingById (Long id);
    void deleteBuilding (DeleteDTO buildingId);
    void updateAndSaveBuilding(BuildingDTO value);
    List<BuildingResponse> findBuilding(List<String> role, Long idStaff, BuildingSearchRequest SearchRequest, Pageable pageable);
    int findSearchTotalItems(BuildingSearchRequest SearchRequest);
    Map<String, String> getDistrictValue();
    void assignmentBuilding(AssignmentDTO value);
}
