using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagnostcCenterBillManagementApp.DLL.Model
{
    [Serializable]
    public class Report
    {
        public string TestName { get; set; }
        public string TypeName { get; set; }
        public int TotalNoOfTest { get; set; }
        public int  TotalNoOfType { get; set; }
        public double TotalAmount { get; set; }
        public string Mobile { get; set; }
        public string PatientName { get; set; }
        public int Id { get; set; }


    }
}