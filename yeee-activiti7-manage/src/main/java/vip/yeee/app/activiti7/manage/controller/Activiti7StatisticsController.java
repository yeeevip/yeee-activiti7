package vip.yeee.app.activiti7.manage.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vip.yeee.app.activiti7.manage.biz.Activiti7StatisticsBiz;
import vip.yeee.app.activiti7.manage.model.KeyIndicatorsVo;
import vip.yeee.app.activiti7.manage.model.TaskCountRecent3DayVo;
import vip.yeee.app.activiti7.manage.model.TaskCountRecent7DayVo;
import vip.yeee.app.activiti7.manage.model.Top5InstanceCountRecent7DayVo;
import vip.yeee.app.activiti7.manage.model.Top5InstanceCountTotalVo;
import vip.yeee.memo.base.model.rest.CommonResult;

import javax.annotation.Resource;

/**
 * description......
 *
 * @author https://www.yeee.vip
 * @since 2022/4/29 18:12
 */
@Api(tags = "工作流-首页图标统计")
@RequiredArgsConstructor
@RequestMapping("/activiti7/statistics")
@RestController
public class Activiti7StatisticsController {

    @Resource
    private Activiti7StatisticsBiz activiti7StatisticsBiz;

    @ApiOperation("关键指标")
    @GetMapping(value = "/keyIndicators")
    public CommonResult<KeyIndicatorsVo> getKeyIndicators() {
        return CommonResult.success(activiti7StatisticsBiz.getKeyIndicators());
    }

    @ApiOperation("TOP5流程产生是实例数-近7天")
    @GetMapping(value = "/top5InstanceCountRecent7Day")
    public CommonResult<Top5InstanceCountRecent7DayVo> getTop5InstanceCountRecent7Day() {
        return CommonResult.success(activiti7StatisticsBiz.getTop5InstanceCountRecent7Day());
    }

    @ApiOperation("TOP5流程产生是实例数-总计")
    @GetMapping(value = "/top5InstanceCountTotal")
    public CommonResult<Top5InstanceCountTotalVo> getTop5InstanceCountTotal() {
        return CommonResult.success(activiti7StatisticsBiz.getTop5InstanceCountTotal());
    }

    @ApiOperation("任务数统计-近三天")
    @GetMapping(value = "/taskCountRecent3Day")
    public CommonResult<TaskCountRecent3DayVo> getTaskCountRecent3Day() {
        return CommonResult.success(activiti7StatisticsBiz.getTaskCountRecent3Day());
    }

    @ApiOperation("任务数统计-近7天")
    @GetMapping(value = "/taskCountRecent7Day")
    public CommonResult<TaskCountRecent7DayVo> getTaskCountRecent7Day() {
        return CommonResult.success(activiti7StatisticsBiz.getTaskCountRecent7Day());
    }

}
