package com.laptrinhjavaweb.repository;


import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionReposirory extends JpaRepository<TransactionEntity, Long> {
    List<TransactionEntity> findByCustomerAndCode(CustomerEnitity customer, String cskh);
}
