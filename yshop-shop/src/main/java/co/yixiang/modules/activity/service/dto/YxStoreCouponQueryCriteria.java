package co.yixiang.modules.activity.service.dto;

import lombok.Data;
import java.util.List;
import co.yixiang.annotation.Query;

/**
* @author xuwenbo
* @date 2020-05-13
*/
@Data
public class YxStoreCouponQueryCriteria{

    @Query
    private Integer isDel;
}
