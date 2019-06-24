<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# OBSOLETE - ASPxGridView - How to focus cells from top to bottom by Tab key pressing when the Batch Edit mode is used
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t283073)**
<!-- run online end -->


<p><strong>UPDATED:</strong><br><br>Starting with version v2016 vol 1 (v16.1), a similar functionality is available out of the box. Set the grid's <a href="http://help.devexpress.com/#AspNet/DevExpressWebGridBatchEditSettings_StartEditActiontopic">SettingsEditing.BatchEditSettings.StartEditAction</a> property to the <strong>FocusedCellClick</strong> value to activate it. Please refer to the <a href="http://demos.devexpress.com/ASPxGridViewDemos/GridEditing/BatchEditing.aspx">Batch Editing and Updating</a> demo and <a href="https://www.devexpress.com/Support/Center/p/T363560">ASPxGridView - Batch Edit - Provide cell focusing and keyboard navigation</a> thread for more information.<br><br>If you have version v16.1+ available, consider using the built-in functionality instead of the approach detailed below.<br><br><strong>For earlier versions: </strong><br><br>This example demonstrates how to change the order of focusing ASPxGridView cells by pressing the Tab key when the Batch Edit mode is used.<br><br>In this example, the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientUtils_AttachEventToElementtopic">ASPxClientUtils.AttachEventToElement</a> method allows defining a handler for the <em>keydown</em> event of ASPxGridView's main element. The <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridViewBatchEditApi_StartEdittopic">ASPxClientGridViewBatchEditApi.StartEdit</a> method is used for changing the order of cell focusing. A list of read-only column indexes is stored in <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridView_JSPropertiestopic">ASPxGridView.JSProperties</a>.</p>

<br/>


