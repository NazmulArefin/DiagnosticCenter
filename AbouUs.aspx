<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AbouUs.aspx.cs" Inherits="DiagnostcCenterBillManagementApp.UI.AbouUs" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <link href="../reset.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../AboutCss.css" rel="stylesheet" />
    <link href="../font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
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
                <a href="UI/TypeSetupUI.aspx">
                    <li>Type Setup</li>
                </a>
                <a href="UI/TestSetupUI.aspx">
                    <li>Test Setup</li>
                </a>
                <a href="UI/TestRequestEntryUI.aspx">
                    <li>Test Request Entry</li>
                </a>
                <a href="UI/PayementUI.aspx">
                    <li>Payment</li>
                </a>
                <a href="UI/TestWiseReportUI.aspx"><li>Test Wise Report</li></a>
                <a href="UI/TypeWiseReportUI.aspx"><li>Type Wise Report</li></a>
                <a href="UI/UnpaidBillReport.aspx">
                    <li>Unpaied Bill Report</li>
                </a>
            </ul>
        </aside>
        <div class="main-content">
            <div class="content_head"></div>
            <div class="developer">
                <div class="developer-1">
                    <ol>
                        <li>
                            <h2>Muntasir Jamal</h2>
                            Department of CSE <br />
                            International Islamic University Chittagong<br />
                            muntasirjamal@gmail.com
                        </li>
                        <li>
                            <h2>Nazmul Arefin</h2>
                            Department of CSE <br />
                            International Islamic University Chittagong<br />
                            nazmul.arefin.85@gmail.com<br />
                            01836095554
                        </li>
                    </ol>
                </div>
                <div class="developer-2">
                    <ol>
                        <li>
                            <h2>Mohammad Yakub</h2>
                            Department of CSE <br />
                            International Islamic University Chittagong<br />
                            muhammad.yakub.iiuc@gmail.com
                        </li>
                        <li>
                            <h2>Mohammad Sahed</h2>
                            Department of CSE <br />
                            International Islamic University Chittagong<br />
                            sahed.ranvir@gmail.com
                        </li>
                    </ol>
                </div>
                <div class="clear-fix"></div>
            </div>
            <div class="clear-fix"></div>
        </div>
        <div class="right-aside"></div>
        <div class="clear-fix"></div>
        <div class="footer">
            <i class="fa fa-copyright" aria-hidden="true"></i>
            BugSolver 2016
        </div>
    </div>
</body>
</html>
