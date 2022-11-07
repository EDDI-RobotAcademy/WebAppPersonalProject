package personal_project.look_style.utility.password;

import personal_project.look_style.utility.EncryptionUtil;

import javax.persistence.AttributeConverter;

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
