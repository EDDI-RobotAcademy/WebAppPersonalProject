package kr.eddi.LeaningHelper.entity.member;

import kr.eddi.LeaningHelper.utility.encrypt.EncryptionUtil;
import kr.eddi.LeaningHelper.utility.password.PasswordHashConverter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString(callSuper = true)
@NoArgsConstructor
@DiscriminatorValue(MemberAuth.BASIC_AUTH)
public class MemberBasicAuth extends MemberAuth {


    @Setter
    @Column(nullable = false)
    @Convert(converter = PasswordHashConverter.class)
    private String password;

    public MemberBasicAuth(Member member, String authenticationType, String password) {
        super(member, authenticationType);
        this.password = password;
    }

    public boolean isRightPassword(String plainToCheck) {
        return EncryptionUtil.checkValidation(plainToCheck, password);
    }
}