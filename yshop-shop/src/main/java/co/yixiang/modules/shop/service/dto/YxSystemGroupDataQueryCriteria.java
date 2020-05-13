package co.yixiang.modules.shop.service.dto;

import lombok.Data;
import co.yixiang.annotation.Query;

/**
* @author hupeng
* @date 2020-05-12
*/
@Data
public class YxSystemGroupDataQueryCriteria{

    // 精确
    @Query
    private String groupName;
}
