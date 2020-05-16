/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.tools.domain;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/

@Data
@TableName("alipay_config")
public class AlipayConfig implements Serializable {

    /** 主键 */
    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
   // @Column(name = "id")
    private Long id;


    /** 应用ID */
   // @Column(name = "app_id")
    private String appId;


    /** 编码 */
   // @Column(name = "charset")
    private String charset;


    /** 类型 固定格式json */
   // @Column(name = "format")
    private String format;


    /** 网关地址 */
   // @Column(name = "gateway_url")
    private String gatewayUrl;


    /** 异步回调 */
   // @Column(name = "notify_url")
    private String notifyUrl;


    /** 私钥 */
   // @Column(name = "private_key")
    private String privateKey;


    /** 公钥 */
   // @Column(name = "public_key")
    private String publicKey;


    /** 回调地址 */
   // @Column(name = "return_url")
    private String returnUrl;


    /** 签名方式 */
   // @Column(name = "sign_type")
    private String signType;


    /** 商户号 */
   // @Column(name = "sys_service_provider_id")
    private String sysServiceProviderId;


    public void copy(AlipayConfig source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
