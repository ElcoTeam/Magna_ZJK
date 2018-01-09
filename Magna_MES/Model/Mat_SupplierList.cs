using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Mat_SupplierListModel
    {
        public Mat_SupplierListModel()
        { }

        #region Model
        private int? _id;
        private int? _supplierid;
        private string _suppliername;
        private int? _warehouseid;
        /// <summary>
        /// 
        /// </summary>
        public int? id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? supplierid
        {
            set { _supplierid = value; }
            get { return _supplierid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string suppliername
        {
            set { _suppliername = value; }
            get { return _suppliername; }
        }



        /// <summary>
        /// 
        /// </summary>
        public int? warehouseid
        {
            set { _warehouseid = value; }
            get { return _warehouseid; }
        }
        #endregion Model
    }

}
