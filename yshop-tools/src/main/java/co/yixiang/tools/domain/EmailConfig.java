package co.yixiang.tools.domain;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Entity
@Data
@Table(name="email_config")
public class EmailConfig implements Serializable {

    /** ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;


    /** 收件人 */
    @Column(name = "from_user")
    private String fromUser;


    /** 邮件服务器SMTP地址 */
    @Column(name = "host")
    private String host;


    /** 密码 */
    @Column(name = "pass")
    private String pass;


    /** 端口 */
    @Column(name = "port")
    private String port;


    /** 发件者用户名 */
    @Column(name = "user")
    private String user;


    public void copy(EmailConfig source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
