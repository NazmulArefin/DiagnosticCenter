using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagnostcCenterBillManagementApp.DLL.Model
{
    [Serializable]
    public class Bill
    {
        public int Id { get; set; }
        public string PatientId { get; set; }
        public string BillNo { get; set; }
        public string PatientName { get; set; }
        public string DateOfBirth { get; set; }
        public string Mobile { get; set; }
        public int TestId { get; set; }
        public string TestName { get; set; }
        public double Fee { get; set; }
        public double Total { get; set; }
        public string DateTime { get; set; }
    }
}