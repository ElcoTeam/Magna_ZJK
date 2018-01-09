<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="MaterialsortprintingCDDY.aspx.cs" Inherits="website.SortManagent.MaterialsortprintingCDDY"  ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<%--<link href="/css/foundation.css" rel="stylesheet" type="text/css" />--%>
	<%--<script src="/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>--%>
	<script>document.write(" <link href='/css/foundation.css?rnd= " + Math.random() + "' rel='stylesheet' type='text/css'>");</script>
	<%--<script src="/js/jquery-easyui-1.4.3/datagrid-dnd.js"></script>--%>
	<%--<script src="/js/jquery-easyui-1.4.3/jquery.edatagrid.js"></script>--%>
	<%--<link href="/js/uploadify/uploadify.css" rel="stylesheet" />
    <script src="/js/uploadify/jquery.uploadify.min.js"></script>--%>

	<style>
        /*功能按钮*/
	    .fbtn {            
            color: #fff;
            text-shadow: 0 -1px 0 rgba(0,0,0,0.25);
            background-color: #006dcc;
            background-repeat: repeat-x;
            border-color: #04c #04c #002a80;
            display: inline-block;
            padding: 0px 12px;
            margin-bottom: 0;
	    }
		#w td {
			padding: 5px 5px;
			text-align: left;
			vertical-align: middle;
		}

		#w .title {
			vertical-align: middle;
			text-align: right;
			width: 80px;
			background-color: #f9f9f9;
		}


		td.err-OK {
            text-align:center;
			height:80px;
			/*background:#4e976a;*/
		}
        /*超时*/
		td.err-1 {
            text-align:center;
			height:80px;
			background:#f9f9f9;   /*黄色*/
		}
        /*生产                   ***************/
		td.err-2 {
            text-align:center;
			height:80px;
			background:#995AB6;   /*紫色*/
		}
        /*维修*/
		td.err-3 {
            text-align:center;
			height:80px;
			background:#606CC5; /*蓝色*/
		}
        /*质量*/
		td.err-4 {
            text-align:center;
			height:80px;
			background:#FFC42E;
		}
        /*物料*/   /*灰色*/
		td.err-5 {
            text-align:center;
			height:80px;
			background:#9FB6CD;
		}
        /*急停*/
		td.err-6 {    
            text-align:center;
			height:80px;
			background:#FF0012;  /*红色*/
		}
	    #tb tbody td {
            text-align:center;
            font-size:38px;
	    }
	</style>
            <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" >
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../bootstrap/jqPaginator.js"></script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    
   
  
  <script src="~/FELib/Jquery-plugins/jquery.printElement.js"></script>
<script language="javascript" type="text/javascript" src="~/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<div class="widget-content">
    <h2>插单打印</h2>
    <hr />

    

   

        <div class="widget-content">

            <h4>车身号：<%=csh %></h4>
            <h4>车&nbsp;&nbsp;型：<%=cx %></h4>
            <hr />
            <label>排序单号：<%=ewm %></label>
            <img src="../zxing?id=<%=ewm %>" />
            <hr />
            <div>
                <a class="btn btn-primary"  href="javascript:history.go(-1)">返回</a>
                <a class="btn btn-primary" id="print" href="javascript:printtest('@Model.orderno','@Model.erweima')">手动打印</a>
                <a class="btn btn-danger" id="send" href="javascript:sendtest('@Model.orderno','@Model.erweima')">手动下发</a>
            </div>
            <br />
           
              <!-- 数据表格  -->
    <table id="tb" title="物料排序单参数配置" style="width: 99%;">
    </table>
     

            <table class="table table-bordered  table-striped aa table-hover">
                <tr>
                    <th>序号</th>
                    <th>物料货架名称</th>
                    <th>对应物料类型</th>
                    <th>数量</th>
                </tr>
                
                    <tr>
                        <td>@(Model.GetIndexes.pro.IndexOf(item) + 1)</td>
                      
                            <td>@item.零件号描述@item.主副驾</td>
                            <td>@item.零件号</td>
                      
                            <td>@item.零件号描述</td>
                            <td>@item.零件号</td>
                       

                        <td>1</td>
                    </tr>
                }

            </table>
          
                <div class="pager">
                    @Html.PageLink(Model.GetIndexes.PagingInfo, s => Url.Action("CDDY", new { id2 = Model.GetIndexes.pro[0].订单号, Page = s, er = Model.erweima })) &nbsp;
                </div>
           

        </div>
    

     
    <script>
        function printtest(zfj, zxing) {

            var postdata = {
                id: zfj,
                erweima: zxing,
                iscd: true
            }


            $.post("/Materialsortprinting/printtestforcd", postdata, function (data) {
                alert(data);
            })
        }
        function sendtest(orderno, zxing) {
            var postdata = {
                id: orderno,
                erweima: zxing

            }



            $.post("/Materialsortprinting/sendtestforcd", postdata, function (data) {
                alert(data);
            })
        }
    </script>


</div>

   

    
</asp:Content>

