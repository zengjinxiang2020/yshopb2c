/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.tools.service.dto;

import lombok.Data;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
public class QiniuConfigDto implements Serializable {

    /** ID */
    private Long id;

    /** accessKey */
    private String accessKey;

    /** Bucket 识别符 */
    private String bucket;

    /** 外链域名 */
    private String host;

    /** secretKey */
    private String secretKey;

    /** 空间类型 */
    private String type;

    /** 机房 */
    private String zone;
}
