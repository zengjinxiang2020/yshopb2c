package co.yixiang.modules.activity.web.param;

import co.yixiang.common.web.param.QueryParam;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户参与砍价表 查询参数对象
 * </p>
 *
 * @author hupeng
 * @date 2019-12-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value="用户参与砍价表查询参数", description="用户参与砍价表查询参数")
public class YxStoreBargainUserQueryParam extends QueryParam {
    private static final long serialVersionUID = 1L;
}
