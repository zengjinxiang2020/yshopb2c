package co.yixiang.modules.activity.vo;

import co.yixiang.modules.activity.service.dto.PinkDto;
import co.yixiang.modules.product.domain.YxStoreProductAttrValue;
import co.yixiang.modules.product.vo.YxStoreProductAttrQueryVo;
import co.yixiang.modules.product.vo.YxStoreProductReplyQueryVo;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 拼团产品表 查询结果对象
 * </p>
 *
 * @author hupeng
 * @date 2019-11-19
 */
@Data
public class StoreCombinationVo implements Serializable {
    private static final long serialVersionUID = 1L;

    private List<PinkDto> pink;

    private List<Long> pindAll;

    private List<String> pinkOkList;

    private Integer pinkOkSum;

    private YxStoreProductReplyQueryVo reply;

    private Integer replyCount = 0;

    private String replyChance;
    private YxStoreCombinationQueryVo storeInfo;

    private Boolean userCollect = false;

    private String tempName;

    private List<YxStoreProductAttrQueryVo> productAttr = new ArrayList();

    private Map<String, YxStoreProductAttrValue> productValue = new LinkedHashMap<>();

}
