<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.6.0, Culture=neutral, PublicKeyToken=B88D1754D700E49A" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        var rowIndex, colIndex;

        function OnInit(s, e) {
            var readOnlyIndexes = grid.cpReadOnlyColumns;
            ASPxClientUtils.AttachEventToElement(s.GetMainElement(), "keydown", function (event) {
                if (event.keyCode == 9) {
                    if (ASPxClientUtils.IsExists(columnIndex) && ASPxClientUtils.IsExists(rowIndex)) {
                        ASPxClientUtils.PreventEventAndBubble(event);
                        if (rowIndex < grid.GetVisibleRowsOnPage() + grid.GetTopVisibleIndex() - 1)
                            rowIndex++;
                        else {
                            rowIndex = grid.GetTopVisibleIndex();
                            if (columnIndex < grid.GetColumnCount() - 1)
                                columnIndex++;
                            else
                                columnIndex = 0;
                            while (readOnlyIndexes.indexOf(columnIndex) > -1)
                                columnIndex++;
                        }
                        grid.batchEditApi.StartEdit(rowIndex, columnIndex);
                    }
                }
            });
        }

        function OnBatchEditEndEditing(s, e) {
            rowIndex = null;
            columnIndex = null;
        }

        function OnBatchEditStartEditing(s, e) {
            rowIndex = e.visibleIndex
            columnIndex = e.focusedColumn.index
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView runat="server" ID="Grid" ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="AccessDataSource" KeyFieldName="CustomerID" OnCustomJSProperties="Grid_CustomJSProperties">
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <ClientSideEvents Init="OnInit" BatchEditStartEditing="OnBatchEditStartEditing" BatchEditEndEditing="OnBatchEditEndEditing" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="CustomerID" Caption="ID(RO)" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ContactTitle" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Phone" ReadOnly="True" Caption="Phone(RO)" VisibleIndex="4">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Fax" ReadOnly="True" Caption="Fax(RO)" VisibleIndex="5">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
    </form>
    <asp:AccessDataSource ID="AccessDataSource" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT TOP 25 [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Phone], [Fax], [City] FROM [Customers]"></asp:AccessDataSource>
</body>
</html>