<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnpaidBillReport.aspx.cs" Inherits="DiagnostcCenterBillManagementApp.UI.UnpaidBillReport" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>
    <link href="../reset.css" rel="stylesheet" />
    <link href="../TypeSetupCss.css" rel="stylesheet" />
    <link href="../GridViewCSS.css" rel="stylesheet" />
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
            <a href="+8801836095554"><li>Call us</li></a>
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
             <div class="form_head">Unpaied Bill Report</div>
                <div class="form_div">
                    <fieldset>

                        <br />

                    <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="fromDateTextBox" runat="server"></asp:TextBox>
                        <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<asp:TextBox ID="toDateTextBox" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="showButton" runat="server" Text="Show" OnClick="showButton_Click" />
                    &nbsp;&nbsp;
                    <a href="IndexOfDiagnosticUI.aspx" style="text-decoration: none; color: #008b8b">Home</a><br />
                    <br />
                    <asp:GridView ID="unpaidGridView" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"  AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="494px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate>
                                             <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bill Number">
                                        <ItemTemplate>
                                            <asp:Label runat="server"> <%#Eval("BillNo") %> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Number">
                                        <ItemTemplate>
                                            <asp:Label runat="server"> <%#Eval("Mobile") %> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label runat="server"> <%#Eval("PatientName") %> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total Fee">
                                        <ItemTemplate>
                                            <asp:Label runat="server"> <%#Eval("Total") %> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="pdfButton" runat="server" Text="PDF" Enabled="False" OnClick="pdfButton_Click1" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Total"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="totalTextBox" runat="server"></asp:TextBox>
    
                        <br />
    
                        <br />
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="messageLabel" runat="server"></asp:Label>
    
                    <br />
                 </fieldset>
                </div>
                </form>
            </div>
    </div>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
   <script>

       $(function () {
           $("#fromDateTextBox").datepicker({
               changeMonth: true,
               changeYear: true,
               yearRange: "1880:2030"

           });
           $("#toDateTextBox").datepicker({
               changeMonth: true,
               changeYear: true,
               yearRange: "1880:2030"

           });
       });
   </script>
</body>
</html>
