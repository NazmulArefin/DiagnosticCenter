<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayementUI.aspx.cs" Inherits="DiagnostcCenterBillManagementApp.PayementUI" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>
    <link href="../reset.css" rel="stylesheet" />
    <link href="../paymentCss.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="../font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <header> 
        <div class="logo">
            <img src="../logo.PNG" />
        </div>
        <div class="cover"></div>
        <div class="clear-fix"></div>
    </header>
    <nav>
        <ul>
            <a href="IndexOfDiagnosticUI.aspx">
                <li><i class="fa fa-home" aria-hidden="true" style="font-size: 22px; align-content: center; color: white;"></i></li>
            </a>
            <a href="AbouUs.aspx"><li>About us</li></a>
            <a href="#"><li>Call us</li></a>
            <a href="#"><li>Email</li></a>
            <a href="#"><li>Facebook Page</li></a>
            <a href="#"><li>Tweeter</li></a>
            <a href="#"><li>LinkedIn</li></a>
            <a href="#"><li>Branches</li></a>
            <li><i class="fa fa-search" aria-hidden="true" style="color: white; "></i></li>
            
        </ul>
    </nav>
        <div class="wrapper">
        <aside> 
             <ul>
            <a href="TypeSetupUI.aspx">
                <li>Type Setup</li>
            </a>
            <a href="TestSetupUI.aspx">
                <li>Test Setup</li>
            </a>
            <a href="TestRequestEntryUI.aspx">
                <li>Test Request</li>
            </a>
            <a href="PayementUI.aspx">
                <li>Payment</li>
            </a>
            <a href="TestWiseReportUI.aspx"><li>Test Wise Report</li></a>
            <a href="TypeWiseReportUI.aspx"><li>Type Wise Report</li></a>
            <a href="UnpaidBillReport.aspx">
                <li>Unpaied Bill Report</li>
            </a>
        </ul>
        </aside>
        <div class="main-content">
             <form id="form1" runat="server">
                 <div class="form_head">
                     <h1>Payment</h1>
                 </div>
                <div class="form_div">
                    
                    <label>Bill No</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="billNoTextBox" runat="server" OnTextChanged="billNoTextBox_TextChanged"></asp:TextBox>
                    <label>&nbsp;&nbsp;</label><br />
                    <br />
                    <label>Mobile No</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="mobileNoTextBox" runat="server" OnTextChanged="mobileNoTextBox_TextChanged"></asp:TextBox>
            
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                    <br />
                    <br />
                    <label>Amount</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="amountTextBox" runat="server"></asp:TextBox>
                    <label>
                    <br />
                    <br />
                    Due date</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="dueDateTextBox" runat="server" style="margin-left: 1px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                    <asp:Button type="submit" ID="payButton" runat="server" Text="Pay" OnClick="payButton_Click" Enabled="False" Width="61px" />

                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                    <br />
                    <br />
            </div>
        </form>
        </div>
        <div class="right-aside"></div>
        <div class="clear-fix"></div>
        <div class="footer">
            <i class="fa fa-copyright" aria-hidden="true"></i>
            BugSolver 2016
        </div>
    </div>
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function() {

            $("#payButton").click(function() {
                
            });
        });
    </script>
</body>
</html>
