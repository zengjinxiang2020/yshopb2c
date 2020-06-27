package co.yixiang.modules.order.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Map;

/**
 * @ClassName OrderExtendDTO
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/10/28
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderExtendDTO implements Serializable {
    private String key;
    private String orderId;
    private Map<String,String> jsConfig;
}
