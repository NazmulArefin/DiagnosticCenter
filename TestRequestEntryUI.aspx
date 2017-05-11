<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRequestEntryUI.aspx.cs" Inherits="DiagnostcCenterBillManagementApp.UI.TestRequestEntryUI" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>
    <link href="../reset.css" rel="stylesheet" />
    <link href="../TestRequestCSS.css" rel="stylesheet" />
    <link href="../GridViewCSS.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="../font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 356px;
        }
        .auto-style2 {
            width: 182px;
        }
        .auto-style3 {
            width: 556px;
        }
        .auto-style4 {
            font-family: Arial;
            font-size: 15px;
            text-align: left;
            width: 753px;
        }
        .auto-style5 {
            font-family: Arial;
            font-size: 15px;
            text-align: left;
            width: 556px;
        }
    </style>
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
            <a href="TestSetupUI.aspx">
                <li>Test Setup</li>
            </a>
            <a href="TypeSetupUI.aspx">
                <li>Type Setup</li>
            </a>
            <a href="TestRequestEntryUI.aspx">
                <li>Test Request Entry</li>
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
                  <div class="form_head">Test Request Entry</div>
                 <div class="form_div">
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text="Name of patient"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="nameOfPatientTextBox" runat="server" Width="128px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Text="Date of Birth"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="dateTextBox" name="dateTextBox" runat="server" Width="123px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label3" runat="server" Text="Mobile No(11 digits)"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="mobileTextBox" runat="server" Width="127px" ></asp:TextBox>
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label4" runat="server" Text="Select Test"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="testDropDownList" runat="server" OnSelectedIndexChanged="testDropDownList_SelectedIndexChanged" AutoPostBack="True" Width="128px">
                                </asp:DropDownList>
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label5" runat="server" Text="Fee"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="feeTextBox" runat="server" Width="128px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:Label ID="messageLabel" runat="server"></asp:Label>
                                <br />
                                <br />
                            </td>
                            <td class="auto-style4">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                &nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="addBillButton" runat="server" Text="Add" OnClick="addBillButton_Click" Width="62px" />
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                &nbsp;</td>
                            <td class="auto-style5">
                    <asp:GridView ID="testRequestEntryGridView" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2" Width="357px">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                    <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Test">
                                    <ItemTemplate>
                                        <asp:Label runat="server"> <%#Eval("TestName") %> </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fee">
                                    <ItemTemplate>
                                        <asp:Label runat="server"> <%#Eval("Fee") %> </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
    
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label6" runat="server" Text="Total Amount (BDT)"></asp:Label>
                            </td>
                            <td>
                                &nbsp;&nbsp;
                                <asp:TextBox ID="totalTextBox" runat="server" style="margin-left: 0px"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                &nbsp;&nbsp;
                                <asp:Button ID="saveBillButton" runat="server" Text="Save" OnClick="saveBillButton_Click" Width="63px" Enabled="False" />
                            &nbsp;&nbsp;
                                <asp:Label ID="patientMessageLabel" runat="server"></asp:Label>
                                <br />
                            </td>
                        </tr>
                    </table>
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
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
   <script>
       
       $(function () {
           $("#dateTextBox").datepicker({
               changeMonth: true,
               changeYear: true,
               yearRange: "1880:2030"

           });
       });
   </script>
</body>
</html>
