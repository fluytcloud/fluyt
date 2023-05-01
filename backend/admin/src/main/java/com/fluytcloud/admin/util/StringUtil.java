package com.fluytcloud.admin.util;

import java.text.Normalizer;

public class StringUtil {

    private StringUtil() {
    }

    public static String stripAccents(String value) {
        value = value.trim().replace(" ", "_").toLowerCase();
        value = Normalizer.normalize(value, Normalizer.Form.NFD);
        return value.replaceAll("[\\p{InCOMBINING_DIACRITICAL_MARKS}]", "");
    }

}
