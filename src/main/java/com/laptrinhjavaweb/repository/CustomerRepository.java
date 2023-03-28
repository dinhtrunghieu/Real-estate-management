package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.repository.Custom.CustomerRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CustomerRepository extends JpaRepository<CustomerEnitity, Long>, CustomerRepositoryCustom {
    void deleteByIdIn(Long[] id);
}
