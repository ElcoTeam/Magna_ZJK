using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DbUtility;
using Model;


namespace DAL
{
    public class mg_MaterialPropertyDAL
    {

        public static List<Mg_MaterialPropertyTypeModel> QueryMaterialPropertyTypeForEditing()
        {
            List<Mg_MaterialPropertyTypeModel> list = null;
            string sql = @"SELECT [ID]
                                  ,[Prop_Type]
                              FROM [Mg_MaterialPropertyType]
                              order by ID";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<Mg_MaterialPropertyTypeModel>();
                foreach (DataRow row in dt.Rows)
                {
                    Mg_MaterialPropertyTypeModel model = new Mg_MaterialPropertyTypeModel();
                    model.ID = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "ID"));
                    model.Prop_Type = DataHelper.GetCellDataToStr(row, "Prop_Type");
                    list.Add(model);
                }
                Mg_MaterialPropertyTypeModel firstmodel = new Mg_MaterialPropertyTypeModel();
                firstmodel.ID = 0;
                firstmodel.Prop_Type = "-- 请选择类型 --";
                list.Insert(0, firstmodel);
            }

            return list;
        }

        ///陈名兴
        ///增加下拉类型
        ///
        public static List<mg_PropertyModel> QueryPropertyFlowlingForEditing(string type)
        {
            List<mg_PropertyModel> list = null;
            string sql = @"SELECT [prop_id]
                                  ,[Prop_Type]
                                  ,[prop_name]
                              FROM [Mg_Property]
                              where [Prop_type]=" + type + " order by prop_id";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<mg_PropertyModel>();
                foreach (DataRow row in dt.Rows)
                {
                    mg_PropertyModel model = new mg_PropertyModel();
                    model.prop_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "prop_id"));
                    model.prop_name = DataHelper.GetCellDataToStr(row, "prop_name");
                    model.Prop_type = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "Prop_type"));
                    list.Add(model);
                }
                mg_PropertyModel firstmodel = new mg_PropertyModel();
                firstmodel.prop_id = 0;
                firstmodel.prop_name = "-- 请选择类型 --";
                list.Insert(0, firstmodel);
            }

            return list;
        }
        public static List<mg_MaterialPropertyModel> queryJSONStringByPropertyType(string type)
        {
            List<mg_MaterialPropertyModel> list = null;
            string sql = @"SELECT [prop_id]
                                      ,[Prop_type]
                                      ,[prop_name]
                                  FROM [Mg_MaterialProperty] where Prop_type=" + type + " order by prop_id";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<mg_MaterialPropertyModel>();
                foreach (DataRow row in dt.Rows)
                {
                    mg_MaterialPropertyModel model = new mg_MaterialPropertyModel();
                    model.prop_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "prop_id"));
                    model.Prop_type = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "Prop_type"));
                    model.prop_name = DataHelper.GetCellDataToStr(row, "prop_name");
                    list.Add(model);
                }
               
            }
            return list;
        }


        public static List<Mat_SupplierListModel> querySupplierForBOM(string type)
        {
            List<Mat_SupplierListModel> list = null;
            string sql = @"SELECT [ID]
                                      ,[SupplierID]
                                      ,[SupplierName]
                                  FROM [Mat_SupplierList] where WareHouseID=" + type + " order by SupplierID";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<Mat_SupplierListModel>();
                foreach (DataRow row in dt.Rows)
                {
                    Mat_SupplierListModel model = new Mat_SupplierListModel();
                  
                    model.supplierid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "SupplierID"));
                    model.suppliername = DataHelper.GetCellDataToStr(row, "SupplierName");
                    list.Add(model);
                }
                Mat_SupplierListModel firstmodel = new Mat_SupplierListModel();
               
                firstmodel.supplierid = 0;
                firstmodel.suppliername = "-- 请选择类型 --";
                list.Insert(0, firstmodel);
            }
            return list;
        }
        public static List<mg_PropertyModel> queryJSONStringByPropertyType1(string type)
        {
            List<mg_PropertyModel> list = null;
            string sql = @"SELECT [prop_id]
                                      ,[Prop_type]
                                      ,[prop_name]
                                  FROM [Mg_Property] where prop_id=" + type + " order by prop_id";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<mg_PropertyModel>();
                foreach (DataRow row in dt.Rows)
                {
                    mg_PropertyModel model = new mg_PropertyModel();
                    model.prop_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "prop_id"));
                    model.Prop_type = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "Prop_type"));
                    model.prop_name = DataHelper.GetCellDataToStr(row, "prop_name");
                    list.Add(model);
                }
            }
            return list;
        }

        public static List<mg_PropertyModel> queryJSONStringByPropertyType(mg_PropertyEnum propEnum)
        {
            List<mg_PropertyModel> list = null;
            string sql = @"SELECT [prop_id]
                                      ,[Prop_type]
                                      ,[prop_name]
                                  FROM [mg_Property] where Prop_type=" + (int)propEnum + @" order by prop_name";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<mg_PropertyModel>();
                foreach (DataRow row in dt.Rows)
                {
                    mg_PropertyModel model = new mg_PropertyModel();
                    model.prop_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "prop_id"));
                    model.prop_name = DataHelper.GetCellDataToStr(row, "prop_name");
                    list.Add(model);
                }
            }
            return list;
        }
      
        /// <summary>
        /// 新增类型       
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static int AddMaterialProperty(mg_MaterialPropertyModel model)
        {
            string maxid = @"declare @i int;
                                SELECT @i=max([prop_id])  FROM [Mg_MaterialProperty];
                                if @i is null
                                    begin
                                        set @i=1
                                    end
                                else
                                    begin
                                        set @i=@i+1
                                    end;
                                ";
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SET IDENTITY_INSERT Mg_MaterialProperty ON; ");
            strSql.Append("insert into Mg_MaterialProperty(");
            strSql.Append("prop_id,Prop_type,prop_name)");
            strSql.Append(" values (");
            strSql.Append("@i,@Prop_type,@prop_name);");
            strSql.Append("SET IDENTITY_INSERT Mg_MaterialProperty OFF; ");
            SqlParameter[] parameters = {
					new SqlParameter("@Prop_type", SqlDbType.Int),
					new SqlParameter("@prop_name", SqlDbType.NVarChar)
                                        };
            parameters[0].Value = model.Prop_type;
            parameters[1].Value = model.prop_name;

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, maxid + strSql, parameters);
            return rows;
        }

        /// <summary>
        /// 更新类型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static int UpdateMaterialProperty(mg_MaterialPropertyModel model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update Mg_MaterialProperty set ");
            strSql.Append("prop_name=@prop_name");
            strSql.Append(" where prop_id=@prop_id  ");
            SqlParameter[] parameters = {
					new SqlParameter("@prop_id", SqlDbType.Int),
					new SqlParameter("@prop_name", SqlDbType.NVarChar)
                                        };
            parameters[0].Value = model.prop_id;
            parameters[1].Value = model.prop_name;

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, strSql.ToString(), parameters);
            return rows;
        }

        /// <summary>
        /// 删除颜色
        /// lx 2016-06-22
        /// </summary>
        /// <param name="op_id"></param>
        /// <returns></returns>
        public static int DeleteMaterialProperty(string prop_id)
        {

            string sql = "DELETE FROM [Mg_MaterialProperty] WHERE prop_id=" + prop_id;

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            return rows;
        }
    }
}
