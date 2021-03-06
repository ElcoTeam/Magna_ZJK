﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DbUtility;
using Model;

namespace DAL
{
    public class mg_PositionDAL
    {
        public static int AddPositionByName(string posi_name)
        {
            string maxidSql = @"declare @i int;
                                SELECT @i=max([posi_id])  FROM [Sys_RoleInfo];
                                if @i is null
                                    begin
                                        set @i=1
                                    end
                                else
                                    begin
                                        set @i=@i+1
                                    end;";
            string sql = maxidSql + @"INSERT INTO [Sys_RoleInfo] ([posi_id],[posi_name]) VALUES (@i,'" + posi_name + @"')";
            return SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static DataTable GetAllData()
        {
            string sql = @"select * from [Sys_RoleInfo] order by posi_id";
            return SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static int UpDatePositionByName(int posi_id, string posi_name)
        {
            string sql = @"update [Sys_RoleInfo] set posi_name='" + posi_name + "' where posi_id=" + posi_id;
            return SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static int DelPositionByName(int posi_id)
        {
            string sql = @"delete from [Sys_RoleInfo] where posi_id=" + posi_id;
            return SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static int CheckPositionByName(int a, int posi_id, string posi_name)
        {
            string sql = "";
            DataTable tb;
            int i;
            if (a == 1)
            {
                sql = @"select * from [Sys_RoleInfo] where posi_name='" + posi_name + "'";
            }
            if (a == 2)
            {
                sql = @"select * from [Sys_RoleInfo] where posi_name='" + posi_name + "' and posi_id <>" + posi_id;
            }
            tb = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
            if (tb.Rows.Count != 0)
            {
                i = 1;
            }
            else
            {
                i = 0;
            }
            tb.Dispose();
            return i;
        }

        public static List<mg_PositionModel> QueryPositionsForUser()
        {
            List<mg_PositionModel> list = null;
            string sql = @"SELECT [posi_id],[posi_name]  FROM [Sys_RoleInfo] order by posi_name ";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                list = new List<mg_PositionModel>();
                foreach (DataRow row in dt.Rows)
                {
                    mg_PositionModel model = new mg_PositionModel();
                    model.posi_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "posi_id"));
                    model.posi_name = DataHelper.GetCellDataToStr(row, "posi_name");
                    list.Add(model);
                }
            }
            return list;
        }
    }
}
