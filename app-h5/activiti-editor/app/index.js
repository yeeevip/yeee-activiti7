
import $ from 'jquery';
import BpmnModeler from 'bpmn-js/lib/Modeler';
//import propertiesPanelModule from '../resources/properties-panel';
import propertiesPanelModule from 'bpmn-js-properties-panel';
import propertiesProviderModule from '../resources/properties-panel/provider/activiti';
import activitiModdleDescriptor from '../resources/activiti.json';
import customTranslate from '../resources/customTranslate/customTranslate';
import customControlsModule from '../resources/customControls';
import tools from '../resources/tools'
import diagramXML from '../resources/newDiagram.bpmn';
const proHost = window.location.protocol + "//" + window.location.host;
const href = window.location.href.split("activiti-editor")[0];
const key = href.split(window.location.host)[1];
const publicurl = proHost + key;

// 添加翻译组件
var customTranslateModule = {
    translate: ['value', customTranslate]
};
var container = $('#js-drop-zone');
var canvas = $('#js-canvas');
var bpmnModeler = new BpmnModeler({
    container: canvas, // 渲染容器
    propertiesPanel: { // 右侧元素属性编辑栏
        parent: '#js-properties-panel'
    },
    additionalModules: [ // 自定义且与默认扩展包一起使用的模块列表
        propertiesPanelModule,
        propertiesProviderModule,
        customControlsModule,
        customTranslateModule // 汉化包
    ],
    moddleExtensions: { // 需要用到的扩展包
        activiti:activitiModdleDescriptor
    }
});
container.removeClass('with-diagram');
// 判断浏览器支持程度
if (!window.FileList || !window.FileReader) {
    window.alert('请使用谷歌、火狐、IE10+浏览器');
} else {
    tools.registerFileDrop(container, tools.createDiagram(diagramXML, bpmnModeler, container));
}


$(function () {
    // 创建bpmn
    var param = tools.getUrlParam(window.location.href)
        $('.item').show()
    if (param.type === 'addBpmn') {
        // 通过xml创建bpmn
        tools.createDiagram(diagramXML, bpmnModeler, container);
    } else if (param.type === 'lookBpmn') { //编辑bpmn
        $('.item').hide()
        $('.download').show()
        const Id = param.deploymentFileUUID || '6d4af2dc-bab0-11ea-b584-3cf011eaafca'
        const Name=param.deploymentName || 'String.bpmn'
        const instanceId=param.instanceId
        var param={
            "deploymentId":Id,
            "resourceName":decodeURI(Name)
        }
        if(instanceId){
            var param1={
                instanceId
            }
            $.ajax({
                url: publicurl+'activitiHistory/gethighLine',
                type: 'GET',
                data: param1,
                dataType:'json',
                success: function (result) {
                  var ColorJson=tools.getByColor(result.obj)
                    $.ajax({
                        url: publicurl+'processDefinition/getDefinitionXML',
                        type: 'GET',
                        data: param,
                        dataType:'text',
                        success: function (result) {
                            var newXmlData = result
                            tools.createDiagram(newXmlData, bpmnModeler, container);
                            setTimeout(function () {
                                for (var i in ColorJson) {
                                    tools.setColor(ColorJson[i],bpmnModeler)
                                }
                            }, 200)
                        },
                        error: function (err) {
                            console.log(err)
                        }
                    });
                },
                error: function (err) {
                    console.log(err)
                }
            });
        }else{
            //加载后台方法获取xml
            $.ajax({
                url: publicurl+'activiti7/definition/xml',
                type: 'GET',
                data: param,
                headers: {
                    "Authorization": 'Bearer ' + tools.getUrlParam(window.location.href).tt
                },
                dataType:'text',
                success: function (result) {
                    var newXmlData = result
                    tools.createDiagram(newXmlData, bpmnModeler, container);
                },
                error: function (err) {
                    console.log(err)
                }
            });
        }
    } else if(param.type === "historyBpmn") { // bpmn历史
        $('.item').hide()
        $('.download').show()
    }
    // 点击新增
    $('#js-download-diagram').on("click", function () {
       tools.syopen('alert')
    })

    // 点击取消
    $('.cancel').on("click",function () {
        tools.syhide('alert')
    })
    // 点击确定
    $('#sure').on('click',function(){
       // const text=$("#deploymentName").val()
        tools.saveBpmn(bpmnModeler)
    })



    // 点击下载
    $("#downloadBpmn").on("click", function () {
        tools.downLoad(bpmnModeler)
    })
    // 点击上传
    $("#uploadFile").on("change", function () {
        // tools.upload(bpmnModeler,container)

        var uploadFile = document.myForm.uploadFile.files[0];
        var reader = new FileReader();
        reader.onload = function(event) {
            var newXmlData = event.target.result;
            tools.createDiagram(newXmlData, bpmnModeler, container);
        };
        reader.readAsText(uploadFile);
    })

    // 表单中的操作按钮
    $(".bpp-properties-panel").on("click", "#entry-button-click", function() {
        console.log($(".bpp-properties-panel").find('#activiti-id').val());
        sessionStorage.setItem('taskID', $(".bpp-properties-panel").find('#activiti-id').val());
        window.open('http://localhost:8086/#/formTab?taskID=' + $(".bpp-properties-panel").find('#activiti-id').val() + '&typ=add');
        // $(".bpmn-modal").show();
        // setTimeout(function() {
        //     var iframeWindow = document.getElementById('Dynamic-form').contentWindow
        //     iframeWindow.addEventListener('message', function(e) {
        //         alert(e)
        //     }, false)
        // }, 1000)
    })
    //

});
function closeModal() {
    $(".bpmn-modal").hide();
}
