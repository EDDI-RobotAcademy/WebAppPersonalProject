package slide_to_push_backend.service.member;

import slide_to_push_backend.service.member.request.MemberSignInRequest;

public interface MemberService {

    String signIn(MemberSignInRequest request);
}

