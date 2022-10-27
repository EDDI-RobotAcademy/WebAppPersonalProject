package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.repository.Member.MemberRepository;
import kr.eddi.LeaningHelper.request.member.MemberRegisterRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberRepository repository;

    @Override
    public void memberRegister(MemberRegisterRequest memberRegisterRequest) {
        Member member = Member.builder()
                .id(memberRegisterRequest.getId())
                .pw(memberRegisterRequest.getPw())
                .nickName(memberRegisterRequest.getNickName())
                .build();
        repository.save(member);
    }


    @Override
    public Boolean emailValidation(String email) {


        return true;
    }
}
