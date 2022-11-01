package LeaningHelper_backEnd.LeaningHelper.service.member;

import LeaningHelper_backEnd.LeaningHelper.entity.Member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import LeaningHelper_backEnd.LeaningHelper.reposipory.MemberRepository;
import LeaningHelper_backEnd.LeaningHelper.request.member.MemberRegisterRequest;

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
        Optional<Member> maybeMember = repository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }
}
