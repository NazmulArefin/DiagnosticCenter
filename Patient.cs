using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagnostcCenterBillManagementApp.DLL.Model
{
    public class Patient
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DateOfBirth { get; set; }
        public string Mobile { get; set; }
        public int Bill { get; set; }

       
    }
}