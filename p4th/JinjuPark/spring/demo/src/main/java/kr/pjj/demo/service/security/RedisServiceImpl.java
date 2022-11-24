package kr.pjj.demo.service.security;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
@RequiredArgsConstructor
public class RedisServiceImpl implements RedisService {
    private final StringRedisTemplate redisTemplate;

    public void setKeyAndValue( String refreshToken, Long memNo) {
        String memNoToString = String.valueOf(memNo);
        ValueOperations<String, String> value = redisTemplate.opsForValue();
        value.set(refreshToken, memNoToString, Duration.ofDays(30)); // 리프레시 토큰 30일
    }


    public Long getValueByKey(String token) {
        ValueOperations<String, String> value = redisTemplate.opsForValue();
        String tempMemNo = value.get(token);
        Long memNo;
        if(tempMemNo != null){
            memNo = Long.parseLong(tempMemNo);
        } else {
            memNo = null;
        }
        return memNo;
    }

    public void deleteByKey(String token) {
        redisTemplate.delete(token);
    }

    //true면 새로운 토큰 발행된 상태 -> false면 새로운 토큰 발행 안된 상태
    public boolean isRefreshTokenExists(String token) {
        return getValueByKey(token) == null;
    }
}
