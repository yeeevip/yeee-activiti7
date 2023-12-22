<template>
  <div class="mod-instance">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="listData()">
      <el-form-item>
        <el-button size="small" @click="listData()">刷新列表</el-button>
        <el-button size="small" type="danger" @click="delHandle()" :disabled="dataListSelections.length <= 0">删除</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="dataList" border stripe v-loading="dataListLoading" :max-height="tableHeight"
            @selection-change="selectionChangeHandle" @sort-change="sortChangeHandle" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="id" label="ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="name" label="实例名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="startDate" label="实例创建时间" header-align="center" align="center"></el-table-column>
      <el-table-column prop="processDefinitionId" label="流程定义ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="processDefinitionKey" label="流程定义KEY" header-align="center" align="center"></el-table-column>
      <el-table-column prop="processDefinitionVersion" label="版本" header-align="center" align="center"></el-table-column>
      <el-table-column label="操作" fixed="right" header-align="center" align="center" width="100">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="delHandle(scope.row.id)" icon="el-icon-delete" title="删除"></el-button>
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
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>

<script>
  import grid from '@/mixins/grid'
  import * as index from '@/utils/index'
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/instance/list',
          delUrl: null
        },
        dataForm: {}
      }
    },
    methods: {
    },
    components: {
    }
  }
</script>
