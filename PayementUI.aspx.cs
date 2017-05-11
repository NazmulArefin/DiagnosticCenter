using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnostcCenterBillManagementApp.BLL;
using DiagnostcCenterBillManagementApp.DLL.Model;
using Microsoft.Ajax.Utilities;

namespace DiagnostcCenterBillManagementApp
{
    public partial class PayementUI : System.Web.UI.Page
    {
        PatientManager patientManager = new PatientManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (billNoTextBox.Text == "")
            {
                string mobileNo = mobileNoTextBox.Text;
                List<Bill> aBillsList = patientManager.GetPaymentByMobile(mobileNo);
                ViewState["bill"] = aBillsList;

                if (aBillsList.Count > 0)
                {
                    foreach (Bill bill in aBillsList)
                    {
                        amountTextBox.Text = bill.Total.ToString();
                        dueDateTextBox.Text = bill.DateTime;
                    }
                    payButton.Enabled = true;
                }
                else
                {
                    messageLabel.Text = "Paid Already";
                }
                
            }
            else if(mobileNoTextBox.Text == "")
            {
                string billNo = billNoTextBox.Text;
                List<Bill> aBill = patientManager.GetPaymentByBill(billNo);
                //aBill.PatientId = billNo; 
                ViewState["bill"] = aBill;
                if (aBill.Count > 0)
                {
                    foreach (Bill bill in aBill)
                    {
                        amountTextBox.Text = bill.Total.ToString();
                        dueDateTextBox.Text = bill.DateTime;
                    }
                    payButton.Enabled = true;
                }
                else
                {
                    messageLabel.Text = "Paid Already";
                }
                
            }
            else
            {
                return;
            }
            
        }

        protected void payButton_Click(object sender, EventArgs e)
        {
            Clear();
            List<Bill> aBill = (List<Bill>)ViewState["bill"];
            string updated = "";
            foreach (Bill bill in aBill)
            {
                updated = patientManager.UpdateBill(bill.BillNo);
            }
            if (updated == "Bill Not Updated")
                messageLabel.Text = "Not Paid";
            else
            {
                messageLabel.Text = "Paid"; 
            }
        }

        private void Clear()
        {
            billNoTextBox.Text = "";
            mobileNoTextBox.Text = "";
            amountTextBox.Text = "";
            dueDateTextBox.Text = "";
            messageLabel.Text = ""; 
        }

        protected void billNoTextBox_TextChanged(object sender, EventArgs e)
        {
            if (billNoTextBox.Text != "")
                mobileNoTextBox.Enabled = false;
            else
            {
                mobileNoTextBox.Enabled = true; 
            }

        }

        protected void mobileNoTextBox_TextChanged(object sender, EventArgs e)
        {
            if (mobileNoTextBox.Text != "")
                billNoTextBox.Enabled = false;
            else
            {
                billNoTextBox.Enabled = true;
            }
        }
    }
}