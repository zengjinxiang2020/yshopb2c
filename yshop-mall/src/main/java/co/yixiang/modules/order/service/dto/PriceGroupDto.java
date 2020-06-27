package co.yixiang.modules.order.service.dto;

import lombok.Data;

/**
 * @ClassName PriceGroup
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/10/27
 **/
@Data
public class PriceGroupDto {

    private Double costPrice;
    private Double storeFreePostage;
    private Double storePostage;
    private Double totalPrice;
    private Double vipPrice;

}
