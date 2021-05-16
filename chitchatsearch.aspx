<%@ Page Title="" Language="C#" MasterPageFile="~/C1.master" AutoEventWireup="true" CodeFile="chitchatsearch.aspx.cs" Inherits="chitchatsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script>
       function noback() {
           window.history.forward(0);
       }
       setTimeout("noback()", 0);
       window.onunload = function () { null }
              </script>
       

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" Runat="Server">
<center><asp:Label ID="lblvis" runat="server" Text="Added to your follow list" Visible="false" Font-Size="Large" ForeColor="Blue"></asp:Label></center>
    <br />
    <br />
    <br /><center><asp:Panel ScrollBars="Auto" ID="imigpanel" Visible="true" style="z-index: 1; left: 250px; float:left; top: 210px; position: absolute; width: 599px; height: 434px" runat="server" CssClass="newStyle1" ><asp:GridView ID="gv2" runat="server"  GridLines="None" AutoGenerateColumns="false" OnRowUpdating="gv2_RowUpdating" OnSelectedIndexChanged="gv2_SelectedIndexChanged" Font-Bold="True" Font-Italic="True" Font-Names="Comic Sans MS" Font-Size="Small" Height="520px" Width="416px">
        <Columns>
            <asp:TemplateField HeaderText="USERID">
                <ItemTemplate>
                    <asp:Label ID="lbluserid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"userid")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FIRST NAME">
               <ItemTemplate>
                    <asp:Label ID="lblfirstname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"firstname")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LASTNAME">
                 <ItemTemplate>
                    <asp:Label ID="lbllastname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"lastname")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PICTURE">
                 <ItemTemplate>
                  <asp:Image ID="img" runat="server" ImageUrl='<%#"Picture.ashx?userid="+Eval("userid")%>' width="100px" Height="100px"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnfollow" Text="Follow" runat="server" CommandName="Update" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"userid")%>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

            </asp:GridView></asp:Panel></center>
</asp:Content>

