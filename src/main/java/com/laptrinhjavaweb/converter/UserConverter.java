package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.Response.StaffResponseDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserConverter {

    @Autowired
    private ModelMapper modelMapper;

    public UserDTO convertToDto (UserEntity entity){
        UserDTO result = modelMapper.map(entity, UserDTO.class);
        return result;
    }

    public UserEntity convertToEntity (UserDTO dto){
        UserEntity result = modelMapper.map(dto, UserEntity.class);
        return result;
    }

    public List<StaffResponseDTO> convertToStaffResponseDTO (List<UserEntity> value){
        List<StaffResponseDTO> results = new ArrayList<>();
        for (UserEntity item : value){
            StaffResponseDTO staffResponse =  modelMapper.map(item, StaffResponseDTO.class);
            results.add(staffResponse);
        }
        return  results;

    }
}
