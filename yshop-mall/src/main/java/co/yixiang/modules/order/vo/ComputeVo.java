package co.yixiang.modules.order.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @ClassName ComputeVo
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/10/27
 **/
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ComputeVo implements Serializable {
    private Double couponPrice;
    private Double deductionPrice;
    private Double payPostage;
    private Double payPrice;
    private Double totalPrice;
    private Double usedIntegral; //使用了多少积分
}
