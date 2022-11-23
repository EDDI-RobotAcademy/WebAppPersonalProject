package com.example.demo.service.security;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
@RequiredArgsConstructor
public class RedisServiceImpl implements RedisService {
    private final StringRedisTemplate redisTemplate;

    public void setKeyAndValue(String token, Long memNo) {
        String memNoToString = String.valueOf(memNo);
        ValueOperations<String, String> value = redisTemplate.opsForValue();
        value.set(token, memNoToString, Duration.ofHours(1));
    }

    public Long getValueByKey(String token) {
        ValueOperations<String, String> value = redisTemplate.opsForValue();
        String tempMemNo = value.get(token);
        Long memNo;
        if(tempMemNo == null){
            memNo = null;
        } else {
            memNo = Long.parseLong(tempMemNo);
        }
        return memNo;
    }

    public void deleteByKey(String token) {
        redisTemplate.delete(token);
    }

    public boolean isRefreshTokenExists(String token) {
        return getValueByKey(token) != null;
    }
}
