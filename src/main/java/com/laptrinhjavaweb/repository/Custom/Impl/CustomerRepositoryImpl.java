package com.laptrinhjavaweb.repository.Custom.Impl;

import com.laptrinhjavaweb.Enum.SpecialSearchParamsEnum;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.request.CustomerSearchRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEnitity;
import com.laptrinhjavaweb.repository.Custom.CustomerRepositoryCustom;
import com.laptrinhjavaweb.utils.QueryBuilderUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<CustomerEnitity> findCustomer(CustomerSearchRequest value, PageRequest pageable) {
        StringBuilder finalQuery = new StringBuilder("SELECT * From customer as c ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();


        normalQuery(value, whereQuery);
        specialQuery(value, whereQuery,joinQuery);
        finalQuery.append(joinQuery).append(" WHERE 1 = 1").append(whereQuery)
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        ;
        Query query = entityManager.createNativeQuery(finalQuery.toString(), CustomerEnitity.class);
        List<CustomerEnitity> customer = query.getResultList();
        return customer;
    }

    @Override
    public int findTotalItemsBuilding(CustomerSearchRequest value) {
        StringBuilder finalQuery = new StringBuilder("SELECT * From customer as c ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        normalQuery(value, whereQuery);
        specialQuery(value, whereQuery, joinQuery);
        finalQuery.append(joinQuery).append(" WHERE 1 = 1").append(whereQuery);
        Query query = entityManager.createNativeQuery(finalQuery.toString(), CustomerEnitity.class);
        return query.getResultList().size();
    }

    private void specialQuery(CustomerSearchRequest value, StringBuilder whereQuery, StringBuilder joinQuery) {
        // staff
        Long staffId = value.getStaffId();

        if (null != staffId && staffId != -1L) {
            joinQuery.append("\nJOIN assignmentcustomer ac ON ac.customerid = c.id");
            whereQuery.append(QueryBuilderUtils.withOperator("ac.staffid", staffId, SystemConstant.EQUAL_OPERATOR));
        }

    }

    private void normalQuery(CustomerSearchRequest value, StringBuilder whereQuery) {
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = SystemConstant.CUSTOMER_ALIAS + field.getName();
                if (!getSpecialSearchParams().contains(field.getName())) {
                    Object objectValue = field.get(value);
                    if (objectValue != null) {
                        if (objectValue instanceof String) {
                            whereQuery.append(QueryBuilderUtils.withLike(fieldName.toLowerCase(), objectValue.toString()));
                        } else if (objectValue instanceof Integer) {
                            whereQuery.append(QueryBuilderUtils.withOperator(fieldName.toLowerCase(), objectValue, SystemConstant.EQUAL_OPERATOR));
                        }

                    }

                }
            }
        } catch (Exception e) {
        }
    }

    private List<String> getSpecialSearchParams() {
        List<String> params = new ArrayList<>();
        for (SpecialSearchParamsEnum item : SpecialSearchParamsEnum.values()) {
            params.add(item.getValue());
        }
        return params;
    }

}
