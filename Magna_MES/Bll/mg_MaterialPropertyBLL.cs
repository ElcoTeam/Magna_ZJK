using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;
using System.Data.SqlClient;
using Model;
using DbUtility;

namespace Bll
{
    public class mg_MaterialPropertyBLL
    {

        public static string queryMaterialPropertyForEditing()
        {
            return queryJSONStringByPropertyType("1");
        }

        public static string queryMaterialPropertyForEditing(string id)
        {
            return queryJSONStringByPropertyType(id);
        }

        public static string queryMetaForEditing()
        {
            return queryJSONStringByPropertyType("3");
        }

        public static string QueryMaterialPropertyTypeForEditing()
        {
            string jsonStr = "[]";
            List<Mg_MaterialPropertyTypeModel> list = mg_MaterialPropertyDAL.QueryMaterialPropertyTypeForEditing();
            jsonStr = JSONTools.ScriptSerialize<List<Mg_MaterialPropertyTypeModel>>(list);
            return jsonStr;
        }

        static string queryJSONStringByPropertyType(string type)
        {
            string jsonStr = "[]";
            List<mg_MaterialPropertyModel> list = mg_MaterialPropertyDAL.queryJSONStringByPropertyType(type);
            jsonStr = JSONTools.ScriptSerialize<List<mg_MaterialPropertyModel>>(list);
            return jsonStr;
        }




       public static string querySupplierForBOM(string type)
        {
            string jsonStr = "[]";
            List<Mat_SupplierListModel> list = mg_MaterialPropertyDAL.querySupplierForBOM(type);
            jsonStr = JSONTools.ScriptSerialize<List<Mat_SupplierListModel>>(list);
            return jsonStr;
        }



        public static string querySupplierForBOM()
        {
            return queryJSONStringByPropertyType("5");
        }

        /// <summary>
        /// 保存
        /// lx 2017-06-22
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static string SaveMaterialProperty(mg_MaterialPropertyModel model)
        {
            return model.prop_id == 0 ? AddMaterialProperty(model) : UpdateMaterialProperty(model);
        }

        /// <summary>
        /// 新增类型       
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static string AddMaterialProperty(mg_MaterialPropertyModel model)
        {
            int count = mg_MaterialPropertyDAL.AddMaterialProperty(model);
            return count > 0 ? "true" : "false";
        }

        /// <summary>
        /// 更新类型       
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static string UpdateMaterialProperty(mg_MaterialPropertyModel model)
        {
            int count = mg_MaterialPropertyDAL.UpdateMaterialProperty(model);
            return count > 0 ? "true" : "false";
        }

        /// <summary>
        /// 删除零件类型      
        /// </summary>
        /// <param name="prop_id"></param>
        /// <returns></returns>
        public static string DeleteMaterialProperty(string prop_id)
        {
            int count = mg_MaterialPropertyDAL.DeleteMaterialProperty(prop_id);
            return count > 0 ? "true" : "false";
        }
    }
}
