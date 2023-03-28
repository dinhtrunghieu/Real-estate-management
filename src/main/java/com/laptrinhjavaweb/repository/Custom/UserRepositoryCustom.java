package com.laptrinhjavaweb.repository.Custom;

import com.laptrinhjavaweb.entity.UserEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserRepositoryCustom {
    List<UserEntity> getAllUsers(Pageable pageable);
    int countTotalItem();
}