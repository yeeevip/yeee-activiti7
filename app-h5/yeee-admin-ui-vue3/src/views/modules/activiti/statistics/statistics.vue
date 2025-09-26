<template>
  <div class="mod-home">
    <div class="layuimini-main">

      <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md3">

          <div class="layui-card top-panel">
            <div class="layui-card-header">流程定义数</div>
            <div class="layui-card-body">
              <div class="layui-row layui-col-space5">
                <div class="layui-col-xs8 layui-col-md8 top-panel-number">
                  {{keyIndicators.definitionCount}}
                </div>
                <div class="layui-col-xs4 layui-col-md4 top-panel-tips">
                  <a style="color: #1aa094">今日新增{{keyIndicators.todayDefinitionCount}}</a><br>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="layui-col-xs12 layui-col-md3">

          <div class="layui-card top-panel">
            <div class="layui-card-header">流程实例数</div>
            <div class="layui-card-body">
              <div class="layui-row layui-col-space5">
                <div class="layui-col-xs8 layui-col-md8 top-panel-number">
                  {{keyIndicators.instanceCount}}
                </div>
                <div class="layui-col-xs4 layui-col-md4 top-panel-tips">
                  <a style="color: #1aa094">今日新增{{keyIndicators.todayInstanceCount}}</a><br>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="layui-col-xs12 layui-col-md3">

          <div class="layui-card top-panel">
            <div class="layui-card-header">任务数</div>
            <div class="layui-card-body">
              <div class="layui-row layui-col-space5">
                <div class="layui-col-xs8 layui-col-md8 top-panel-number">
                  {{keyIndicators.taskCount}}
                </div>
                <div class="layui-col-xs4 layui-col-md4 top-panel-tips">
                  <a style="color: #1aa094">今日新增{{keyIndicators.todayTaskCount}}</a><br>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="layui-col-xs12 layui-col-md3">

          <div class="layui-card top-panel">
            <div class="layui-card-header">用户数</div>
            <div class="layui-card-body">
              <div class="layui-row layui-col-space5">
                <div class="layui-col-xs8 layui-col-md8 top-panel-number">
                  {{keyIndicators.userCount}}
                </div>
                <div class="layui-col-xs4 layui-col-md4 top-panel-tips">
                  <a style="color: #1aa094">今日新增{{keyIndicators.todayUserCount}}</a><br>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

      <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md9">
          <div id="echarts-records" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
          <div id="echarts-pies" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
        </div>
      </div>


      <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md6">
          <div id="echarts-dataset" style="background-color:#ffffff;min-height:300px;padding: 10px"></div>
        </div>
        <div class="layui-col-xs12 layui-col-md6">
          <div id="echarts-map" style="background-color:#ffffff;min-height:300px;padding: 10px"></div>
        </div>
      </div>


    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      keyIndicators: {
        definitionCount: null,
        todayDefinitionCount: null,
        instanceCount: null,
        todayInstanceCount: null,
        taskCount: null,
        todayTaskCount: null,
        userCount: null,
        todayUserCount: null
      },
      // resize 处理器引用
      resizeHandler: null
    }
  },
  mounted () {
    this.getKeyIndicators()
    // 使用 nextTick 确保 DOM 已渲染完成
    this.$nextTick(() => {
      this.initCharts()
    })
  },
  
  // Vue 3 中推荐在 unmounted 中清理资源
  beforeUnmount() {
    // 清理 resize 监听器
    if (this.resizeHandler) {
      window.removeEventListener('resize', this.resizeHandler)
    }
    
    // 销毁图表实例
    const chartIds = ['echarts-records', 'echarts-pies', 'echarts-dataset', 'echarts-map']
    chartIds.forEach(id => {
      const element = document.getElementById(id)
      if (element && element._echarts_instance_) {
        element._echarts_instance_.dispose()
      }
    })
  },
  methods: {
    initCharts() {
      const _this = this;
      // 检查layui是否可用
      if (typeof layui === 'undefined') {
        console.error('layui is not loaded, retrying...')
        // 延迟重试
        setTimeout(() => {
          this.initCharts()
        }, 100)
        return
      }
      
      layui.use(['layer', 'echarts'], function () {
        const $ = layui.jquery,
          layer = layui.layer,
          echarts = layui.echarts;

        try {
          /**
           * 报表功能
           */
          const recordsElement = document.getElementById('echarts-records')
          if (recordsElement) {
            const echartsRecords = echarts.init(recordsElement, 'walden')
            _this.top5InstanceCountRecent7Day(echartsRecords)
          }

          /**
           * 玫瑰图表
           */
          const piesElement = document.getElementById('echarts-pies')
          if (piesElement) {
            const echartsPies = echarts.init(piesElement, 'walden')
            _this.top5InstanceCountTotal(echartsPies)
          }

          /**
           * 柱状图
           */
          const datasetElement = document.getElementById('echarts-dataset')
          if (datasetElement) {
            const echartsDataset = echarts.init(datasetElement, 'walden')
            _this.taskCountRecent3Day(echartsDataset)
          }

          /**
           * 过去7天任务创建和任务统计折线图
           */
          const mapElement = document.getElementById('echarts-map')
          if (mapElement) {
            const echartsline = echarts.init(mapElement, 'walden')
            _this.taskCountRecent7Day(echartsline)
          }

          // echarts 窗口缩放自适应 - 使用更安全的方式
          _this.setupChartResize()
        } catch (error) {
          console.error('初始化图表时出错:', error)
        }

      })
    },
    
    // 设置图表自适应
    setupChartResize() {
      // 移除之前的监听器（如果存在）
      if (this.resizeHandler) {
        window.removeEventListener('resize', this.resizeHandler)
      }
      
      // 创建新的监听器
      this.resizeHandler = () => {
        // 获取所有图表实例并调用resize
        const chartIds = ['echarts-records', 'echarts-pies', 'echarts-dataset', 'echarts-map']
        chartIds.forEach(id => {
          const element = document.getElementById(id)
          if (element && element._echarts_instance_) {
            element._echarts_instance_.resize()
          }
        })
      }
      
      window.addEventListener('resize', this.resizeHandler)
    },
    top5InstanceCountRecent7Day(echartsRecords) {
      this.$http.get('/activiti7/statistics/top5InstanceCountRecent7Day').then(({data: res}) => {
        if (res.code !== 200) {
          return this.$message.error(res.msg)
        }
        console.log(res)

        const data = res.data

        const optionRecords = {
          title: {
            text: '排名前5的流程部署产生的实例数'
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross',
              label: {
                backgroundColor: '#6a7985'
              }
            }
          },
          legend: {
            data: data.defNameList,
            top:30
          },
          toolbox: {
            feature: {
              saveAsImage: {}
            }
          },
          grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: [
            {
              type: 'category',
              boundaryGap: false,
              data: data.dateList
            }
          ],
          yAxis: [
            {
              type: 'value'
            }
          ],
          series: []
        };

        data.defNameList.forEach(defName => {
          optionRecords.series.push({
            name: defName,
            type: 'line',
            stack: '总量',
            label: {
              // normal: {
              //   show: true,
              //   position: 'top'
              // }
            },
            areaStyle: {},
            data: data.defDayCountMap[defName]
          })
        })

        echartsRecords.setOption(optionRecords);

      }).catch(() => {})
    },
    top5InstanceCountTotal(echartsPies) {
      this.$http.get('/activiti7/statistics/top5InstanceCountTotal').then(({data: res}) => {
        if (res.code !== 200) {
          return this.$message.error(res.msg)
        }
        console.log(res)

        const data = res.data

        const optionPies = {
          title: {
            text: '排名前五流程部署产生实例数',
            // left: 'center'
          },
          tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
          },
          legend: {
            // orient: 'vertical',
            x: 'center',
            data: data.defNameList,
            bottom:10
          },
          series: [
            {
              name: '实例数据',
              type: 'pie',
              radius: '46%',
              center: ['50%', '45%'],
              roseType: 'radius',
              labelLine:{
                length:5,
                length2:3
              },
              data: [],
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
        };

        data.defNameList.forEach(defName => {
          optionPies.series[0].data.push({value: data.defCountMap[defName], name: defName})
        })

        echartsPies.setOption(optionPies);

      }).catch(() => {})
    },
    taskCountRecent3Day(echartsDataset) {
      this.$http.get('/activiti7/statistics/taskCountRecent3Day').then(({data: res}) => {
        if (res.code !== 200) {
          return this.$message.error(res.msg)
        }
        console.log(res)

        const data = res.data

        const optionDataset = {
          legend: {
            data:["任务创建数","任务完成数"],
            top:20
          },
          tooltip: {},
          grid: {
            left: '30',
            right: '20',
            bottom: '30',
          },
          dataset: {
            dimensions: ['product', '任务创建数', '任务完成数'],
            source: []
          },
          xAxis: {type: 'category'},
          yAxis: {},
          // Declare several bar series, each will be mapped
          // to a column of dataset.source by default.
          series: [
            {type: 'bar'},
            {type: 'bar'}
          ]
        };

        data.dateList.forEach(date => {
          optionDataset.dataset.source.push({product: date, '任务创建数': data.taskCountMap[date].totalCount, '任务完成数': data.taskCountMap[date].completedCount})
        })

        echartsDataset.setOption(optionDataset);

      }).catch(() => {})
    },
    taskCountRecent7Day(echartsline) {
      this.$http.get('/activiti7/statistics/taskCountRecent7Day').then(({data: res}) => {
        if (res.code !== 200) {
          return this.$message.error(res.msg)
        }
        console.log(res)

        const data = res.data

        const option = {
          title: {
            text: '过去7天任务创建数和完成数统计'
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'shadow',
              label: {
                backgroundColor: '#6a7985'
              }
            }
          },
          legend: {
            data: ['任务创建数', '任务完成数'],
            top:30
          },
          toolbox: {
            feature: {
              saveAsImage: {}
            }
          },
          grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: [
            {
              type: 'category',
              boundaryGap: false,
              data: data.dateList
            }
          ],
          yAxis: [
            {
              type: 'value'
            }
          ],
          series: [
            {
              name: '任务创建数',
              type: 'line',
              stack: '总量',
              data: data.totalCountList
            },
            {
              name: '任务完成数',
              type: 'line',
              data: data.completedCountList
            },

          ]
        };

        echartsline.setOption(option);

      }).catch(() => {})
    },
    getKeyIndicators() {
      this.$http.get('/activiti7/statistics/keyIndicators').then(({data: res}) => {
        if (res.code !== 200) {
          return this.$message.error(res.msg)
        }
        console.log(res)
        this.keyIndicators = {
          ... res.data
        }
      }).catch(() => {})
    }
  },
}
</script>

<style>
.mod-home {
  line-height: 2;
}
.top-panel {
  border: 1px solid #eceff9;
  border-radius: 5px;
  text-align: center;
}
.top-panel > .layui-card-body{
  height: 60px;
}
.top-panel-number{
  line-height:60px;
  font-size: 30px;
  border-right:1px solid #eceff9;
}
.top-panel-tips{
  line-height:60px;
  font-size: 12px
}
.layui-card-header{
  font-size: 16px;
  font-weight: bold;
}
</style>

