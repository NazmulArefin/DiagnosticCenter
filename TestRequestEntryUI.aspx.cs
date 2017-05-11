using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnostcCenterBillManagementApp.BLL;
using DiagnostcCenterBillManagementApp.DLL.Model;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.UI
{
    public partial class TestRequestEntryUI : System.Web.UI.Page
    {
        TestManager aTestManager = new TestManager();
        PatientManager aPatientManager = new PatientManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                testDropDownList.DataSource = aTestManager.GetData("getTest", null);
                testDropDownList.DataTextField = "TestName";
                testDropDownList.DataValueField = "Id";
                testDropDownList.DataBind();
                testDropDownList.Items.Insert(0, "Select Test");
                
            }
        }

        protected void addBillButton_Click(object sender, EventArgs e)
        {
            Bill aBill =new Bill();
            aBill.TestName = testDropDownList.SelectedItem.Text;
            aBill.Fee = Convert.ToDouble(feeTextBox.Text);
            double total = 0; 

            if (ViewState["Bill"] == null)
            {
                List<Bill> newBill = new List<Bill>();
                newBill.Add(aBill);
                ViewState["Bill"] = newBill;
            }
            else
            {
                List<Bill> newBill = (List<Bill>) ViewState["Bill"];
                newBill.Add(aBill);
                ViewState["Bill"] = newBill;
            }

            List<Bill> aBillsList = (List<Bill>)ViewState["Bill"];
            foreach (Bill bill in aBillsList)
            {
                total = total + bill.Fee;
            }

            ViewState["Total"] = total;

            totalTextBox.Text = total.ToString(); 
            GetBillGridValue();
            saveBillButton.Enabled = true;
        }
     
        private void GetBillGridValue()
        {
            List<Bill> aBillsList = (List<Bill>) ViewState["Bill"];
            testRequestEntryGridView.DataSource = aBillsList;
            testRequestEntryGridView.DataBind();
        }
      
        protected void testDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int test = testDropDownList.SelectedIndex; 
            feeTextBox.Text = aPatientManager.GetFee(test);
            if (ViewState["date"] == null)
            {
                string date = Request.Form["datepicker"];
                ViewState["date"] = date;
            }
        }


        protected void saveBillButton_Click(object sender, EventArgs e)
        {
            Patient aPatient = new Patient();
            aPatient.Name = nameOfPatientTextBox.Text;
            aPatient.DateOfBirth = dateTextBox.Text; 
            aPatient.Mobile = mobileTextBox.Text;
            string patientSaved = aPatientManager.SavePatient(aPatient);
             
            Bill aBill = new Bill();
            List<Bill> aBillList = (List<Bill>)ViewState["Bill"];

            string billSave = "";
            if (patientSaved == "Patient saved")
            {
                DateTime epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
                long ms = (long)(DateTime.UtcNow - epoch).TotalMilliseconds;
                ViewState["BillNo"] = ms.ToString(); 

                foreach (Bill Bill in aBillList)
                {
                    aBill.TestName = Bill.TestName;
                    aBill.Fee = Bill.Fee;
                    aBill.BillNo = ms.ToString();
                    aBill.Total = (double)ViewState["Total"];
                    aBill.PatientId = aPatientManager.GetPatientId(aPatient.Mobile);
                    DateTime dateTime = DateTime.UtcNow.Date;
                    aBill.DateTime = dateTime.ToString("MM/dd/yyyy"); 
                    //aBill.DateTime = DateTime.Now.ToString("MM/dd/yyyy");

                    billSave = aPatientManager.AddBill(aBill);
                }
                if (billSave == "Bill not added")
                    patientMessageLabel.Text = "Not Saved";
                else
                {
                    patientMessageLabel.Text = "Saved";
                    GetBillPDF(aBill.BillNo); 
                    
                }
            }
            else
            {
                patientMessageLabel.Text = patientSaved; 
            }
            clear();
        }

        private void clear()
        {
            nameOfPatientTextBox.Text = "";
            mobileTextBox.Text = "";
            dateTextBox.Text = ""; 
            feeTextBox.Text = "";
            totalTextBox.Text = "";
            testDropDownList.ClearSelection();

            ViewState["Bill"] = null; 
            List<Bill> aBillsList = (List<Bill>)ViewState["Bill"];
            testRequestEntryGridView.DataSource = aBillsList;
            testRequestEntryGridView.DataBind();
            

        }

        private void GetBillPDF(string BillNo)
        {
            int yPoint = 0;
            bool isFirst = true;
            double total = 0; 

            List<Bill> aBillsList = (List<Bill>)ViewState["Bill"];
            foreach (Bill bill in aBillsList)
            {
                total = total + bill.Fee;
            }

            string pdfFileName = BillNo;
            PdfDocument pdf = new PdfDocument();
            pdf.Info.Title = "Patient bill information";
            PdfPage pdfPage = pdf.AddPage();
            XGraphics graph = XGraphics.FromPdfPage(pdfPage);

            XFont font = new XFont("Verdana", 15, XFontStyle.Underline);
            graph.DrawString("Our Health Diagnostic Center", font, XBrushes.Black, new XRect(20, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopCenter);
            yPoint += 40;
            graph.DrawString("Patient Bill No", font, XBrushes.Black, new XRect(5, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
            string billNo = (string) ViewState["BillNo"]; 
            graph.DrawString(billNo, font, XBrushes.Black, new XRect(120, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                     
            yPoint += 40;
            
            yPoint = yPoint + 40;
            List<Bill> getBillList = aPatientManager.GetBill(BillNo);
            foreach (Bill billList in getBillList)
            {
                if (isFirst)
                {
                    pdfFileName = billList.BillNo + "_" + "Patient_bill.pdf";

                    font = new XFont("Verdana", 12, XFontStyle.Bold);
                    yPoint = yPoint + 50;
                    graph.DrawString("Name", font, XBrushes.Black, new XRect(20, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString("Date Of Birth", font, XBrushes.Black, new XRect(100, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString("Mobile".ToString(), font, XBrushes.Black, new XRect(250, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString("Test Name", font, XBrushes.Black, new XRect(350, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString("Fee", font, XBrushes.Black, new XRect(500, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    yPoint += 40;

                    font = new XFont("Verdana", 10, XFontStyle.Italic);
                    graph.DrawString(billList.PatientName, font, XBrushes.Black, new XRect(20, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString(billList.DateOfBirth, font, XBrushes.Black, new XRect(100, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString(billList.Mobile.ToString(), font, XBrushes.Black, new XRect(250, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);

                    isFirst = false; 
                }
                graph.DrawString(billList.TestName, font, XBrushes.Black, new XRect(350, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                graph.DrawString(billList.Fee.ToString(), font, XBrushes.Black, new XRect(500, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                yPoint += 40; 
            }
            graph.DrawString("Total", font, XBrushes.Black, new XRect(450, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
            graph.DrawString(total.ToString(), font, XBrushes.Black, new XRect(500, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
            
            
            //bool exists = System.IO.Directory.Exists("C:/Bill");

            //string pdfFileName = reportNumber + "_Patient_Report.pdf";
            //if (!exists)
               // System.IO.Directory.CreateDirectory("C:/Bill");

            pdf.Save("E:/BITM/Codes_Practice/DiagnostcCenterBillManagementApp/PDF/" + pdfFileName);
            Process.Start(new System.Diagnostics.ProcessStartInfo()
            {
                FileName = "E:/BITM/Codes_Practice/DiagnostcCenterBillManagementApp/PDF/" + pdfFileName,
                UseShellExecute = true,
                Verb = "open"
            });
            

            //pdf.Save("E:/BITM/Codes_Practice/DiagnostcCenterBillManagementApp/PDF/" + pdfFileName);
        }

    }
}