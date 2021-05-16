<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="Searchpage.aspx.cs" Inherits="Searchpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .newStyle1 {
        position: absolute;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    
    <center>
        
        <asp:Panel ID="P1" Visible="true" runat="server"><table style="vertical-align:central">
       <tr>
        <td colspan="2"><b>Choose Your Requirements</b></td> 
    </tr><tr><td><asp:Label ID="lblsbrand" Text="SELECT BRAND" runat="server"></asp:Label></td>
   <td> <asp:DropDownList ID="ddbrand" runat="server" OnSelectedIndexChanged="ddbrand_SelectedIndexChanged1" ></asp:DropDownList></td></tr>
    <tr><td><asp:Label ID="lblpricemin" runat="server" Text="Price Min:">
    </asp:Label></td>
     <td><asp:TextBox ID="textpricemin" runat="server" ></asp:TextBox></td></tr>
        <tr>
       <td><asp:Label ID="lblpricemax" runat="server" Text="Price Max:">
    </asp:Label></td>
       <td><asp:TextBox ID="textpricemax" runat="server"></asp:TextBox></td></tr>
      <tr ><td colspan="2"><asp:Button ID="btnsearch" Text="SEARCH CARS" runat="server" OnClick="btnsearch_Click1" BackColor="#0066FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" BorderColor="#0066FF"/></td></tr></table></asp:Panel></center><br /><br /><br /><br />
     <center><asp:Button ID="btndotestdrive" Text="Do Test Drive" runat="server" OnClick="btndotestdrive_Click" BackColor="#0066FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" BorderColor="#0066FF" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnbuyacar" Text="Purchase a Car" runat="server" OnClick="btnbuyacar_Click" BackColor="#0066FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" BorderColor="#0066FF" ForeColor="White" /></center>
    <asp:Panel ScrollBars="Auto" ID="imigpanel" Visible="false" style="z-index: 1; left: 121px; float:left; top: 210px; position: absolute; width: 599px; height: 434px" runat="server" CssClass="newStyle1" ><asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="false" Height="198px" ForeColor="#FF9933" BackColor="Black" Visible="false"  >
       <Columns>
              <asp:TemplateField HeaderText="CARID">
                 
                       <ItemTemplate><asp:Label ID="lblmodel" Width="75px" Text='<%#DataBinder.Eval(Container.DataItem,"carid") %>' runat="server"></asp:Label></ItemTemplate>
                    </asp:TemplateField> 
                <asp:TemplateField HeaderText="BRAND"> <ItemTemplate><asp:Label Width="75px" ID="lblbrand" Text='<%#DataBinder.Eval(Container.DataItem,"Brand") %>' runat="server"></asp:Label></ItemTemplate></asp:TemplateField> 
                   <asp:TemplateField HeaderText="MODEL"><ItemTemplate><asp:Label Width="60px" ID="lblmodel"  Text='<%#DataBinder.Eval(Container.DataItem,"model") %>' runat="server"></asp:Label></ItemTemplate></asp:TemplateField> 
                    <asp:TemplateField HeaderText="ENGINE TYPE">  <ItemTemplate><asp:Label Width="75px" ID="lbletype"  Text='<%#DataBinder.Eval(Container.DataItem,"Enginetype") %>' runat="server"></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="PRICE">   <ItemTemplate><asp:Label Width="100px" ID="lblprice"  Text='<%#DataBinder.Eval(Container.DataItem,"price") %>' runat="server"></asp:Label></ItemTemplate></asp:TemplateField>
                      <asp:TemplateField HeaderText="DESCRIPTION"> <ItemTemplate><asp:Label Width="75px" ID="lbldesc"  Text='<%#DataBinder.Eval(Container.DataItem,"Description1") %>' runat="server"></asp:Label></ItemTemplate></asp:TemplateField>
                 <%-- <asp:TemplateField HeaderText="IMAGE"> <ItemTemplate><asp:Image ID="image" Width="50px" ImageURL="~/ImageHandler.ashx?carid="+<%#DataBinder.Eval(Container.DataItem,"carid") %> runat="server"></asp:Image> </ItemTemplate></asp:TemplateField>--%>
              <asp:TemplateField HeaderText="Image"><ItemTemplate>
                  <asp:Image ID="image" ImageUrl='<%#"ImageHandler.ashx?carid="+Eval("carid")%>' runat="server" width="100px" Height="100px" AlternateText="Image1"/>

                                                    </ItemTemplate></asp:TemplateField>
         
          </Columns>
      </asp:GridView>
        <center><asp:Button ID="btnok" Text="Go Back" runat="server" onclick="buttonclick" /></center>
    </asp:Panel> 
</asp:Content>


