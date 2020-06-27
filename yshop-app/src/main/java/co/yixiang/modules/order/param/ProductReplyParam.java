package co.yixiang.modules.order.param;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * @ClassName ProductReplyParam
 * @Author hupeng <610796224@qq.com>
 * @Date 2020/6/23
 **/
@Getter
@Setter
public class ProductReplyParam {
    @NotBlank(message = "评论不能为空")
    private String comment;
    private String pics;
    @NotBlank(message = "请为商品评分")
    private String productScore;
    @NotBlank(message = "请为商品评分")
    private String serviceScore;
    @NotBlank(message = "参数有误")
    private String unique;
}
