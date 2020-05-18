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
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
public class QiniuContentDto implements Serializable {

    /** ID */
    private Long id;

    /** Bucket 识别符 */
    private String bucket;

    /** 文件名称 */
    private String name;

    /** 文件大小 */
    private String size;

    /** 文件类型：私有或公开 */
    private String type;

    /** 上传或同步的时间 */
    private Timestamp updateTime;

    /** 文件url */
    private String url;

    private String suffix;

    public String getKey(){
        return this.name;
    }
}
