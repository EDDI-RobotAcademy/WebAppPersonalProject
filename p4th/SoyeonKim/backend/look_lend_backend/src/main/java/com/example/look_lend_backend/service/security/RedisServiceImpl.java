package com.example.look_lend_backend.service.security;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
@RequiredArgsConstructor
public class RedisServiceImpl implements RedisService{

    private final StringRedisTemplate redisTemplate;

    @Override
    public void setKeyAndValue(String token, Long memNo) {
        String memNoString = String.valueOf(memNo);
        ValueOperations<String, String> value = redisTemplate.opsForValue();
        value.set(token, memNoString, Duration.ofMinutes(3));
    }

    @Override
    public Long getValueMyKey(String token) {
        ValueOperations<String, String> value = redisTemplate.opsForValue();
        String tempMemNo = value.get(token);
        Long memNo;
        if(tempMemNo == null) {
            memNo = null;
        } else {
            memNo = Long.parseLong(tempMemNo);
        }
        return memNo;
    }

    @Override
    public void deleteByKey(String token) {
        redisTemplate.delete(token);
    }

    public boolean isRefreshTokenExists(String token) {
        return getValueMyKey(token) != null;
    }
}
