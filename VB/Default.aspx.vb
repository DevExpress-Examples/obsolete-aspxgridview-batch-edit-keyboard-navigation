Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub Grid_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewClientJSPropertiesEventArgs)
        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim readOnlyColumns As New List(Of Integer)()
            For Each column As GridViewDataColumn In grid.Columns
              If column.ReadOnly Then
                 readOnlyColumns.Add(column.Index)
              End If
            Next column
            e.Properties("cpReadOnlyColumns") = readOnlyColumns
    End Sub
End Class