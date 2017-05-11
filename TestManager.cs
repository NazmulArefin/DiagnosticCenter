using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Gateway;
using DiagnostcCenterBillManagementApp.DLL.Model;
using DiagnostcCenterBillManagementApp.UI;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.BLL
{
    public class TestManager
    {
        TestGateway aTestGateway = new TestGateway();

        private string message;
        public string SaveTest(Test aTest)
        {
            if (aTestGateway.IsTestExist(aTest))
                message = "Test Exist";
            else
            {
                int rowAffected = aTestGateway.SaveTest(aTest);
                if(rowAffected > 0)
                    message = "Test Saved Successfully";
                else
                {
                    message = "Not saved"; 
                }
            }
            return message; 
        }
        public List<Report> GetTestReport(string fromDate, string toDate)
        {
            List<Report> testReports = aTestGateway.GetReport(fromDate, toDate);

            if (testReports.Count == 0)
            {
                List<Test> testList = aTestGateway.GetTestList();
                List<Report> aReportList = new List<Report>();
                foreach (Test test in testList)
                {
                    Report aReport = new Report();
                    aReport.TestName = test.TestName;
                    aReportList.Add(aReport);
                }
                return aReportList;
            }
            else
            {
                return testReports;
            }
        }
        //public List<Report> GetTestReport(string fromDate, string toDate)
        //{
        //    string[] testReport = aTestGateway.GetReport(fromDate, toDate);
        //    List<Report> reportsList = new List<Report>();

        //    if (testReport.Length == 0)
        //    {
        //        List<Test> aReports = aTestGateway.GetTestList();
        //        foreach (Test test in aReports)
        //        {
        //            Report aReport = new Report();
        //            aReport.TestName = test.TestName;
        //            reportsList.Add(aReport);
        //        }
        //    }
        //    else
        //    {
        //        int i = 0;
        //        while (i < testReport.Length - 1)
        //        {
        //            Report aReport = new Report();
        //            aReport.TestName = testReport[i];
        //            int count = 1;
        //            for (int j = i + 1; j < testReport.Length; j++) //for calculateing multiple test_names in the table
        //            {
        //                if (testReport[i] == testReport[j])
        //                {
        //                    count++;
        //                }
        //                else
        //                {
        //                    break;
        //                }
        //            }
        //            aReport.TotalNoOfTest = count;
        //            aReport.TotalAmount = count * aTestGateway.TestFee(aReport.TestName);
        //            reportsList.Add(aReport);
        //            i += count;
        //        }
        //    }
        //    return reportsList;
        //}

        public List<Test> TestListed()
        {
            List<Test> tests = aTestGateway.GetTestList();
            return tests;
        }

        public DataSet GetData(string gettestname, SqlParameter SPParameter)
        {
            DataSet ds = aTestGateway.GetData(gettestname, SPParameter);
            return ds; 
        }
    }
}