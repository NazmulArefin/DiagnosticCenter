using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Gateway;
using DiagnostcCenterBillManagementApp.DLL.Model;

namespace DiagnostcCenterBillManagementApp.BLL
{
    public class UnpaidManager
    {
        UnpaidGateway unpaidGateway = new UnpaidGateway();
        public List<Bill> GetReport(string fromDate, string toDate)
        {
            List<Bill> aReports = unpaidGateway.GetReport(fromDate, toDate);
            return aReports; 

        }
    }
}