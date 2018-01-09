using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminCMS_AdminIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //this.Literal1.Text = "服务器地址: " + Request.ServerVariables.Get("Remote_Host").ToString() + "<br/><br/>"
            //+ "浏览器: " + Request.Browser.Browser + "<br/><br/>"
            //+ "浏览器版本号: " + Request.Browser.MajorVersion + "<br/><br/>"
            //+ "客户端平台: " + Request.Browser.Platform + "<br/><br/>"
            //+ "服务器ip: " + Request.ServerVariables.Get("Local_Addr").ToString() + "<br/><br/>"
            //+ "服务器名： " + Request.ServerVariables.Get("Server_Name").ToString() + "<br/><br/>"
            //+ "服务器地址： " + Request.ServerVariables["Url"].ToString() + "<br/><br/>"
            //+ "客户端提供的路径信息： " + Request.ServerVariables["Path_Info"].ToString() + "<br/><br/>"
            //+ "与应用程序元数据库路径相应的物理路径： " + Request.ServerVariables["Appl_Physical_Path"].ToString() + "<br/><br/>"
            //+ "通过由虚拟至物理的映射后得到的路径： " + Request.ServerVariables["Path_Translated"].ToString() + "<br/><br/>"
            //+ "执行脚本的名称： " + Request.ServerVariables["Script_Name"].ToString() + "<br/><br/>"
            //+ "接受请求的服务器端口号： " + Request.ServerVariables["Server_Port"].ToString() + "<br/><br/>"
            //+ "发出请求的远程主机的IP地址： " + Request.ServerVariables["Remote_Addr"].ToString() + "<br/><br/>"
            //+ "发出请求的远程主机名称IP地址： " + Request.ServerVariables["Remote_Host"].ToString() + "<br/><br/>"
            //+ "返回接受请求的服务器地址IP地址： " + Request.ServerVariables["Local_Addr"].ToString() + "<br/><br/>"
            //+ "返回服务器地址IP地址： " + Request.ServerVariables["Http_Host"].ToString() + "<br/><br/>"
            //+ "服务器的主机名、DNS地址或IP地址： " + Request.ServerVariables["Server_Name"].ToString() + "<br/><br/>"
            //+ "提出请求的方法比如GET、HEAD、POST等等： " + Request.ServerVariables["Request_Method"].ToString() + "<br/><br/>"
            //+ "如果接受请求的服务器端口为安全端口时，则为1，否则为0： " + Request.ServerVariables["Server_Port_Secure"].ToString() + "<br/><br/>"
            //+ "服务器使用的协议的名称和版本： " + Request.ServerVariables["Server_Protocol"].ToString() + "<br/><br/>"
            //+ "应答请求并运行网关的服务器软件的名称和版本： " + Request.ServerVariables["Server_Software"].ToString() + "<br/><br/>"
            //;


            if (Request.Cookies["admininfo"] != null)
            {
                this.namelit.Text = Request.Cookies["admininfo"]["name"];
                this.tellit.Text = HttpUtility.UrlDecode(Request.Cookies["admininfo"]["user_posiid_name"]);
            }


            //SetttingMenu();


        }
    }








    string sq = @"  SELECT  TOP (100) PERCENT CONVERT(int, CustomerOrder.OrderID) AS ID, CONVERT(int, p.ID) AS PartOrderID, 
                   CONVERT(nvarchar, CustomerOrder.OrderID) AS 订单号, CustomerOrder.SerialNumber AS 车身号, 
                   CustomerOrder.OrderType, CustomerOrder.OrderState, CustomerOrder.StartTime AS co_starttime, 
                   p.OrderType AS mg_partorder_ordertype, CustomerOrder.EndTime AS co_endtime, p.CustomerProductID, 
                   CONVERT(nvarchar, p.PartID) AS 大部件号, p.OrderType AS Expr1, p.CompletionState, 
                   (CASE WHEN (pro.ProductType = '1') THEN '主驾' WHEN (pro.ProductType = '2') 
                   THEN '副驾' WHEN (pro.ProductType = '3' AND dbo.mg_Property.prop_name = 'RSB40') 
                   THEN '后40' WHEN (pro.ProductType = '3' AND dbo.mg_Property.prop_name = 'RSB60') 
                   THEN '后60' WHEN (pro.ProductType = '3' AND dbo.mg_Property.prop_name = 'RSC') THEN '后坐垫' ELSE '健康大使' END) 
                   AS 主副驾, bom.bom_PN AS 零件号, bom.bom_descCH AS 零件号描述, LEFT(pro.ProductName, CHARINDEX('-', 
                   pro.ProductName) - 1) AS 等级, CONVERT(nvarchar, p.OrderIsPrintSYS) AS IsPrint, dbo.Mg_Property.prop_name, 
                   p.OrderPrintTime, CustomerOrder.OrderIsHistory
FROM      dbo.Mg_CustomerOrder_3 AS CustomerOrder INNER JOIN
                   dbo.Mg_Customer_Product AS Customer_Product ON 
                   CustomerOrder.OrderID = Customer_Product.CustomerOrderID INNER JOIN
                   dbo.Mg_PartOrder AS p ON Customer_Product.ID = p.CustomerProductID INNER JOIN
                   dbo.Mg_Product AS pro ON Customer_Product.ProductID = pro.ID INNER JOIN
                   dbo.Mg_part AS part ON p.PartID = part.part_id INNER JOIN
                   dbo.Mg_part_bom_rel AS bom_rel ON bom_rel.part_id = part.part_id INNER JOIN
                   dbo.Mg_BOM AS bom ON bom.bom_id = bom_rel.bom_id INNER JOIN
                   dbo.Mg_Property ON part.part_categoryid = dbo.Mg_Property.prop_id
