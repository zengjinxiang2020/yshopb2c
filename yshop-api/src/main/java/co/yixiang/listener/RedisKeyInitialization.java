package co.yixiang.listener;

import co.yixiang.enums.RedisKeyEnum;
import co.yixiang.modules.shop.service.YxSystemConfigService;
import co.yixiang.utils.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * api服务启动初始化reids
 */
@Component
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class RedisKeyInitialization {


    private final YxSystemConfigService systemConfigService;

    private final RedisTemplate<String,String> redisTemplate;

    @PostConstruct
    public void redisKeyInitialization(){
      List<RedisKeyEnum> redisKeyEnums =  Stream.of(RedisKeyEnum.values()).collect(Collectors.toList());
        for (RedisKeyEnum redisKeyEnum : redisKeyEnums) {
            String redisKey  = redisTemplate.opsForValue().get(redisKeyEnum.getValue());
           if(StringUtils.isEmpty(redisKey)){
               String dbKey = systemConfigService.getData(redisKeyEnum.getValue());
               redisTemplate.opsForValue().set(redisKeyEnum.getValue(),dbKey);
           }
        }
    }
}
