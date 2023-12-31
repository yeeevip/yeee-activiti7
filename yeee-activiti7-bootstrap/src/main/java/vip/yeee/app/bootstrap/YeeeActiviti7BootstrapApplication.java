package vip.yeee.app.bootstrap;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@MapperScan({"vip.yeee.app.sys.manage.domain.mysql.mapper"
        , "vip.yeee.app.blog.manage.domain.mysql.mapper"
        , "vip.yeee.app.blog.client.domain.mysql.mapper"})
@ComponentScan({"vip.yeee.app"})
public class YeeeActiviti7BootstrapApplication {

    public static void main(String[] args) {
        SpringApplication.run(YeeeActiviti7BootstrapApplication.class, args);
    }

}
