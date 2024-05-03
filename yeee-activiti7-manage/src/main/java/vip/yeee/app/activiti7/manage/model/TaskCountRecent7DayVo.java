package vip.yeee.app.activiti7.manage.model;

import lombok.Data;

import java.util.List;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/5/1 18:36
 */
@Data
public class TaskCountRecent7DayVo {

    private List<String> dateList;

    private List<Object> totalCountList;

    private List<Object> completedCountList;
}
