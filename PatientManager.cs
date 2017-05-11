using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnostcCenterBillManagementApp.DLL.Gateway;
using DiagnostcCenterBillManagementApp.DLL.Model;

namespace DiagnostcCenterBillManagementApp.BLL
{
    public class PatientManager
    {
        private string message;
        PatientGateway aPatientGateway = new PatientGateway();

        public string GetFee(int testId)
        {
            string fee;
            return fee = aPatientGateway.GetFee(testId); 
        }

        public string AddBill(Bill aBill)
        {
            int testId = aPatientGateway.GetTestId(aBill.TestName);
            aBill.TestId = testId; 
            int rowAffected = aPatientGateway.AddBill(aBill);
            if (rowAffected > 0)
                message = "Bill Added";
            else
            {
                message = "Bill not added";
            }
            return message;
        }

        public List<Bill> GetBill(string BillNo)
        {
            List<Bill> aBillList= aPatientGateway.GetBill(BillNo);
            return aBillList; 
        }

        public string SavePatient(Patient aPatient)
        {
            if (!aPatientGateway.mobileNoExist(aPatient))
            {
                if (aPatient.Mobile.Length == 11)
                {
                    if (aPatient.DateOfBirth != null)
                    {
                        int rowAffected = aPatientGateway.SavePatient(aPatient);
                        if (rowAffected > 0)
                            message = "Patient saved";
                        else
                        {
                            message = "Patient not saved";
                        }
                    }
                    else
                    {
                        message = "Give date of Birth"; 
                    }
                    
                }
                else
                {
                    message = "Mobile number should have 11 digits"; 
                }
               
            }
            else
            {
                message = "Same Mobile Number"; 
            }
            return message; 
        }

        public string GetPatientId(string mobileNo)
        {
            string id = aPatientGateway.GetPatientId(mobileNo);
            return id; 
        }

        public string UpdateBill(string billNo)
        {
            long rowAffected = aPatientGateway.UpdateBill(billNo);
            if (rowAffected > 0)
                message = "Bill Updated";
            else
            {
                message = "Bill Not Updated"; 
            }
            return message;
        }
        public List<Bill> GetPaymentByBill(string billNo)
        {
            List<Bill> aBill = new List<Bill>();
            if (aPatientGateway.IsBillPaid(billNo) != true)
            {
                aBill = aPatientGateway.GetPaymentByBill(billNo);
            }
            return aBill;
        }

        public List<Bill> GetPaymentByMobile(string mobile)
        {
            string billNo = aPatientGateway.GetBillNo(mobile);
            List<Bill> aBill = new List<Bill>();
            if (aPatientGateway.IsBillPaid(billNo) != true)
            {
                aBill = aPatientGateway.GetPaymentByBill(billNo); 
            }
            return aBill;
        }
    }
}