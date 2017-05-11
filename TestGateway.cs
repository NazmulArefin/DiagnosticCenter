using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Model;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.DLL.Gateway
{
    public class TestGateway: Gateway
    {
        public int SaveTest(Test aTest)
        {
            Query = "INSERT INTO TestTable VALUES('" + aTest.TestName + "','"+aTest.Fee+"', '"+aTest.TestType+"')";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected; 
        }

        public bool IsTestExist(Test aTest)
        {
            Query = "SELECT * FROM TestTable WHERE TestName = '" + aTest.TestName + "'";
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
       
        public List<Report> GetReport(string fromDate, string toDate)
        {

            List<Test> aList = GetTestList();
            List<Report> allList = new List<Report>();

            foreach (Test report in aList)
            {
                Report aReport = new Report();
                aReport.TestName = report.TestName;
                Report aWiseReportlist = GetTotalTest(report.Id, fromDate, toDate);
                aReport.TotalNoOfTest = aWiseReportlist.TotalNoOfTest;
                aReport.TotalAmount = aWiseReportlist.TotalAmount;
                allList.Add(aReport);
            }
            return allList;
        }
        private Report GetTotalTest(int reportId, string fromDate, string toDate)
        {
            Query = "select t.TestName, COUNT(tp.Test) TotalTest, SUM(t.Fee) TotalFee from TestTable t join TestPatient tp on t.Id = tp.Test where tp.Date between '"+fromDate+"' and '"+toDate+"' AND t.Id = '"+reportId+"' Group by t.TestName";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Report aReport = new Report();
            if (!Reader.HasRows)
            {
                aReport.TotalNoOfTest = 0;
                aReport.TotalAmount = 0;
            }
            else
            {
                Reader.Read();
                aReport.TotalNoOfTest = (int)Reader["TotalTest"];
                aReport.TotalAmount = (double)Reader["TotalFee"];
            }
            Reader.Close();
            Connection.Close();
            return aReport;
        }


        private int NumberOfTests(string fromDate, string toDate)
        {
            int count = 0;
            Query = "SELECT t.TestName Test FROM TestTable t Join TestPatient tp On t.Id = tp.Test Where Date BETWEEN '" + fromDate + "' AND '" + toDate + "' ORDER BY Test";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                count++;
            }
            Reader.Close();
            Connection.Close();
            return count;
        }

        public List<Test> GetTestList()
        {
            List<Test> getTestList = new List<Test>();
            
            Query = "SELECT test.Id, test.TestName, test.Fee, type.TypeName FROM TestTable test JOIN TypeTable type ON test.TypeId = type.Id Order by test.TestName";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Test aTest = new Test();
                
                aTest.Id = (int)Reader["Id"];
                aTest.TestName = Reader["TestName"].ToString();
                aTest.Fee = Convert.ToDouble(Reader["Fee"]);
                aTest.TypeName = Reader["TypeName"].ToString();
                getTestList.Add(aTest);
            }
            Reader.Close();
            Connection.Close();
            return getTestList;
        }

        public DataSet GetData(string SPname, SqlParameter SPParameter)
        {
            SqlDataAdapter da = new SqlDataAdapter(SPname, Connection);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParameter != null)
                da.SelectCommand.Parameters.Add(SPParameter);
            DataSet Ds = new DataSet();
            da.Fill(Ds);
            return Ds; 
        }

        public double TestFee(string testName)
        {
            double fee = 0;  
            Query = "SELECT Fee FROM TestTable Where TestName = '"+testName+"'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                 fee = (double)Reader["Fee"];
            }
            Reader.Close();
            Connection.Close();
            return fee;
        }
    }
}