using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Mg_PropertyTypeModel
    {
        public Mg_PropertyTypeModel()
        { }

        #region Model
        private int? _id;
        private string _prop_type;       
        /// <summary>
        /// 
        /// </summary>
        public int? ID
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Prop_Type
        {
            set { _prop_type = value; }
            get { return _prop_type; }
        }
      
        #endregion Model
    }

 
}
