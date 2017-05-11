using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Model;

namespace DiagnostcCenterBillManagementApp.DLL.Gateway
{
    public class PatientGateway: Gateway
    {
        public string GetFee(int testId)
        {
            Query = "SELECT * FROM TestTable WHERE Id = '" + testId + "'";
            Command = new SqlCommand(Query, Connection);

            Connection.Open();
            Reader = Command.ExecuteReader();

            string fee = null;
            while (Reader.Read())
            {
                fee = Reader["Fee"].ToString();
            }
            Reader.Close();
            Connection.Close();
            return fee;
        }


        public bool mobileNoExist(Patient aPatient)
        {
            Query = "SELECT * FROM PatientTable WHERE Mobile = '" + aPatient.Mobile + "'";
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

        public int SavePatient(Patient aPatient)
        {
            Query = "INSERT INTO PatientTable VALUES('" + aPatient.Name + "','" + aPatient.DateOfBirth + "', '"+aPatient.Mobile+"')";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected; 
        }

        public string GetBillNo(string mobileNo)
        {
            Query = "Select tp.BillNo from PatientTable pt join TestPatient tp on pt.Id = tp.Patient where pt.Mobile = '"+mobileNo+"'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            string billNo = "";
            while (Reader.Read())
            {
                billNo = Reader["BillNo"].ToString(); 
            }
            Reader.Close();
            Connection.Close();
            return billNo; 
        }

        public int AddBill(Bill aBill)
        {
            Query = "INSERT INTO TestPatient VALUES('" + aBill.PatientId + "','" + aBill.BillNo + "','" + aBill.TestId + "', '" + aBill.Total + "', '" + aBill.DateTime + "', 'Unpaid')";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected; 
        }

        public List<Bill> GetBill(string BillNo)
        {
            List<Bill> aBillList = new List<Bill>();
            Query = "SELECT p.Name, p.DateOfBirth, p.Mobile,  t.TestName Test, t.Fee From PatientTable p JOIN TestPatient Tp ON p.Id = Tp.Patient Join TestTable t On Tp.Test = t.Id Where Tp.BillNo = '"+BillNo+"'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Bill aBill = new Bill();
                aBill.BillNo = BillNo;
                aBill.PatientName = Reader["Name"].ToString();
                aBill.DateOfBirth = Reader["DateOfBirth"].ToString();
                aBill.Mobile = Reader["Mobile"].ToString();
                aBill.TestName = Reader["Test"].ToString();
                aBill.Fee = (double) Reader["Fee"];
                aBillList.Add(aBill);
            }
            Reader.Close();
            Connection.Close();
            return aBillList;
        }
        public List<Bill> GetPaymentByBill(string billNo)
        {
            List<Bill> billList = new List<Bill>();
            Query = "SELECT TotalFee, Date FROM TestPatient Where BillNo = '" + billNo + "'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Bill aBill = new Bill();

                aBill.BillNo = billNo; 
                aBill.Total = Convert.ToDouble(Reader["TotalFee"]);
                aBill.DateTime = Reader["Date"].ToString();
                billList.Add(aBill);
            }
            Reader.Close();
            Connection.Close();
            return billList;
        }
     
        public long UpdateBill(string billNo)
        {
            Query = "update TestPatient set Payment = 'paid' where BillNo = '"+billNo+"'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected; 
        }

        public int GetTestId(string TestName)
        {
            Query = "SELECT * FROM TestTable WHERE TestName = '"+TestName+"'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            int id = 0;
            while (Reader.Read())
            {
                id = (int)Reader["Id"];
            }
            Reader.Close();
            Connection.Close();
            return id; 
        }

        public bool IsBillPaid(string billNo)
        {
            Query = "SELECT * FROM TestPatient WHERE BillNo = '" + billNo + "' and Payment = 'paid'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool exist = false;
            if (Reader.HasRows)
                exist = true; 
            Reader.Close();
            Connection.Close();
            return exist; 
        }

        public string GetPatientId(string mobileNo)
        {
            Query = "SELECT Id FROM PatientTable WHERE Mobile = '" + mobileNo + "'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            string id = "";
            while (Reader.Read())
            {
                id = Reader["Id"].ToString();
            }
            Reader.Close();
            Connection.Close();
            return id; 
        }
    }
}