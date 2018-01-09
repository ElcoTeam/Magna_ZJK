
using System;
using System.Web;
using Bll;
using Model;
using Tools;

public class AllPartHandler : IHttpHandler
{




///1.显示列表：
///page第几页
///pagesize一页显示条目
///1.当时首页时


string sql="SELECT top " + pagesize + @" [all_id]
                                  ,[all_no]
                                  ,[all_rateid]
                                  ,r.prop_name [all_ratename]
                                  ,[all_colorid]
                                  ,c.prop_name [all_colorname]
                                  ,[all_metaid]
                                  ,m.prop_name [all_metaname]
                                  ,[all_desc]
                              FROM  [mg_allpart] a
                              left join mg_Property r on a.all_rateid=r.prop_id
                              left join mg_Property c on a.all_colorid=c.prop_id
                              left join mg_Property m on a.all_metaid=m.prop_id
	                            order by a.all_id desc"



///2.非首页
string sql="SELECT top " + pagesize + @" [all_id]
                                  ,[all_no]
                                  ,[all_rateid]
                                  ,r.prop_name [all_ratename]
                                  ,[all_colorid]
                                  ,c.prop_name [all_colorname]
                                  ,[all_metaid]
                                  ,m.prop_name [all_metaname]
                                  ,[all_desc]
                              FROM  [mg_allpart] a
                              left join mg_Property r on a.all_rateid=r.prop_id
                              left join mg_Property c on a.all_colorid=c.prop_id
                              left join mg_Property m on a.all_metaid=m.prop_id
                                where  a.all_id < (
                                                select top 1 all_id from 
                                                        (select top ((" + page + @"-1)*" + pagesize + @") all_id from  [mg_allpart] where all_id is not null  order by all_id desc )t
                                                order by  all_id  )
                                
	                            order by a.all_id desc"



///关系树
///key=p.part_id
///id=列表选择项all_id

string sql= @"SELECT ap.[all_id]
                              ,ap.[all_no]
                             ,p.part_id
	                         ,p.part_no
	                         ,b.bom_id
	                         ,b.bom_PN
	                         ,b.bom_customerPN
                          FROM [mg_allpart] ap
                          inner join [mg_allpart_part_rel] aprel on ap.all_id = aprel.all_id
                          inner join [mg_part] p on aprel.partid_id=p.part_id
                          inner join [mg_part_bom_rel] pbrel on p.part_id=pbrel.part_id
                          inner join [mg_BOM] b on pbrel.bom_id=b.bom_id

                          where " + key + @"=" + id + @"

}