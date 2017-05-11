using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Model;

namespace DiagnostcCenterBillManagementApp.DLL.Gateway
{
    public class UnpaidGateway: Gateway
    {
        public List<Bill> GetReport(string fromDate, string toDate)
        {
            List<Bill> billList = new List<Bill>();
            Query = "SELECT inn.BillNo BillNo, inn.Mobile, inn.Name, inn.TotalFee FROM (SELECT t.BillNo, t.Patient, t.TotalFee,pt.Mobile,pt.Name,ROW_NUMBER() OVER(PARTITION BY t.Patient ORDER BY t.Patient) num FROM TestPatient t JOIN PatientTable pt ON t.Patient = pt.Id where t.Date between '" + fromDate + "' and '" + toDate + "' and t.Payment = 'Unpaid') inn WHERE inn.num=1;";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            { 
                Bill aBill = new Bill();
                aBill.BillNo = Reader["BillNo"].ToString();
                aBill.PatientName = Reader["Name"].ToString();
                aBill.Mobile = Reader["Mobile"].ToString();
                aBill.Total = (double) Reader["TotalFee"]; 

                billList.Add(aBill);
            }
            Reader.Close();
            Connection.Close();
            return billList; 
        }
    }
}