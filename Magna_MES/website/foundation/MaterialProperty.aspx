<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" Inherits="website.foundation.MaterialProperty" ValidateRequest="false" Codebehind="MaterialProperty.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/js/uploadify/uploadify.css" rel="stylesheet" />
    <%--防止浏览器CSS缓存，JS也可用--%>
    <script>document.write(" <link href='/css/foundation.css?rnd= " + Math.random() + "' rel='stylesheet' type='text/css'>");</script>
    <%--<link href="/css/foundation.css" rel="stylesheet" type="text/css" />--%>
    <script src="/js/uploadify/jquery.uploadify.min.js"></script>
    <style>
        .uploadify-progress { visibility: hidden; }
        .uploadify-queue { visibility: hidden; }
        #uploadify-queue { visibility: hidden; height: 0px; width: 0px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="top">
        <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td><span class="title">零件配置</span>
                    <select id="fl_id_s" class="easyui-combobox" style="width: 200px; height: 25px;padding-left:15px;"
                        data-options="valueField: 'ID',textField: 'Prop_Type'">
                    </select>                  
                </td>
                <td style="width: 120px">
                    <a class="topaddBtn">新增类型</a>
                </td>
                <td style="width: 120px">
                    <a class="toppenBtn">编辑所选</a>
                </td>
                <td style="width: 120px">
                    <a class="topdelBtn">删除所选</a>
                </td>
            </tr>
        </table>
    </div>

    <!-- 数据表格  -->
    <table id="tb" title="零件类型列表" style="width: 99%;">
    </table>
    <!-- 编辑窗口 -->
    <div id="w" style="padding: 10px; visibility: hidden" title="零件类型编辑">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">
                </td>
                <td>
                    <input id="prop_id" type="text" class="text" style="width: 230px;" />
                </td>
            </tr>
            <tr>
                <td class="title">
                    <p>
                        零件类型名称：
                    </p>
                </td>
                <td>
                    <input id="prop_name" type="text" class="text" style="width: 230px;" />
                </td>
            </tr>
        </table>
    </div>
    <!-- 编辑窗口 - footer -->
    <div id="ft" style="padding: 10px; text-align: center; background-color: #f9f9f9; visibility:hidden">
        <img src="/image/admin/loading-ring.gif" class="loadinggif" id="loadinggif" /><a
            class="saveBtn" id="saveBtn">保存</a>
    </div>
    <div id="dlg" class="easyui-dialog" title="删除确认" style="width:150px;height:150px;padding:10px" 
			data-options="
				iconCls: 'icon-del',
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						deleteInfos();
                        $('#dlg').dialog('close');
					}
				},{
					text:'Cancel',
					handler:function(){
						 $('#dlg').dialog('close');
					}
				}]
			">
		是否确认永久删除该行信息！
	</div>
    <object classid="clsid:730BF2F0-EAE2-46C5-BA06-5ABFC9AB8A0A" width="0" height="0" align="center" codebase="zx_32.CAB#version=1,0,0,3" id="CZx_32Ctrl" hspace="0" vspace="0"></object>
    <script>

        /****************       全局变量          ***************/
        var dg = $('#tb');      //表格
        var isEdit = false;     //是否为编辑状态

       
        /****************       DOM加载          ***************/
        $(function () {
            $.ajaxSetup({
                cache: false //关闭AJAX缓存
            });
            //新增按钮点击
            $('.topaddBtn').first().click(function () {
                isEdit = false;
                $('#prop_id').hide();
                $('#w').window('open');
            });

            //编辑按钮点击
            $('.toppenBtn').first().click(function () {
                isEdit = true;
                initEidtWidget();
            });


            //删除按钮
            $('.topdelBtn').first().click(function (e) {
                $('#dlg').dialog('open');
                //if (confirm("删除是不可恢复的，你确认要删除吗？")) {
                //   
                //}
            });
          
            $("#fl_id_s").combobox({
                onChange: function (n, o) {
                    dg = $('#tb').datagrid({
                        url: "/HttpHandlers/MaterialPropertyHandler.ashx?method=queryMaterialPropertyList&id=" + n,
                        rownumbers: true,
                        pagination: true,
                        pageSize: 20,
                        rownumbers: true,
                        singleSelect: true,
                        collapsible: false,
                        striped: true,
                        fitColumns: true,
                        emptyMsg: "<span>没有找到相关记录</span>",
                        columns: [[
                              { field: 'prop_id', title: '类型id', hidden: true, align: "center" },
                              { field: 'prop_name', title: '类型名称', width: 100, hidden: false, align: "center" },
                        ]]
                    });
                    //数据列表分页
                    dg.datagrid('getPager').pagination({
                        pageList: [1, 5, 10, 15, 20],
                        layout: ['list', 'sep', 'first', 'prev', 'sep', 'links', 'sep', 'next', 'last', 'sep', 'refresh']
                    });
                   

                }
            });

            $('#dlg').dialog('close');


            //保存按钮
            $('#saveBtn').bind('click', function () {
                saveMaterialProperty();
            });


            //编辑窗口加载
            $('#w').window({
                modal: true,
                closed: true,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                width: 530,
                height: 580,
                footer: '#ft',
                top: 20,
                onBeforeClose: function () { clearw(); },
                onBeforeOpen: function () { $('#w').css('visibility', 'visible'); $('#ft').css('visibility', 'visible'); }
            });

            reloadfl_ids();
            //数据列表加载
            dg = $('#tb').datagrid({
                url: "/HttpHandlers/MaterialPropertyHandler.ashx?method=queryMaterialPropertyList&id=1",
                rownumbers: true,
                pagination: true,
                pageSize: 20,
                rownumbers: true,
                singleSelect: true,
                collapsible: false,
                striped: true,
                fitColumns: true,
                emptyMsg: "<span>没有找到相关记录</span>",
                columns: [[
                      { field: 'prop_id', title: '类型id', hidden: true, align:"center" },
                      { field: 'prop_name', title: '类型名称', width: 100, hidden: false, align: "center" },
                ]]
            });
            //数据列表分页
            dg.datagrid('getPager').pagination({
                pageList: [1, 5, 10, 15, 20],
                layout: ['list', 'sep', 'first', 'prev', 'sep', 'links', 'sep', 'next', 'last', 'sep', 'refresh']
            });

        });



       

        /****************       主要业务程序          ***************/
       
        //新增 / 编辑  
        function saveMaterialProperty() {

            var prop_id = $("#prop_id").val();
            var prop_name = $("#prop_name").val();
            var prop_type = "1";
            saveMaterialProperty_2(prop_id, prop_name, prop_type);

        }
        function saveMaterialProperty_2(prop_id, prop_name, prop_type) {
            $.ajax({
                type: "POST",
                async: false,
                url: "/HttpHandlers/MaterialPropertyHandler.ashx?method=saveMaterialProperty",
                data: { "prop_id": prop_id, "prop_name": prop_name, "prop_type": prop_type },
                success: function (data) {
                    if (data == 'true') {
                        alert('已保存');
                        dg.datagrid('reload');
                    }
                    else alert('保存失败');
                    $('#w').window('close');
                },
                error: function () {

                }
            });
        }

       
        function reloadfl_ids() {
           
            $('#fl_id_s').combobox('reload', '/HttpHandlers/MaterialPropertyHandler.ashx?method=queryMaterialPropertyTypeForEditing');
           
        }


        //编辑时加载窗体数据
        function initEidtWidget() {
            var selRows = dg.datagrid('getSelections');
            if (selRows.length > 1) {
                alert('每次只能编辑一条记录，请重新选取');
                return;
            } else if (selRows.length == 0) {
                alert('请选择一条记录进行编辑');
                return;
            }

            //窗体数据初始化
            $('#prop_id').val(selRows[0].prop_id);
            $('#prop_name').val(selRows[0].prop_name);
            $('#prop_id').hide();
            $('#w').window('open');
        }
        function deleteInfos() {
            //if (event.srcElement.outerText == "删除") {
               // event.returnValue = confirm("删除是不可恢复的，你确认要删除吗？");
          //  }
            var selRows = dg.datagrid('getSelections');
            if (selRows.length > 1) {
                alert('每次只能删除一条记录，请重新选取');
                return;
            } else if (selRows.length == 0) {
                alert('请选择一条记录进行删除');
                return;
            }          
            var row = selRows[0];
            $.ajax({
                url: "/HttpHandlers/MaterialPropertyHandler.ashx",
                data: encodeURI("prop_id=" + row.prop_id + "&method=deleteMaterialProperty"),
                async: false,
                success: function (data) {
                    if (data == 'true') {
                        alert('已删除');
                        dg.datagrid('reload');
                    }
                    else alert('删除失败');
                },
                error: function () {
                }
            });
        }

        /**********************************************/
        /*****************   窗体程序 *******************/
        /**********************************************/

        //编辑窗口关闭清空数据
        function clearw() {
            $('#prop_id').val('');
            $('#prop_name').val('');
        }
        
    </script>
</asp:Content>
