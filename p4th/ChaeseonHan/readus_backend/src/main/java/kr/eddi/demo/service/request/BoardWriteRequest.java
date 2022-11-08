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
    public final String content;

    public final String memberEmail;

    public CommunityBoard toCommunityboard(ReadUsMember member) {
        CommunityBoard communityBoard = CommunityBoard.builder()
                .category(this.category)
                .title(this.title)
                .content(this.content)
                .writer(member.getNickName())
                .readUsMember(member)
                .build();

        return communityBoard;
    }

}
