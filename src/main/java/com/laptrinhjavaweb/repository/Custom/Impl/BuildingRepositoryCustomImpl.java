package com.laptrinhjavaweb.repository.Custom.Impl;

import com.laptrinhjavaweb.Builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.Enum.SpecialSearchParamsEnum;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.Response.BuildingResponse;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.Custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.utils.BuildingSpecialUtils;
import com.laptrinhjavaweb.utils.QueryBuilderUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;


@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    BuildingSpecialUtils buildingSpecialUtils;


    private String buildQueryFilter() {
        String sql = "SELECT * FROM building b ";
        return sql;
    }

    @Override
    public List<BuildingEntity> findBuilding(BuildingSearchBuilder builder, Pageable pageable) {
        String typeCode = buildingSpecialUtils.convertTypeToString(builder.getType());
        StringBuilder finalQuery = new StringBuilder("SELECT * From building as b ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildSpecialQueryUsingBuilder(builder, whereQuery, joinQuery);
        buildNormalQueryUsingBuilder(builder, whereQuery);
        finalQuery.append(joinQuery).append(" WHERE 1 = 1").append(whereQuery).append(" GROUP BY b.id")
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        ;
        Query query = entityManager.createNativeQuery(finalQuery.toString(), BuildingEntity.class);
        List<BuildingEntity> buildings = query.getResultList();
        return buildings;
    }

    @Override
    public int findTotalItemsBuilding(BuildingSearchBuilder builder) {
        StringBuilder finalQuery = new StringBuilder("SELECT * From building as b ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildSpecialQueryUsingBuilder(builder, whereQuery, joinQuery);
        buildNormalQueryUsingBuilder(builder, whereQuery);
        finalQuery.append(joinQuery).append(" WHERE 1 = 1").append(whereQuery).append(" GROUP BY b.id");
        Query query = entityManager.createNativeQuery(finalQuery.toString(), BuildingEntity.class);
        return query.getResultList().size();

    }


    private void buildSpecialQueryUsingBuilder(BuildingSearchBuilder builder, StringBuilder whereQuery, StringBuilder joinQuery) {
        // rent area

        Integer rentAreaFrom = builder.getAreaRentFrom();
        Integer rentAreaTo = builder.getAreaRentTo();

        if (null != rentAreaFrom || null != rentAreaTo) {
            joinQuery.append("\nJOIN rentarea ra ON ra.buildingid = b.id");
            whereQuery.append(QueryBuilderUtils.withBetween("ra.value", rentAreaFrom, rentAreaTo));
        }

        // rent price
        Integer costRentFrom = builder.getCostRentFrom();
        Integer costRentTo = builder.getCostRentTo();

        if (null != costRentFrom || null != costRentTo) {
            whereQuery.append(QueryBuilderUtils.withBetween("b.rentprice", costRentFrom, costRentTo));
        }

        // staff
        Long staffId = builder.getStaffId();

        if (null != staffId && staffId != -1L) {
            joinQuery.append("\nJOIN assignmentbuilding ab ON ab.buildingid = b.id");
            whereQuery.append(QueryBuilderUtils.withOperator("ab.staffid", staffId, SystemConstant.EQUAL_OPERATOR));
        }

        //type
        String typeCode = buildingSpecialUtils.convertTypeToString(builder.getType());
        if (null != typeCode && !typeCode.equals("") ) {
            whereQuery.append(" AND b.type like '%" + typeCode + "%'");
        }

    }

    private void buildNormalQueryUsingBuilder(BuildingSearchBuilder builder, StringBuilder whereQuery) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = SystemConstant.BUILDING_ALIAS + field.getName();

                if (!getSpecialSearchParams().contains(field.getName())) {
                    Object objectValue = field.get(builder);
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
