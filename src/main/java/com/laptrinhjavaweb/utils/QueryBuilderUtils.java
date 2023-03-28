package com.laptrinhjavaweb.utils;

import java.util.ArrayList;
import java.util.List;

public class QueryBuilderUtils {
    public static String withLike(String column, String value) {
        return (!ValidateUtils.isValid(value)) ? "" : String.format("%nAND %s LIKE %s", column, "'%" + value + "%'");
    }

    public static String withOperator(String column, Object value, String operator) {
        if (!ValidateUtils.isValid(value)) {
            return "";
        }

        return (value instanceof String) ? String.format("%nAND %s %s '%s'", column, operator, value.toString())
                : String.format("%nAND %s %s %s", column, operator, value.toString());
    }

    public static String withBetween(String column, Object from, Object to) {
        if (null == from && null == to) {
            return "";
        } else {
            if (null == from) {
                from = 0;
            }
            if (null == to) {
                if (from instanceof Integer) {
                    to = Integer.MAX_VALUE;
                } else if (from instanceof Double) {
                    to = Double.MAX_VALUE;
                }
            }

            return String.format("%nAND %s BETWEEN %s AND %s", column, from, to);
        }
    }

    public static <T> String withIn(String column, List<String> list) {
        List<Object> convertedValues = new ArrayList<>();
        String joinValues;

        if (list.get(0) instanceof String) {
            for (Object item : list) {
                StringBuilder convertedItem = new StringBuilder();
                convertedItem.append("'").append(item.toString()).append("'");
                convertedValues.add(convertedItem.toString());
            }
            joinValues = String.join(",", (List<String>) (Object) convertedValues);
        } else {
            String listString = list.toString();
            joinValues = listString.substring(1, listString.length() - 1);
        }

        return String.format("%nAND %s IN (%s)", column, joinValues);
    }

}

