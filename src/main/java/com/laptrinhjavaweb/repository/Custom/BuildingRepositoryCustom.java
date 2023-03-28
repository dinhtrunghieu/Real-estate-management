package com.laptrinhjavaweb.repository.Custom;

import com.laptrinhjavaweb.Builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.dto.Response.BuildingResponse;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findBuilding(BuildingSearchBuilder builder, Pageable pageable);
    int findTotalItemsBuilding(BuildingSearchBuilder builder);
}
