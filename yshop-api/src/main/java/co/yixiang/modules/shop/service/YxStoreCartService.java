package co.yixiang.modules.shop.service;

import co.yixiang.common.service.BaseService;
import co.yixiang.modules.shop.entity.YxStoreCart;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 购物车表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-25
 */
public interface YxStoreCartService extends BaseService<YxStoreCart> {

    void removeUserCart(int uid, List<String> ids);

    void changeUserCartNum(int cartId,int cartNum,int uid);

    Map<String,Object> getUserProductCartList(int uid,String cartIds,int status);

    int getUserCartNum(int uid,String type,int numType);

    int addCart(int uid,int productId,int cartNum, String productAttrUnique,
                String type,int isNew,int combinationId,int seckillId,int bargainId);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxStoreCartQueryVo getYxStoreCartById(Serializable id);


}
