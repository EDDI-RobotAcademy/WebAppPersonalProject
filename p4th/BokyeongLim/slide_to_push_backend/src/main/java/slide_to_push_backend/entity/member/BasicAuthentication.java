package slide_to_push_backend.entity.member;


import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import slide_to_push_backend.utility.encrypt.EncryptionUtil;
import slide_to_push_backend.utility.password.PasswordHashConverter;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@ToString(callSuper = true)
@NoArgsConstructor
@DiscriminatorValue(Authentication.BASIC_AUTH)
public class BasicAuthentication extends Authentication {

    @Setter
    @Column(nullable = false)
    @Convert(converter = PasswordHashConverter.class)
    private String password;

    public BasicAuthentication(Account account, String authenticationType, String password) {
        super(account, authenticationType);
        this.password = password;
    }

    public boolean isRightPassword(String plainToCheck) {
        return EncryptionUtil.checkValidation(plainToCheck, password);
    }
}