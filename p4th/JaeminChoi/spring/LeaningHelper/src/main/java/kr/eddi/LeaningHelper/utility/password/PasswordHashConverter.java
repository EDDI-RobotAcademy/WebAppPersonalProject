package kr.eddi.LeaningHelper.utility.password;

import kr.eddi.LeaningHelper.utility.encrypt.EncryptionUtil;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

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
