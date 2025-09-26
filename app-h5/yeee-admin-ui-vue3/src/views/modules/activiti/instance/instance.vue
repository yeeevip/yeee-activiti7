<template>
  <div class="mod-instance">
    <el-form :inline="true" :model="dataForm" @keyup.enter="listData()">
      <el-form-item>
        <el-button size="default" @click="listData()">查询</el-button>
        <el-button size="default" type="danger" @click="delHandle()" :disabled="dataListSelections.length <= 0">删除</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="dataList" border stripe v-loading="dataListLoading" :max-height="tableHeight"
            @selection-change="selectionChangeHandle" @sort-change="sortChangeHandle" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="id" label="ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="processDefinitionKey" label="流程定义KEY" header-align="center" align="center"></el-table-column>
      <el-table-column prop="definitionName" label="流程定义名称" header-align="center" align="center"></el-table-column>
<!--      <el-table-column prop="name" label="实例名称" header-align="center" align="center"></el-table-column>-->
      <el-table-column prop="startDate" label="实例创建时间" header-align="center" align="center"></el-table-column>
      <el-table-column prop="status" label="状态" header-align="center" align="center"></el-table-column>
<!--      <el-table-column prop="processDefinitionVersion" label="版本" header-align="center" align="center"></el-table-column>-->
      <el-table-column prop="curTask" label="当前任务" header-align="center" align="center"></el-table-column>
      <el-table-column label="操作" fixed="right" header-align="center" align="center" width="150">
        <template #default="scope">
          <el-button v-if="scope.row.status === 'RUNNING'" type="text" size="small" @click="suspendHandle(scope.row.id)" :icon="VideoPause" title="暂停"></el-button>
          <el-button v-if="scope.row.status === 'SUSPENDED'" type="text" size="small" @click="resumeHandle(scope.row.id)" :icon="VideoPlay" title="唤醒"></el-button>
          <el-button type="text" size="small" @click="lookBpmn(scope.row.deploymentId, scope.row.resourceName, scope.row.id)" :icon="Document" title="查看"></el-button>
          <el-button type="text" size="small" @click="delHandle(scope.row.id)" :icon="Delete" title="删除"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination v-if="this.gridOptions.isPage"
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageNo"
      :page-sizes="pageSizes"
      :page-size="pageSize"
      :total="total"
      layout="->, total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>

<script>
  import grid from '@/mixins/grid'
  import * as index from "@/utils";
  import { Document, Delete, VideoPause, VideoPlay } from '@element-plus/icons-vue'
  import { markRaw } from 'vue'
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/instance/list',
          delUrl: '/activiti7/instance/delete'
        },
        dataForm: {},
        // 图标组件（使用 markRaw 避免响应式包装）
        Document: markRaw(Document),
        Delete: markRaw(Delete),
        VideoPause: markRaw(VideoPause),
        VideoPlay: markRaw(VideoPlay)
      }
    },
    methods: {
      suspendHandle (insId) {
        this.$http.get('/activiti7/instance/suspend?instanceId=' + insId).then(({data: res}) => {
          if (res.code !== 200) {
            return this.$message.error(res.msg)
          }
          this.$message({
            message: '操作成功',
            type: 'success',
            duration: 500,
            onClose: () => {
              this.listData()
            }
          })
        }).catch(() => {})
      },
      resumeHandle (insId) {
        this.$http.get('/activiti7/instance/resume?instanceId=' + insId).then(({data: res}) => {
          if (res.code !== 200) {
            return this.$message.error(res.msg)
          }
          this.$message({
            message: '操作成功',
            type: 'success',
            duration: 500,
            onClose: () => {
              this.listData()
            }
          })
        }).catch(() => {})
      },
      lookBpmn (depId, rName, instanceId) {
        let api = index.baseUrl2()
        let token = localStorage.getItem('yeee-manageweb-token')
        window.open(api + 'activiti-editor/index.html?type=lookBpmn&deploymentFileUUID=' + depId + '&deploymentName=' + rName+ '&instanceId=' + instanceId + '&tt=' + token, '_blank')
      }
    },
    components: {
    }
  }
</script>
