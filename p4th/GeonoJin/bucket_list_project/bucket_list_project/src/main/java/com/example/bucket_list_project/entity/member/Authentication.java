package com.example.bucket_list_project.entity.member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString(exclude = "member")
@NoArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "authentication_type")
public abstract class Authentication {

    public static final String BASIC_AUTH = "BASIC";

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id = null;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private MemberInfo memberInfo;

    @Column(name = "authentication_type", nullable = false, insertable = false, updatable = false)
    private String authenticationType;

    public Authentication(MemberInfo memberinfo, String authenticationType) {
        this.memberInfo = memberinfo;
        this.authenticationType = authenticationType;
    }
}
