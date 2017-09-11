<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages_Home"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="Style.css" />
    <style type="text/css">
        .auto-style1 {
            height: 678px;
            width: 1037px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">                
  <asp:Label Text="Product Shop" runat="server" Font-Size="44px"></asp:Label>  
        <br />
        <br />
    <asp:GridView ID="ProductGrid" runat="server" AlternatingRowStyle-BackColor="White"
  AutoGenerateColumns="false" BorderStyle="Outset" CellPadding="50" CaptionAlign="Left" OnRowCommand="ExtractProduct">
<columns>                
<asp:BoundField DataField="Number" HeaderText="Name" ItemStyle-Width="80" />
<asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" ItemStyle-Width="80" />
<asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="80" />
<asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-Width="80" />
<asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-Width="80" />
<asp:TemplateField HeaderText="Add To Cart">              
<ItemTemplate>
<asp:Button Text="Buy Now" runat="server"  CommandArgument='<%# Container.DataItemIndex %>' BackColor="#B2B2B2" BorderStyle="Outset" BorderWidth="2px" Font-Bold="True" ForeColor="Black" Font-Size="20px" CommandName="AddToCart" />
</ItemTemplate>
</asp:TemplateField>
</columns>        
</asp:GridView>
<asp:button style="margin-top: 100px; margin-left: 450px; margin-bottom: 100px; margin-right: 450px;" text="Go To Cart" id="cartButton" runat="server" enabled="False" backcolor="#999999" bordercolor="Black" borderstyle="Double" borderwidth="4px" font-bold="True" font-size="24px" OnClick="cartButton_Click"  />
</div>          
</asp:Content>
