using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Bll;
using System.IO;
using System.Text;

namespace website.SortManagent
{
  
    public partial class MaterialsortprintingCDDY : System.Web.UI.Page
    {
        public string csh = "";
        public string cx = "";
        public string ewm = "";
        protected void Page_Load(object sender, EventArgs e)
        { 
            Random r = new Random();
            Random r1 = new Random();
            csh = Request.QueryString["csh"];
            cx = Request.QueryString["cx"];
            ewm = r.Next(100000000, 999999999).ToString() + r1.Next(100, 999).ToString();
        }
       
    }
}