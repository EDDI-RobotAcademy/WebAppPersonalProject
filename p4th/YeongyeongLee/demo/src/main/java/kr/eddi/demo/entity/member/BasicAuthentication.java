package kr.eddi.demo.entity.member;


import kr.eddi.demo.utilty.encrypt.EncryptionUtil;
import kr.eddi.demo.utilty.password.PasswordHashConverter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString(callSuper = true)
@NoArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorValue(Authentication.BASIC_AUTH)


public class BasicAuthentication extends Authentication {

    @Setter
    @Column(nullable = false)
    @Convert(converter = PasswordHashConverter.class)
    private String password;

    public BasicAuthentication(JpaMember member, String authenticationType, String password) {
        super(member, authenticationType);
        this.password = password;
    }

    public boolean isRightPassword(String plainToCheck) {
        return EncryptionUtil.checkValidation(plainToCheck, password);
    }

}
