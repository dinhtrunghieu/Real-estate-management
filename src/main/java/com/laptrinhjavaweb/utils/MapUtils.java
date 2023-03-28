package com.laptrinhjavaweb.utils;

import com.laptrinhjavaweb.Enum.DistrictsEnum;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class MapUtils {
    public static <T> T getObject(Map<String, Object> params, String key, Class<T> tClass) {
        Object object = params.getOrDefault(key, null);
        if(object != null) {
            if (tClass.getTypeName().equals("java.lang.Long")) {
                object = object != "" ? Long.valueOf(object.toString()) : null;
            } else if (tClass.getTypeName().equals("java.lang.Integer")) {
                object = object != "" ? Integer.parseInt(object.toString()) : null;
            } else if (tClass.getTypeName().equals("java.lang.String")) {
                object = object.toString();
            }
            return tClass.cast(object);
        }
        return null;
    }


}
