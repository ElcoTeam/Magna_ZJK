﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using Bll;
using System.Text.RegularExpressions;
using DbUtility;

public partial class Order_mg_Order : Page
{
    public static int id;
    public static  string cono;
    public static string orinfo;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        
    }

    private void BindData2()
    {
        this.GridView2.DataSource = mg_orderBLL.GetAllData();
        this.GridView2.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    
    }
}