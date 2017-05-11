using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnostcCenterBillManagementApp.BLL;
using DiagnostcCenterBillManagementApp.DLL.Model;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.UI
{
    public partial class TestSetupUI : System.Web.UI.Page
    {
        TypeManager aTypeManager = new TypeManager();
        TestManager aTestManager = new TestManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Type> aTypelList = aTypeManager.TypeListed();
                testTypeDropDownList.DataSource = aTypelList;
                testTypeDropDownList.DataTextField = "TypeName";
                testTypeDropDownList.DataValueField = "Id"; 
                testTypeDropDownList.DataBind();
            }
            GetTestGridValue();
        }

        protected void saveTestSetupButton_Click(object sender, EventArgs e)
        {
            Test aTest = new Test();
            aTest.TestName = testNameTextBox.Text;
            aTest.Fee = Convert.ToDouble(feeTextBox.Text);
            aTest.TestType = Convert.ToInt32(testTypeDropDownList.Text);

            messageLabel.Text = aTestManager.SaveTest(aTest);
            GetTestGridValue();
            clear();
        }
        private void GetTestGridValue()
        {
            List<Test> aTestList = aTestManager.TestListed();
            testSetupGridView.DataSource = aTestList;
            testSetupGridView.DataBind();
        }

        private void clear()
        {
            testNameTextBox.Text = "";
            feeTextBox.Text = ""; 
        }
    }
}