package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.SaveBuildingRequest;
import com.laptrinhjavaweb.dto.request.TransactionDTO;
import com.laptrinhjavaweb.entity.TransactionEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;

    public TransactionDTO convertToTransactionDTO (TransactionEntity entity) {
        TransactionDTO results = modelMapper.map(entity, TransactionDTO.class);
        java.util.Date now = entity.getCreatedDate();
        SimpleDateFormat dinhDang = new SimpleDateFormat("dd/MM/yyyy");
        if (now != null) {
            String value = dinhDang.format(now);
            results.setCreatedDate(value);
        }

        return results;
    }
}
