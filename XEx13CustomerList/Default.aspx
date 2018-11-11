<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx13CustomerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Customer List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <h5>Name- jagjiwanpal singh</h5>
                <h5>id- C0718844</h5>
                <label id="lblState" for="ddlState" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a Category:</label>
                <div class="col-xs-8 col-sm-5">
                    <%-- state drop-down goes here --%>
                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="LongName" DataValueField="CategoryID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Halloween.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories] WHERE ([CategoryID] = CategoryID) ORDER BY [LongName]">
                        
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                    <%-- customer data list goes here --%>
                    <asp:DataList ID="dlProducts" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource2" CssClass="table table-bordered table-condensed table-striped">
                        <HeaderTemplate>
                            <span class="col-xs-3">ID</span>
                            <span class="col-xs-3">Product</span>
                            <span class="col-xs-1 text-right">UnitPrice</span>
                            <span class="col-xs-2 text-right">OnHand</span>
                            <span class="col-xs-3 text-right">Total</span>
                        </HeaderTemplate>
                        <ItemTemplate>
                           
                            <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" CssClass="col-xs-3"/>
                           
                            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" CssClass="col-xs-3"/>
                            
                            <asp:Label Text='<%# Eval("UnitPrice", "{0:C}") %>' runat="server" ID="UnitPriceLabel" CssClass="col-xs-1 text-right"/>
                           
                            <asp:Label Text='<%# Eval("OnHand") %>' runat="server" ID="OnHandLabel" CssClass="col-xs-2 text-right"/>
                           
                            <asp:Label Text='<%# (Convert.ToDouble( Eval("UnitPrice"))* Convert.ToDouble( Eval("OnHand"))).ToString("C") %>' runat="server" ID="Label1" CssClass="col-xs-3 text-right"/>
                        </ItemTemplate>
                        <HeaderStyle CssClass="bg-halloween" />
                    </asp:DataList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Halloween.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ProductID], [Name], [UnitPrice], [OnHand] FROM [Products] WHERE ([CategoryID] = @CategoryID) ORDER BY [ProductID]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategory" PropertyName="SelectedValue" Name="CategoryID" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>