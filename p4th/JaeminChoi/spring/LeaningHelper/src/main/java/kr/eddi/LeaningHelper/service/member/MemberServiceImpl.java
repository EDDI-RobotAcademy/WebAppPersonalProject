package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.entity.member.MemberAuth;
import kr.eddi.LeaningHelper.entity.member.MemberBasicAuth;
import kr.eddi.LeaningHelper.entity.member.MemberProfile;
import kr.eddi.LeaningHelper.repository.Member.MemberAuthRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberProfileRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberRepository;
import kr.eddi.LeaningHelper.request.member.MemberRegisterRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    MemberProfileRepository memberProfileRepository;

    @Autowired
    MemberAuthRepository memberAuthRepository;

    @Override
    public Boolean memberRegister(MemberRegisterRequest memberRegisterRequest) {
        final Member member = memberRegisterRequest.toMember();
        memberRepository.save(member);

        MemberProfile memberProfile = MemberProfile.builder()
                .member(member)
                .build();

        memberProfileRepository.save(memberProfile);


        final MemberBasicAuth auth = new MemberBasicAuth(member,
                MemberAuth.BASIC_AUTH, memberRegisterRequest.getPw());

        memberAuthRepository.save(auth);

        return true;
    }

    @Override
    public Boolean emailValidation(String id) {
        Optional<Member> maybeMember = memberRepository.findById(id);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

}
