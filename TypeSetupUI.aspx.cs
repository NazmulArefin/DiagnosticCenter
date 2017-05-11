using System;
using System.Collections.Generic;
using DiagnostcCenterBillManagementApp.BLL;
using Type = DiagnostcCenterBillManagementApp.DLL.Model.Type;

namespace DiagnostcCenterBillManagementApp.UI
{
    public partial class TestTypeSetupUi : System.Web.UI.Page
    {
        TypeManager aTypeManager = new TypeManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            getTypeGridValue(); 
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string TypeName = typeNameTextBox.Text;
            messageLabel.Text = aTypeManager.SaveType(TypeName);
            getTypeGridValue();
        }

        private void getTypeGridValue()
        {
            List<Type> aTypeList = aTypeManager.TypeListed(); 
            typeGridView.DataSource = aTypeList; 
            typeGridView.DataBind();
        }
    }
}