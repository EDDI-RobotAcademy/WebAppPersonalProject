package com.example.demo.utility.password;

import com.example.demo.utility.encrypt.EncryptionUtil;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 * 비밀번호 해시 변환
 */
@Converter
public class PasswordHashConverter implements AttributeConverter<String, String> {

    @Override
    public String convertToDatabaseColumn(String attribute) {
        return EncryptionUtil.generateHash(attribute);
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        return dbData;
    }

}
