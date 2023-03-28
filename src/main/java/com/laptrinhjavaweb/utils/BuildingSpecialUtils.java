package com.laptrinhjavaweb.utils;

import com.laptrinhjavaweb.Enum.BuildingTypesEnum;
import com.laptrinhjavaweb.Enum.DistrictsEnum;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

@Component
public class BuildingSpecialUtils {
    public static String districtCodeConvertToView(String district){
        if (district != null){
            for (DistrictsEnum value: DistrictsEnum.values()) {
                if (district.equalsIgnoreCase(value.toString()) ){
                     district = value.getDistrictValue();
                    return district;

                }
            }
        }
        return null;
    }

    public static String addRessConvertToView(BuildingEntity entity, String district){
        String addRess = null;
        if (entity.getStreet() != null && entity.getWard() != null ){
             addRess = ((entity.getStreet() + "-" + entity.getWard() + "-" + district ));
        }
        return addRess;
    }

    public static String convertTypeToString(String[] buildingType){
        StringJoiner typeCode = new StringJoiner(",");
        if (buildingType != null) {
            for (String name : buildingType) {
                for (BuildingTypesEnum code : BuildingTypesEnum.values()) {
                    if (name.equalsIgnoreCase(code.getBuildingTypeValue())) {
                        typeCode.add(code.toString());
                        break;
                    }
                }
            }
            return typeCode.toString();
        } else {
            return  typeCode.toString();
        }

    }

    public static String[] convertTypeToArray (String type){

        if (type != null){
            String[] checked = type.split(",");
            for (int i = 0; i < checked.length ; i ++){
                for (BuildingTypesEnum name : BuildingTypesEnum.values()) {
                    if(checked[i].equalsIgnoreCase(name.toString())){
                        checked[i] = name.getBuildingTypeValue();
                        break;
                    }
                }
            }
            return checked;
        }
        return null;
    }

    public List<RentAreaEntity> getAndsetValueRentArea(BuildingDTO value, BuildingEntity buildingEntity) {
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        List<String> areaValueString = new ArrayList();
        if (value.getBuildingArea() != null && value.getBuildingArea() != ""){
            String[] areaValue = value.getBuildingArea().split(",");
            for (String item : areaValue){
                areaValueString.add(item);
            }
        }
        if (areaValueString.size() > 0) {
            for (String item : areaValueString) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Integer.parseInt(item));
                rentAreaEntity.setBuilding(buildingEntity);
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        return rentAreaEntities;
    }
}
