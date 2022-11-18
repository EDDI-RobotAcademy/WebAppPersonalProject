package com.example.look_lend_backend.service.security;

public interface RedisService {
    public void setKeyAndValue(String token, Long memNo);
    public Long getValueMyKey(String token);
    public void deleteByKey(String token);
}
