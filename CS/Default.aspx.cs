using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void Grid_CustomJSProperties(object sender, DevExpress.Web.ASPxGridViewClientJSPropertiesEventArgs e) {
        ASPxGridView grid = sender as ASPxGridView;
        List<int> readOnlyColumns = new List<int>();
            foreach (GridViewDataColumn column in grid.Columns){
              if (column.ReadOnly) 
                 readOnlyColumns.Add(column.Index);
            }
            e.Properties["cpReadOnlyColumns"] = readOnlyColumns;
    }
}