using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Bll;
using Model;
using DbUtility;
namespace website.HttpHandlers
{
    /// <summary>
    /// 颜色配置
    /// lx 2017-06-22
    /// </summary>
    public class MaterialPropertyHandler2 : IHttpHandler
    {
        HttpRequest Request = null;
        HttpResponse Response = null;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            Request = context.Request;
            Response = context.Response;

            string method = Request.Params["method"];
            switch (method)
            {
                case "queryMaterialPropertyTypeForEditing":
                    QueryMaterialPropertyTypeForEditing();
                    break;
                case "saveMaterialProperty":
                    SaveMaterialProperty();
                    break;               
                case "queryMaterialPropertyList":
                    QueryMaterialPropertyList();
                    break;
                case "queryMetaForEditing":
                    queryMetaForEditing();
                    break;
                case "deleteMaterialProperty":
                    DeleteMaterialProperty();
                    break;


            }
        }



        /// <summary>
        /// 类型下拉列表
        /// </summary>
        void QueryMaterialPropertyTypeForEditing()
        {
            string json = mg_MaterialPropertyBLL.QueryMaterialPropertyTypeForEditing();
            Response.Write(json);
            Response.End();
        }
        /// <summary>
        /// 类型列表查询
        /// </summary>
        void QueryMaterialPropertyList()
        {
            mg_PropertyBLL bll = new mg_PropertyBLL();
            string id = Request.Params["id"];
            string json = mg_MaterialPropertyBLL.queryMaterialPropertyForEditing(id);
            Response.Write(json);
            Response.End();
        }


      

        /// <summary>
        /// 材质列表查询
        /// </summary>
        void queryMetaForEditing()
        {
            mg_PropertyBLL bll = new mg_PropertyBLL();
            string json = mg_MaterialPropertyBLL.queryMetaForEditing();
            Response.Write(json);
            Response.End();
        }
        /// <summary>
        /// 保存颜色
        /// </summary>
        void SaveMaterialProperty()
        {
            try
            {
                string prop_id = Request.Params["prop_id"];
                string prop_name = Request.Params["prop_name"];
                string prop_type = Request.Params["prop_type"];

                mg_MaterialPropertyModel model = new mg_MaterialPropertyModel();
                model.prop_name = prop_name;
                model.Prop_type = NumericParse.StringToInt(prop_type);
                if (!string.IsNullOrWhiteSpace(prop_id))
                {
                    model.prop_id = Convert.ToInt32(prop_id);
                }
                else
                {
                    model.prop_id = 0;
                }

                string json = mg_MaterialPropertyBLL.SaveMaterialProperty(model);
                Response.Write(json);
                Response.End();
            }
            catch (Exception ex)
            {
            }

        }

        void DeleteMaterialProperty()
        {
            string prop_id = Request.Params["prop_id"];

            string json = mg_MaterialPropertyBLL.DeleteMaterialProperty(prop_id);
            Response.Write(json);
            Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}