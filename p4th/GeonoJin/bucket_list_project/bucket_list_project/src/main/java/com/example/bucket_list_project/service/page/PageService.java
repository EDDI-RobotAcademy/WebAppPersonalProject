package com.example.bucket_list_project.service.page;

import org.springframework.data.domain.Pageable;

public interface PageService {

    public int getTotalPageNum(Pageable pageable);

    public int getTotalPageByCategory(String categoryName);

    public int getTotalPageByMyBucket(String userNickname);
}
