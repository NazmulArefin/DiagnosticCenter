using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Gateway;
using DiagnostcCenterBillManagementApp.DLL.Model;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.BLL
{
    public class TypeManager
    {
        TypeGateway aTypeGateway = new TypeGateway();
        private string message; 
        public string SaveType(string aType)
        {
            if (aTypeGateway.IsTypeExist(aType))
                message = "Type Exist";
            else
            {
                int rowAffected = aTypeGateway.SaveType(aType);
                if (rowAffected > 0)
                    message = "Type Saved";
                else
                {
                    message = "Not saved"; 
                }
            }
            return message; 
        }

        public List<Type> TypeListed()
        {
            List<Type> aTypes = aTypeGateway.GetTypeList();
            return aTypes; 
        }
        public List<Report> GetTypeReport(string fromDate, string toDate)
        {
            List<Report> typeReports = aTypeGateway.GetReportOfType(fromDate, toDate);

            if (typeReports.Count == 0)
            {
                List<DLL.Model.Type> types = aTypeGateway.GetTypeList();
                List<Report> aReportList = new List<Report>();
                foreach (DLL.Model.Type type in types)
                {
                    Report aReport = new Report();
                    aReport.TypeName = type.TypeName;
                    aReportList.Add(aReport);
                }
                return aReportList;
            }
            else
            {
                return typeReports;
            }
        }
    }
}