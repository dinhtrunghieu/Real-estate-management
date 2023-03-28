package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.Builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.Enum.BuildingTypesEnum;
import com.laptrinhjavaweb.Enum.DistrictsEnum;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Response.BuildingResponse;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.dto.request.SaveBuildingRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.utils.BuildingSpecialUtils;
import com.laptrinhjavaweb.utils.MapUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingSpecialUtils buildingSpecialUtils;

    public BuildingEntity convertToEntity(BuildingDTO buildingDTO) {
        BuildingEntity results = modelMapper.map(buildingDTO, BuildingEntity.class);
        String type = buildingSpecialUtils.convertTypeToString(buildingDTO.getType());
        results.setType(type);
        return results;
    }

    public BuildingDTO convertSaveBuildingRequestToBuildingDTO (SaveBuildingRequest saveBuilding) {
        BuildingDTO results = modelMapper.map(saveBuilding, BuildingDTO.class);
        return results;
    }


    public BuildingDTO convertToDTO(BuildingEntity entity) {
        BuildingDTO dto = modelMapper.map(entity, BuildingDTO.class);
        String[] type = buildingSpecialUtils.convertTypeToArray(entity.getType());
        List<RentAreaEntity> rentAreasEntity = entity.getRentAreas();
        StringJoiner rentAreaValue = new StringJoiner(",");
        for (RentAreaEntity value : rentAreasEntity){
            rentAreaValue.add(value.getValue().toString());
        }
        String district = buildingSpecialUtils.districtCodeConvertToView(entity.getDistrict());
        dto.setType(type);
        dto.setBuildingArea(rentAreaValue.toString());
        dto.setAddRess(buildingSpecialUtils.addRessConvertToView(entity, district));


        return dto;
    }

    public List<BuildingResponse> convertFromEntitytoBuildingResponse(List<BuildingEntity> entity) {
        List<BuildingResponse> results = new ArrayList<>();
        BuildingResponse buildingResponse;
        for (BuildingEntity item : entity) {
            buildingResponse = modelMapper.map(item, BuildingResponse.class);
            //get distric
            String district = buildingSpecialUtils.districtCodeConvertToView(item.getDistrict());

            //add to building Response;
            buildingResponse.setAddRess(buildingSpecialUtils.addRessConvertToView(item,district));
            results.add(buildingResponse);
        }
        return results;
    }
}
