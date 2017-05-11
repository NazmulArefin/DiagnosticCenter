using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnostcCenterBillManagementApp.BLL;
using DiagnostcCenterBillManagementApp.DLL.Model;
using PdfSharp.Drawing;
using PdfSharp.Pdf;

namespace DiagnostcCenterBillManagementApp.UI
{
    public partial class TestWiseReportUI : System.Web.UI.Page
    {
        TestManager testManager = new TestManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void showButton_Click(object sender, EventArgs e)
        {
            string fromDate = fromDateTextBox.Text;
            string toDate = toDateTextBox.Text;
            double calculateTotal = 0;

            List<Report> reportList = testManager.GetTestReport(fromDate, toDate);
            ViewState["Report"] = reportList; 

            testWiseGridView.DataSource = reportList;
            testWiseGridView.DataBind();

            foreach (Report report in reportList)
            {
                calculateTotal += report.TotalAmount;
            }
            ViewState["TotalAmount"] = calculateTotal; 
            TotalTextBox.Text = calculateTotal.ToString();

            pdfButton.Enabled = true; 
        }
        protected void pdfButton_Click(object sender, EventArgs e)
        {
            int yPoint = 0;
            bool isFirst = true; 
            double Total = (double) ViewState["TotalAmount"];

            DateTime epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);   //generating uniqe report no
            long ms = (long)(DateTime.UtcNow - epoch).TotalMilliseconds;

            long reportNumber = ms; 


            PdfDocument pdf = new PdfDocument();
            pdf.Info.Title = "Patient Report";
            PdfPage pdfPage = pdf.AddPage();
            XGraphics graph = XGraphics.FromPdfPage(pdfPage);

            XFont font = new XFont("Verdana", 15, XFontStyle.Underline);
            graph.DrawString("Our Health Diagnostic Center", font, XBrushes.Black, new XRect(20, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopCenter);
            yPoint += 40;
            graph.DrawString("Report No: "+ reportNumber, font, XBrushes.Black, new XRect(25, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);

            yPoint = yPoint + 50;
            List<Report> aReports = (List<Report>) ViewState["Report"]; 
            foreach (Report report in aReports)
            {
                if (isFirst)
                {
                    font = new XFont("Verdana", 12, XFontStyle.Bold);
                    graph.DrawString("Test", font, XBrushes.Black, new XRect(20, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString("Number of Test", font, XBrushes.Black, new XRect(200, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    graph.DrawString("Amount (BDT)".ToString(), font, XBrushes.Black, new XRect(350, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                    yPoint += 40;
                    isFirst = false;
                }
                font = new XFont("Verdana", 10, XFontStyle.Italic);
                graph.DrawString(report.TestName, font, XBrushes.Black, new XRect(20, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                graph.DrawString(report.TotalNoOfTest.ToString(), font, XBrushes.Black, new XRect(250, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
                graph.DrawString(report.TotalAmount.ToString(), font, XBrushes.Black, new XRect(350, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);

                 yPoint += 40;
            }
            graph.DrawString("Total", font, XBrushes.Black, new XRect(250, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);
            graph.DrawString(Total.ToString(), font, XBrushes.Black, new XRect(350, yPoint, pdfPage.Width.Point, pdfPage.Height.Point), XStringFormats.TopLeft);

            bool exists = System.IO.Directory.Exists("C:/Bill");

            string pdfFileName = reportNumber + "_Patient_Report.pdf";
            if (!exists)
                System.IO.Directory.CreateDirectory("C:/Bill");

            pdf.Save("C:/Bill/" + pdfFileName);
            Process.Start(new System.Diagnostics.ProcessStartInfo()
            {
                FileName = "C:/Bill/" + pdfFileName,
                UseShellExecute = true,
                Verb = "open"
            });
            //pdf.Save("E:/BITM/Codes_Practice/DiagnostcCenterBillManagementApp/PDF/" + pdfFileName);
            //messageLabel.Text = "PDF saved to E:/BITM/Codes_Practice/DiagnostcCenterBillManagementApp";
        }
    }
}