using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class mg_MaterialPropertyModel
    {
        public mg_MaterialPropertyModel()
        { }

        #region Model
        private int? _prop_id;
        private int? _prop_type;
        private string _prop_name;
        /// <summary>
        /// 
        /// </summary>
        public int? prop_id
        {
            set { _prop_id = value; }
            get { return _prop_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Prop_type
        {
            set { _prop_type = value; }
            get { return _prop_type; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string prop_name
        {
            set { _prop_name = value; }
            get { return _prop_name; }
        }
        #endregion Model
    }

  
}
