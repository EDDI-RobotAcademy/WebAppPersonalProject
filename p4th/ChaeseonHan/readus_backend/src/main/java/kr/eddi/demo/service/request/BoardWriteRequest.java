package kr.eddi.demo.service.request;


import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.entity.ReadUsMember;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class BoardWriteRequest {

    public final String category;
    public final String title;
    public final String contents;

    public final String memberEmail;

    public CommunityBoard toCommunityboard(ReadUsMember member) {
        return new CommunityBoard(category, title, contents, member);
    }

}
