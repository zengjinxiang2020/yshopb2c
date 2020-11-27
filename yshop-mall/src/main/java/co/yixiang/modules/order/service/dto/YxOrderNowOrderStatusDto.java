package co.yixiang.modules.order.service.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ：LionCity
 * @date ：Created in 2020-05-29 11:16
 * @description：
 * @modified By：
 * @version:
 */
@Data
public class YxOrderNowOrderStatusDto implements Serializable {
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8"
    )
    private Date cache_key_create_order;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8"
    )
    private Date pay_success;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8"
    )
    private Date delivery_goods;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8"
    )
    private Date order_verific;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8"
    )
    private Date user_take_delivery;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8"
    )
    private Date check_order_over;
    private int size;
}
