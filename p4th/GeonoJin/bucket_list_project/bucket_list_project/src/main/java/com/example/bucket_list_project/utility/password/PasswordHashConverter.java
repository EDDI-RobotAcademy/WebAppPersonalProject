package com.example.bucket_list_project.utility.password;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class PasswordHashConverter implements AttributeConverter<String, String> {

    @Override
    public String convertToDatabaseColumn(String attribute) {
        return null;
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        return null;
    }
}
