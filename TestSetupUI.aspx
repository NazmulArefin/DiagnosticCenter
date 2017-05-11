<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSetupUI.aspx.cs" Inherits="DiagnostcCenterBillManagementApp.UI.TestSetupUI" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>
    <link href="../reset.css" rel="stylesheet" />
    <link href="../TestSetupCss.css" rel="stylesheet" />
    <link href="../GridViewCSS.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="../font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 194px;
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
             <form id="form2" runat="server">
                <div class="form_head">Test Setup</div>
                <div class="form_div">
                    <table style="width:100%;">
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="Test Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="testNameTextBox" runat="server"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label5" runat="server" Text="Fee (BDT)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="feeTextBox" runat="server"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label6" runat="server" Text="Test Type"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="testTypeDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <br />
                            <asp:Label ID="messageLabel" runat="server"></asp:Label>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="saveTestSetupButton_Click" Height="30px" Width="66px" />
                            &nbsp;&nbsp;&nbsp;<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                          <td>
                              <br />
                          </td>
                        <td class="grid">
                            <asp:GridView ID="testSetupGridView" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Vertical" ForeColor="Black" Width="385px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                             <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Test Name">
                        <ItemTemplate>
                            <asp:Label runat="server"> <%#Eval("TestName") %> </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fee">
                        <ItemTemplate>
                            <asp:Label runat="server"> <%#Eval("Fee") %> </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:Label runat="server"> <%#Eval("TypeName") %> </asp:Label>
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
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                </div>
            </form>
        </div>
    </div>
</body>

