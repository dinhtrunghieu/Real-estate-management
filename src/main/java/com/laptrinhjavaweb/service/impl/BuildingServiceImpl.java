package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.Builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.Enum.BuildingTypesEnum;
import com.laptrinhjavaweb.Enum.DistrictsEnum;
import com.laptrinhjavaweb.dto.MyUserDetail;
import com.laptrinhjavaweb.dto.request.AssignmentDTO;
import com.laptrinhjavaweb.dto.request.DeleteDTO;
import com.laptrinhjavaweb.dto.request.SaveBuildingRequest;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.exception.NotFoundException;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Response.BuildingResponse;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.Custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.utils.BuildingSpecialUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import javax.transaction.Transactional;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class BuildingServiceImpl implements IBuildingService {

    @Autowired
    UploadFileUtils uploadFileUtils;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private BuildingRepository buildingRepository;


    @Autowired
    private UserRepository userRepository;

    @Autowired
    BuildingSpecialUtils buildingSpecialUtils;

    @Override
    public BuildingDTO getBuildingById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.convertToDTO(buildingEntity);
        return buildingDTO;
    }


    @Transactional
    @Override
    public void deleteBuilding(DeleteDTO value) {
        buildingRepository.deleteByIdIn(value.getId());
    }

    @Override
    @Transactional
    public void updateAndSaveBuilding(BuildingDTO value) {
        Long buildingId = value.getId();
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(value);
        if (buildingId != null) { // update
            BuildingEntity foundBuilding = buildingRepository.findById(buildingId)
                    .orElseThrow(() -> new NotFoundException("Building not found!"));
            buildingEntity.setImage(foundBuilding.getImage());
            long millis = System.currentTimeMillis();
            java.util.Date now = new Date(millis);
            SimpleDateFormat dinhDang = new SimpleDateFormat("dd/MM/yyyy");
            if (now != null) {
                String date = dinhDang.format(now);
                buildingEntity.setCreatedDate((java.sql.Date) now);
            }
            MyUserDetail user = SecurityUtils.getPrincipal();
            buildingEntity.setCreatedBy(user.getFullName());
        }
        saveThumbnail(value, buildingEntity);
        //get set valueRentArea
        List<RentAreaEntity> rentAreaToAdd = buildingSpecialUtils.getAndsetValueRentArea(value, buildingEntity);
        buildingEntity.setRentAreas(rentAreaToAdd);
        buildingRepository.save(buildingEntity);
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }

    @Override
    public List<BuildingResponse> findBuilding(List<String> role, Long idStaff,BuildingSearchRequest value, Pageable pageable) {
        if (!role.contains("ROLE_MANAGER")){
            value.setStaffId(idStaff);
        }
        BuildingSearchBuilder builder = convertToBuildingSearchBuilder(value);
        List<BuildingEntity> buildingEntity = buildingRepository.findBuilding(builder, pageable);
        List<BuildingResponse> buildingResponse = buildingConverter.convertFromEntitytoBuildingResponse(buildingEntity);
        return buildingResponse;
    }



    @Override
    public int findSearchTotalItems(BuildingSearchRequest value) {
        BuildingSearchBuilder builder = convertToBuildingSearchBuilder(value);
        int size = buildingRepository.findTotalItemsBuilding(builder);
        return size;
    }



    @Override
    public Map<String, String> getDistrictValue() {
        Map<String, String>  results = new HashMap<>();
        for (DistrictsEnum value : DistrictsEnum.values()) {
            results.put(value.toString() ,value.getDistrictValue());
        }
        return results;
    }

    @Override
    @Transactional
    public void assignmentBuilding(AssignmentDTO value) {
        //get inputStaffIds
        List<UserEntity> staffToAdd = userRepository.findByIdIn(value.getStaffIds());
        Long buildingId = value.getId();
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        buildingEntity.setUsers(staffToAdd);
        buildingRepository.save(buildingEntity);
    }

    private BuildingSearchBuilder convertToBuildingSearchBuilder(BuildingSearchRequest value) {
        BuildingSearchBuilder results = new BuildingSearchBuilder.Builder()
                .setName(value.getName())
                .setAreaRentFrom(value.getAreaRentFrom())
                .setAreaRentTo(value.getAreaRentTo())
                .setCostRentFrom(value.getCostRentFrom())
                .setCostRentTo(value.getCostRentTo())
                .setDistrict(value.getDistrict())
                .setNumberOfBasement(value.getNumberOfBasement())
                .setStaffId(value.getStaffId())
                .setStreet(value.getStreet())
                .setWard(value.getWard())
                .setType(value.getType())
                .setDistrict(value.getDistrict())
                .setFloorArea(value.getFloorArea())
                .setDirection(value.getDirection())
                .setLevel(value.getLevel())
                .setManagerName(value.getManagerName())
                .setManagerPhone(value.getManagerPhone())
                .build();
        return results;
    }

}