WHERE   (CustomerOrder.OrderType = 1 OR
                   CustomerOrder.OrderType = 2) AND (CustomerOrder.OrderIsHistory IS NULL OR
                   CustomerOrder.OrderIsHistory = 0)
ORDER BY ID, 主副驾 DESC       ";










    //private void SetttingMenu()
    //{
    //    this.m1.Visible = false;
    //    this.m1_1.Visible = false;
    //    this.m1_2.Visible = false;
    //    this.m1_3.Visible = false;
    //    this.m1_4.Visible = false;
    //    this.m1_5.Visible = false;
    //    this.m1_6.Visible = false;

    //    this.m2.Visible = false;
    //    this.m2_1.Visible = false;
    //    this.m2_2.Visible = false;
    //    this.m2_3.Visible = false;
    //    this.m2_4.Visible = false;
    //    this.m2_5.Visible = false;
    //    this.m2_6.Visible = false;
    //    this.m2_7.Visible = false;
    //    this.m2_8.Visible = false;
    //    this.m2_9.Visible = false;
    //    this.m2_10.Visible = false;
    //    this.m2_11.Visible = false;

    //    this.m3.Visible = false;
    //    this.m3_1.Visible = false;
    //    this.m3_2.Visible = false;
    //    this.m3_3.Visible = false;


    //    this.m4.Visible = false;
    //    this.m4_1.Visible = false;
    //    this.m4_3.Visible = false;

    //    this.m5.Visible = false;
    //    this.m5_1.Visible = false;
    //    this.m5_2.Visible = false;
    //    this.m5_3.Visible = false;
    //    this.m5_4.Visible = false;
    //    this.m5_5.Visible = false;
    //    this.m5_6.Visible = false;
    //    this.m5_7.Visible = false;
    //    this.m5_8.Visible = false;
    //    this.m5_9.Visible = false;
    //    this.m5_10.Visible = false;
    //    this.m5_11.Visible = false;

    //    this.m6.Visible = false;
    //    this.m6_1.Visible = false;

    //    string menuids = "";
    //    if (Request.Cookies["admininfo"] != null)
    //    {
    //        menuids = HttpUtility.UrlDecode(Request.Cookies["admininfo"]["menuids"]);
    //    }
    //    string[] menuidArr = menuids.Split(',');
    //    foreach (string item in menuidArr)
    //    {
    //        //14 23 34 42 53
    //        switch (item)
    //        {
    //            case "m1": this.m1.Visible = true; break;
    //            case "m1_1": this.m1_1.Visible = true; break;
    //            case "m1_2": this.m1_2.Visible = true; break;
    //            case "m1_3": this.m1_3.Visible = true; break;
    //            case "m1_4": this.m1_4.Visible = true; break;
    //            case "m1_5": this.m1_5.Visible = true; break;
    //            case "m1_6": this.m1_6.Visible = true; break;
                    
    //            case "m2": this.m2.Visible = true; break;
    //            case "m2_1": this.m2_1.Visible = true; break;
    //            case "m2_2": this.m2_2.Visible = true; break;
    //            case "m2_3": this.m2_3.Visible = true; break;
    //            case "m2_4": this.m2_4.Visible = true; break;
    //            case "m2_5": this.m2_5.Visible = true; break;
    //            case "m2_6": this.m2_6.Visible = true; break;
    //            case "m2_7": this.m2_7.Visible = true; break;
    //            case "m2_8": this.m2_8.Visible = true; break;
    //            case "m2_9": this.m2_9.Visible = true; break;
    //            case "m2_10": this.m2_10.Visible = true; break;
    //            case "m2_11": this.m2_11.Visible = true; break;

    //            case "m3": this.m3.Visible = true; break;
    //            case "m3_1": this.m3_1.Visible = true; break;
    //            case "m3_2": this.m3_2.Visible = true; break;
    //            case "m3_3": this.m3_3.Visible = true; break;

    //            // case "m3_4": this.m3_4.Visible = true; break;
    //            case "m4": this.m4.Visible = true; break;
    //            case "m4_1": this.m4_1.Visible = true; break;
    //            case "m4_3": this.m4_3.Visible = true; break;

    //            //case "m4_2": this.m4_2.Visible = true; break;
    //            case "m5": this.m5.Visible = true; break;
    //            case "m5_1": this.m5_1.Visible = true; break;
    //            case "m5_2": this.m5_2.Visible = true; break;
    //            case "m5_3": this.m5_3.Visible = true; break;
    //            case "m5_4": this.m5_4.Visible = true; break;
    //            case "m5_5": this.m5_5.Visible = true; break;
    //            case "m5_6": this.m5_6.Visible = true; break;
    //            case "m5_7": this.m5_7.Visible = true; break;
    //            case "m5_8": this.m5_8.Visible = true; break;
    //            case "m5_9": this.m5_9.Visible = true; break;
    //            case "m5_10": this.m5_10.Visible = true; break;
    //            case "m5_11": this.m5_11.Visible = true; break;

    //            case "m6": this.m6.Visible = true; break;
    //            case "m6_1": this.m6_1.Visible = true; break;
    //    }
    //    }
    //}


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["admininfo"] != null)
            Request.Cookies["admininfo"].Expires = DateTime.Now.AddDays(-1);

        System.Web.Security.FormsAuthentication.SignOut();

        Session.Abandon();
        Session.RemoveAll();
        Session.Clear();

        this.Response.Redirect("/AdminIndex.aspx");
        this.Response.End();
    }

    
}