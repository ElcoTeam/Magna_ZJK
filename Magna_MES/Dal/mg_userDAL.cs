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
    public class mg_UserDAL
    {

        public static Model.mg_userModel GetUserForUID(string uid)
        {

            string sql = @" select * from Sys_UserInfo where user_id='" + uid + "' ";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                foreach (DataRow row in dt.Rows)
                {
                    mg_userModel model = new mg_userModel();
                    model.user_id = DataHelper.GetCellDataToStr(row, "user_id");
                    model.user_pwd = DataHelper.GetCellDataToStr(row, "user_pwd");
                    model.user_name = DataHelper.GetCellDataToStr(row, "user_name");
                    model.user_no = DataHelper.GetCellDataToStr(row, "user_no");
                    model.user_pic = DataHelper.GetCellDataToStr(row, "user_pic");
                    model.user_email = DataHelper.GetCellDataToStr(row, "user_email");
                    model.user_depid = Convert.ToInt32(DataHelper.GetCellDataToStr(row, "user_depid"));
                    model.user_posiid = Convert.ToInt32(DataHelper.GetCellDataToStr(row, "user_posiid"));
                    model.user_menuids = DataHelper.GetCellDataToStr(row, "user_menuids");
                    return model;
                }
            }
            return null;
        }

        /// <summary>
        /// 读取用户信息
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static Model.mg_userModel GetUserForUName(string uname)
        {
            //string sql = @" select * from mg_User where user_name='" + uname + "' ";
            //DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            //if (DataHelper.HasData(dt))
            //{
            //    foreach (DataRow row in dt.Rows)
            //    {
            //        mg_userModel model = new mg_userModel();
            //        model.user_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_id"));
            //        model.user_pwd = DataHelper.GetCellDataToStr(row, "user_pwd");
            //        model.user_name = uname;
            //        model.user_no = DataHelper.GetCellDataToStr(row, "user_no");
            //        model.user_pic = DataHelper.GetCellDataToStr(row, "user_pic");
            //        model.user_email = DataHelper.GetCellDataToStr(row, "user_email");
            //        model.user_depid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_depid"));
            //        model.user_posiid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_posiid"));
            //        model.user_menuids = DataHelper.GetCellDataToStr(row, "user_menuids");
            //        return model;
            //    }
            //}
            //return null;

            string sql = @" SELECT  user_pwd
                                      ,[user_name]
                                      ,[user_email]
                                      ,[user_depid]
                                      ,[user_posiid]
                                      ,[user_no]
                                     ,d.dep_name user_depid_name
                                      ,p.posi_name user_posiid_name
                                      ,[user_menuids]
	  	                                  ,case [user_sex]
		                                                            when 1 then '男'
		                                                            else '女'
		                                                            end user_sex_name
                                      ,[user_sex]
	                                  ,case [user_isAdmin]
		                                                            when 1 then '是'
		                                                            else '否'
		                                                            end user_isAdmin_name
                                      ,[user_isAdmin]
                                  FROM [Sys_UserInfo] u
                                  left join Sys_DeptInfo d on u.user_depid = d.dep_id
                                  left join Sys_RoleInfo p on u.user_posiid = p.posi_id 
                                    where (Lower(user_name)='" + uname.ToLower() + @"' or user_no ='" + uname.ToLower() + @"') and active_flag=0;
                                    ";
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            if (DataHelper.HasData(dt))
            {
                foreach (DataRow row in dt.Rows)
                {
                    mg_userModel model = new mg_userModel();
                    model.user_no = DataHelper.GetCellDataToStr(row, "user_no");
                    model.user_name = DataHelper.GetCellDataToStr(row, "user_name");
                    model.user_pwd = DataHelper.GetCellDataToStr(row, "user_pwd");
                    model.user_email = DataHelper.GetCellDataToStr(row, "user_email");
                    model.user_depid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_depid"));
                    model.user_posiid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_posiid"));
                    model.user_posiid_name = DataHelper.GetCellDataToStr(row, "user_posiid_name");
                    model.user_depid_name = DataHelper.GetCellDataToStr(row, "user_depid_name");
                    model.user_menuids = DataHelper.GetCellDataToStr(row, "user_menuids");
                    model.user_sex_name = DataHelper.GetCellDataToStr(row, "user_sex_name");
                    model.user_sex = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_sex"));
                    model.user_isAdmin_name = DataHelper.GetCellDataToStr(row, "user_isAdmin_name");
                    model.user_isAdmin = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_isAdmin"));
                    return model;
                }
            }
            return null;

        }
        public static int AddUserByName(string name, string pwd, string rfid, string email, int depid, int posiid, string pic, string menuids)
        {
            string sql = @"INSERT INTO [Sys_UserInfo] ([user_name],[user_pwd],[user_no],[user_pic],[user_email],[user_depid],[user_posiid],[user_menuids]) VALUES ('" + name + "','" + pwd + "','" + rfid + "','" + pic + "','" + email + "'," + depid + "," + posiid + ",'" + menuids + "')";
            return SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static DataTable GetAllData()
        {
            string sql = @"select u.*,d.dep_name,p.posi_name from [Sys_UserInfo] u left join Sys_DeptInfo d on u.user_depid=d.dep_id left join Sys_RoleInfo p on u.user_posiid=p.posi_id order by [user_id]";
            return SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static int UpdateUserByName(int id, string name, string pwd, string rfid, string email, string menuids, int depid, int posiid, string pic)
        {
            string sql = @"update [Sys_UserInfo] set user_name = '" + name + "',user_pwd='" + pwd + "',user_no='" + rfid + "',user_pic='" + pic + "',user_email='" + email + "',user_depid=" + depid + ",user_posiid=" + posiid + ",user_menuids='" + menuids + "' where user_id='" + id + "'";
            return SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static int DelUserByName(int user_id)
        {
            string sql = @"delete from [Sys_UserInfo] where user_id=" + user_id;
            return SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static int CheckUserByName(int a, int userid, string name)
        {
            string sql = "";
            DataTable tb;
            int i;
            if (a == 1)
            {
                sql = @"select * from [Sys_UserInfo] where Lower(user_name)='" + name.ToLower() + "'";
            }
            if (a == 2)
            {
                sql = @"select * from [Sys_UserInfo] where Lower(user_name)='" + name.ToLower() + "' and user_id <>" + userid;
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

        public static DataTable GetPosiName()
        {
            string sql = @"select posi_id,posi_name from [Sys_RoleInfo] order by [posi_id]";
            return SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static DataTable GetDepName()
        {
            string sql = @"select dep_id,dep_name from [Sys_DeptInfo] order by [dep_id]";
            return SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static DataTable GetUserName()
        {
            string sql = @"select bom_id,bom_name from [mg_bom] order by [bom_id]";
            return SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
        }

        public static bool CheckPicName(string name)
        {
            string sql = @"select count(*) from [Sys_UserInfo] where user_pic='" + name + "'";
            DataTable tb;

            tb = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, CommandType.Text, sql, null);
            if (tb.Rows[0][0].ToString() == "0")
            {
                tb.Dispose();
                return false;
            }
            else
            {
                tb.Dispose();
                return true;
            }
        }

        public static int AddUser(mg_userModel model)
        {
            StringBuilder strSql1 = new StringBuilder();
            strSql1.Append("select * from Sys_UserInfo where user_no=@user_no and active_flag=0");
            SqlParameter[] parameters2 = {
                    new SqlParameter("@user_no", SqlDbType.VarChar)
                                        };

            parameters2[0].Value = model.user_no;
            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, strSql1.ToString(), parameters2);
            if (dt.Rows.Count == 0)
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into Sys_UserInfo(");
                strSql.Append("user_name,user_email,user_depid,user_posiid,user_menuids,user_sex,user_isAdmin,user_pwd,user_no,createtime)");
                strSql.Append(" values (");
                strSql.Append("@user_name,@user_email,@user_depid,@user_posiid,@user_menuids,@user_sex,@user_isAdmin,@user_pwd,@user_no,getdate())");
                SqlParameter[] parameters = {
					new SqlParameter("@user_name", SqlDbType.VarChar),
					new SqlParameter("@user_email", SqlDbType.VarChar),
					new SqlParameter("@user_depid", SqlDbType.Int),
					new SqlParameter("@user_posiid", SqlDbType.Int),
					new SqlParameter("@user_menuids", SqlDbType.VarChar),
					new SqlParameter("@user_sex", SqlDbType.Int),
					new SqlParameter("@user_isAdmin", SqlDbType.Int),
					new SqlParameter("@user_pwd", SqlDbType.VarChar),
                    new SqlParameter("@user_no", SqlDbType.VarChar)
                                        };
                parameters[0].Value = model.user_name;
                parameters[1].Value = model.user_email;
                parameters[2].Value = model.user_depid;
                parameters[3].Value = model.user_posiid;
                parameters[4].Value = model.user_menuids;
                parameters[5].Value = model.user_sex;
                parameters[6].Value = model.user_isAdmin;
                parameters[7].Value = model.user_pwd;
                parameters[8].Value = model.user_no;

                //权限存储
                StringBuilder insertuserlimit = new StringBuilder();
                insertuserlimit.Append("insert into Sys_UserLimitInfo(");
                insertuserlimit.Append("UserNo,MenuNo)");
                insertuserlimit.Append(" select @user_no,ColName from dbo.[Fun_StrToTable](@user_menuids)");
                SqlParameter[] parameters1 = {
                    new SqlParameter("@user_no", SqlDbType.VarChar),
					new SqlParameter("@user_menuids", SqlDbType.VarChar)
                                        };
                parameters1[0].Value = model.user_no;
                parameters1[1].Value = model.user_menuids;

                int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, strSql.ToString() + insertuserlimit.ToString(), parameters);
                return rows;

            }
            else
            {
                return -1;
            }

        }


        public static List<mg_userModel> QueryListForFirstPage(string currentpage,string pagesize, out string total)
        {
            total = "0";
            List<mg_userModel> list = null;

            string sql1 = @"select count(1) total from [Sys_UserInfo];";
            string sqlselect = @"select  top " + pagesize + @" A.*
                                       
                                       from (  
                                       select ROW_NUMBER() over(order by user_no) as                      rowid ,                     
                                       [user_name]
                                      ,[user_pwd]
                                      ,[user_email]
                                      ,[user_depid]
                                      ,[user_posiid]
                                      ,[user_no]
                                      ,d.dep_name user_depid_name
                                      ,p.posi_name user_posiid_name
                                      ,[user_menuids]
	  	                              ,case [user_sex]
		                                                            when 1 then '男'
		                                                            else '女'
		                                                            end user_sex_name
                                      ,[user_sex]
	                                  ,case [user_isAdmin]
		                                                            when 1 then '是'
		                                                            else '否'
		                                                            end user_isAdmin_name
                                      ,[user_isAdmin]
                                      
                                  from            
                                  [Sys_UserInfo] u
                                  left join Sys_DeptInfo d on u.user_depid = d.dep_id
                                  left join Sys_RoleInfo p on u.user_posiid = p.posi_id   
                                  where u.active_flag='0')as A  
                                  where rowid> (" + pagesize + ")*((" + currentpage + ")-1)";

//            string sql2 = @" SELECT top " + pagesize + @" 
//                                       [user_name]
//                                      ,[user_pwd]
//                                      ,[user_email]
//                                      ,[user_depid]
//                                      ,[user_posiid]
//                                      ,[user_no]
//                                     ,d.dep_name user_depid_name
//                                      ,p.posi_name user_posiid_name
//                                      ,[user_menuids]
//	  	                                  ,case [user_sex]
//		                                                            when 1 then '男'
//		                                                            else '女'
//		                                                            end user_sex_name
//                                      ,[user_sex]
//	                                  ,case [user_isAdmin]
//		                                                            when 1 then '是'
//		                                                            else '否'
//		                                                            end user_isAdmin_name
//                                      ,[user_isAdmin]
//                                  FROM [Sys_UserInfo] u
//                                  left join Sys_DeptInfo d on u.user_depid = d.dep_id
//                                  left join Sys_RoleInfo p on u.user_posiid = p.posi_id
//
//                                  order by [user_no] desc
//                                ";
            DataSet ds = SqlHelper.GetDataSetTableMapping(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql1 + sqlselect, new string[] { "count", "data" }, null);
            if (DataHelper.HasData(ds))
            {
                DataTable dt1 = ds.Tables["count"];
                total = DataHelper.GetCellDataToStr(dt1.Rows[0], "total");
                DataTable dt2 = ds.Tables["data"];
                list = new List<mg_userModel>();
                foreach (DataRow row in dt2.Rows)
                {
                    mg_userModel model = new mg_userModel();

                    //model.user_id = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_id"));
                    
                    model.user_no =DataHelper.GetCellDataToStr(row, "user_no")=="NULL" ? "" : DataHelper.GetCellDataToStr(row, "user_no");
                    model.user_name = DataHelper.GetCellDataToStr(row, "user_name");
                    model.user_pwd = DataHelper.GetCellDataToStr(row, "user_pwd");
                    model.user_email = DataHelper.GetCellDataToStr(row, "user_email");
                    model.user_depid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_depid"));
                    model.user_posiid = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_posiid"));
                    model.user_posiid_name = DataHelper.GetCellDataToStr(row, "user_posiid_name");
                    model.user_depid_name = DataHelper.GetCellDataToStr(row, "user_depid_name");
                    model.user_menuids = DataHelper.GetCellDataToStr(row, "user_menuids");
                    model.user_sex_name = DataHelper.GetCellDataToStr(row, "user_sex_name");
                    model.user_sex = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_sex"));
                    model.user_isAdmin_name = DataHelper.GetCellDataToStr(row, "user_isAdmin_name");
                    model.user_isAdmin = NumericParse.StringToInt(DataHelper.GetCellDataToStr(row, "user_isAdmin"));
                   
                    list.Add(model);
                }
            }
            return list;
        }



        public static int UpdateUser(mg_userModel model)
        {
            if (model.user_oldno != model.user_no)
            {
                StringBuilder strSql1 = new StringBuilder();
                strSql1.Append("select * from Sys_UserInfo where user_no=@user_no and active_flag=0");
                SqlParameter[] parameters2 = {
                    new SqlParameter("@user_no", SqlDbType.VarChar)
                                        };

                parameters2[0].Value = model.user_no;
                DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, strSql1.ToString(), parameters2);
                if (dt.Rows.Count != 0)
                {
                    return -1;
                }
            }

            StringBuilder checkpwd = new StringBuilder();
            StringBuilder strSql = new StringBuilder();
            checkpwd.Append("select user_pwd from Sys_UserInfo where user_no=@user_no and user_pwd=@user_pwd");
            SqlParameter[] parameters3 = 
             {
                    new SqlParameter("@user_no", SqlDbType.VarChar),
                    new SqlParameter("@user_pwd", SqlDbType.VarChar)
             };

            parameters3[0].Value = model.user_no;
            parameters3[1].Value = model.user_pwd;
            DataTable dt1 = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, checkpwd.ToString(), parameters3);
            if (dt1.Rows.Count != 0)
            {
                strSql.Append("update Sys_UserInfo set ");
                strSql.Append("user_name=@user_name,");
                strSql.Append("user_no=@user_oldno,");
                strSql.Append("user_pwd=@user_pwd,");
                strSql.Append("user_email=@user_email,");
                strSql.Append("user_depid=@user_depid,");
                strSql.Append("user_posiid=@user_posiid,");
                strSql.Append("user_menuids=@user_menuids,");
                strSql.Append("user_sex=@user_sex,");
                strSql.Append("user_isAdmin=@user_isAdmin");
                strSql.Append(" where user_no=@user_no ");
            }

            else
            {
                strSql.Append("update Sys_UserInfo set ");
                strSql.Append("user_name=@user_name,");
                strSql.Append("user_no=@user_oldno,");
                strSql.Append("user_pwd=@user_pwd,");
                strSql.Append("user_email=@user_email,");
                strSql.Append("user_depid=@user_depid,");
                strSql.Append("user_posiid=@user_posiid,");
                strSql.Append("user_menuids=@user_menuids,");
                strSql.Append("user_sex=@user_sex,");
                strSql.Append("user_isAdmin=@user_isAdmin,");
                strSql.Append("lasteditpwdtime=getdate()");
                strSql.Append(" where user_no=@user_no ");

            }
            SqlParameter[] parameters = 
             {
			            new SqlParameter("@user_name", SqlDbType.VarChar),
                              new SqlParameter("@user_oldno", SqlDbType.VarChar),
                              new SqlParameter("@user_pwd", SqlDbType.VarChar),
			            new SqlParameter("@user_email", SqlDbType.VarChar),
			            new SqlParameter("@user_depid", SqlDbType.Int),
			            new SqlParameter("@user_posiid", SqlDbType.Int),
			            new SqlParameter("@user_menuids", SqlDbType.VarChar),
			            new SqlParameter("@user_sex", SqlDbType.Int),
			            new SqlParameter("@user_isAdmin", SqlDbType.Int),
			            new SqlParameter("@user_no", SqlDbType.VarChar)
             };
            parameters[0].Value = model.user_name;
            parameters[1].Value = model.user_no;
            parameters[2].Value = model.user_pwd;
            parameters[3].Value = model.user_email;
            parameters[4].Value = model.user_depid;
            parameters[5].Value = model.user_posiid;
            parameters[6].Value = model.user_menuids;
            parameters[7].Value = model.user_sex;
            parameters[8].Value = model.user_isAdmin;
            parameters[9].Value = model.user_oldno;
            string a = strSql.ToString();

            StringBuilder updateuserlimit = new StringBuilder();
            updateuserlimit.Append("delete from Sys_UserLimitInfo where  UserNo=@user_no");
            updateuserlimit.Append(" insert into Sys_UserLimitInfo(");
            updateuserlimit.Append(" UserNo,MenuNo)");
            updateuserlimit.Append(" select @user_no,ColName from dbo.[Fun_StrToTable](@user_menuids)");
            SqlParameter[] parameters1 = {
			new SqlParameter("@user_no", SqlDbType.VarChar),
			new SqlParameter("@user_menuids", SqlDbType.VarChar)
                                      };
            parameters1[0].Value = model.user_oldno;
            parameters1[1].Value = model.user_menuids;

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, strSql.ToString() + updateuserlimit.ToString(), parameters);
            return rows;

        }
        public static int DeleteUser(string user_no)
        {
            string sql = "UPDATE [Sys_UserInfo] SET active_flag='1' WHERE user_no='" + user_no+"'";
            string deletelimit = "   delete from Sys_UserLimitInfo where  UserNo='" + user_no + "'";

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql+ deletelimit, null);
            return rows;
        }

        /// <summary>
        /// 修改最后登录时间
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static int UpdateUserLoginTime(mg_userModel model)
        {
            string sql = "UPDATE [Sys_UserInfo] SET lastlogintime=getdate() WHERE user_no='" + model.user_no + "'";

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);
            return rows;
        }

        /// <summary>
        /// 检查90天是否修改密码
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static int CheckUserPwd(string user)
        {
            string sql = "select * from Sys_UserInfo WHERE user_no='" + user + "' and lasteditpwdtime is null and DATEDIFF(day,createtime,getdate())>=90";

            DataTable dt = SqlHelper.GetDataDataTable(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql.ToString(), null);
            if (dt.Rows.Count > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            //int rows = SqlHelper.ExecuteNonQuery(SqlHelper.SqlConnString, System.Data.CommandType.Text, sql, null);

        }
    }
}

