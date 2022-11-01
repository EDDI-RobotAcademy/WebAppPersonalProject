package com.example.bucket_list_project.entity.member;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Entity
@NoArgsConstructor
public class MemberInfo {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Getter
    @Column(nullable = false)
    private String email;

    @OneToOne(mappedBy = "memberInfo", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    private MemberProfile profile;

    @OneToMany(mappedBy = "memberInfo", fetch = FetchType.LAZY)
    private Set<Authentication> authentications = new HashSet<>();

    public MemberInfo(String email, MemberProfile profile) {
        this.email = email;
        this.profile = profile;
        profile.setMemberInfo(this);
    }

    public boolean isRightPassword(String plainToCheck) {
        final Optional<Authentication> maybeBasicAuth = findBasicAuthentication();

        if (maybeBasicAuth.isPresent()) {
            final BasicAuthentication auth = (BasicAuthentication) maybeBasicAuth.get();
            return auth.isRightPassword(plainToCheck);
        }

        return false;
    }

    private Optional<Authentication> findBasicAuthentication() {
        return authentications
                .stream()
                .filter(auth -> auth instanceof BasicAuthentication)
                .findFirst();
    }
}
