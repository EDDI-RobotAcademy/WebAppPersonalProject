package com.example.bucket_list_project.service.bucketBoard.request.bucketBoard;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BucketListByUserNicknamePerPageRequest {

    private String userNickname;
    private int pageValue;
}
