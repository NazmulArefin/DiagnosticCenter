using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DiagnostcCenterBillManagementApp.DLL.Model;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.DLL.Gateway
{
    public class TypeGateway: Gateway
    {
        public int SaveType(string aType)
        {
            Query = "INSERT INTO TypeTable VALUES('" + aType+ "')";
            Command = new SqlCommand(Query,Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool IsTypeExist(string aType)
        {
            Query = "SELECT * FROM TypeTable WHERE TypeName = '"+aType+"'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsRowExist = false;
            if (Reader.HasRows)
            {
                IsRowExist = true; 
            }
            Reader.Close();
            Connection.Close();
            return IsRowExist; 
        }

        public List<Type> GetTypeList()
        {
            
            List<Type> aTypeList = new List<Type>();

            Query = "SELECT * FROM TypeTable";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Type aType = new Type();
                aType.Id = (int) Reader["Id"]; 
                aType.TypeName = Reader["TypeName"].ToString(); 
                aTypeList.Add(aType);
            }
            Reader.Close();
            Connection.Close();
            return aTypeList; 
        }
        public List<Report> GetReportOfType(string fromDate, string toDate)
        {

            List<Type> aList = GetTypeList();
            List<Report> allList = new List<Report>();

            foreach (Type report in aList)
            {
                Report aReport = new Report();
                aReport.TypeName = report.TypeName;
                Report aWiseReportlist = GetTotalTest(report.Id, fromDate, toDate);
                aReport.TotalNoOfType = aWiseReportlist.TotalNoOfType;
                aReport.TotalAmount = aWiseReportlist.TotalAmount;
                allList.Add(aReport);
            }
            return allList;
        }

        public Report GetTotalTest(int id, string fromDate, string toDate)
        {
            
            Report aReports = new Report();
            Query =
                "SELECT t.TypeName, count(th.TypeId) TypeNo, SUM(th.Fee) Fee from TestTable th JOIN TypeTable t ON th.TypeId = t.Id join TestPatient tp On tp.Test = th.Id Where tp.Date Between '" + fromDate + "' and '" + toDate + "' and t.Id = '"+id+"' GROUP BY t.TypeName";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (!Reader.HasRows)
            {
                aReports.TotalNoOfTest = 0;
                aReports.TotalAmount = 0;
            }
            if (Reader.Read())
            {
                aReports.TotalNoOfType = (int)Reader["TypeNo"];
                aReports.TotalAmount = (double)Reader["Fee"];
            }
            //while (Reader.Read())
            //{
            //    Report aReport = new Report();
            //    aReport.TypeName = Reader["TypeName"].ToString();
            //    aReport.TotalNoOfType = (int)Reader["TypeNo"];
            //    aReport.TotalAmount = (double)Reader["Fee"];
            //    typeReports.Add(aReport);
            //}
            Reader.Close();
            Connection.Close();
            return aReports;
        }

    }
}