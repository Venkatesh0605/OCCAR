<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="purchasesearch.aspx.cs" Inherits="purchasesearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>  function noback() {
             window.history.forward(0);
         }
         setTimeout("noback()", 0);
         window.onunload = function () { null }
        
     </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="nav1" ID="nav13" runat="server">
     <i><a href="chitchathome.aspx">Chit Chat</a></i>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <br />
    <asp:Label ID="lblcarid" Visible="True" runat="server"></asp:Label>
        <table>
            <tr>
                <td>User id:</td>
                <td><asp:Label ID="lbluserid" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Brand</td>
                <td><asp:DropDownList ID="ddbrand" runat="server" OnSelectedIndexChanged="ddbrand_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Model
                </td>
                <td><asp:DropDownList ID="ddmodel" runat="server" OnSelectedIndexChanged="ddmodel_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Engine Type</td>
                <td><asp:DropDownList ID="ddengtype" runat="server">
                    <asp:ListItem>Petrol</asp:ListItem>
                    <asp:ListItem>Disel</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Date</td>
                <td><asp:Label ID="lbldate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Price inclusive of tax</td>
                <td><asp:Label ID="lblprice" runat="server"></asp:Label></td>
            </tr>
        </table>
        <asp:Button ID="btncontinue" runat="server" Text="Continue" OnClick="btncontinue_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnsignout" runat="server" Text="Sign Out" OnClick="btnsignout_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" />
    
 <%--<table style="height:300px; width:150px; float:right; background-color:lightgrey; color:white; font-family:'Comic Sans MS'">
        <tr>
            <td>
                <img src="images/Headshot_Large.jpg" style="height:100px; width:150px;float:left " /></td>
               
        </tr>
        <tr>
            <td>
                <img src="images/rajnikanth.jpg" style="height:100px; width:150px;float:left " /></td>
                                  

        </tr>
        <tr>
            <td>
                <img src="images/sac.jpg" style="height:100px; width:150px;float:left " /></td>
      
           
           
        
        </tr>
    </table>--%>
    </asp:Content>
    

