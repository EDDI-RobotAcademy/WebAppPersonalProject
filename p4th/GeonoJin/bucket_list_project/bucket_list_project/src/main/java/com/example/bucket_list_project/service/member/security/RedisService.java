package com.example.bucket_list_project.service.member.security;

public interface RedisService {

    public void setKeyAndValue(String token, Long memNo);

    public Long getValueByKey(String token);

    public void deleteByKey(String token);
}
