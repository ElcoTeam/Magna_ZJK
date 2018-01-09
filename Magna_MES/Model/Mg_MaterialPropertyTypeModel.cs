using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Mg_MaterialPropertyTypeModel
    {
        public Mg_MaterialPropertyTypeModel()
        { }

        #region Model
        private int? _ID;
        private string _Prop_Type;
      
        /// <summary>
        /// 
        /// </summary>
        public int? ID
        {
            set { _ID = value; }
            get { return _ID; }
        }
       
        /// <summary>
        /// 
        /// </summary>
        public string Prop_Type
        {
            set { _Prop_Type = value; }
            get { return _Prop_Type; }
        }
        #endregion Model
    }

   
}
