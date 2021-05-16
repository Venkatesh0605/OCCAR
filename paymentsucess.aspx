<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="paymentsucess.aspx.cs" Inherits="paymentsuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        
        function noback() {
            window.history.forward(0);
        }
        setTimeout("noback()", 0);
        window.onunload = function () { null }
             
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br /><br /><br /><br /><br /> <asp:Label ID="lbldisplay1" Text="PAYMENT RECEIPT" runat="server"></asp:Label><center>
       <table>
        <tr>
            <td>
                <asp:Label ID="lbluserid" runat="server" Text="User id">

                </asp:Label>
                </td>
            <td>
                <asp:Label ID="lbluserid1" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblbrand" runat="server" Text="Brand"></asp:Label></td>
              <td><asp:Label ID="lblbrand1" runat="server" ></asp:Label></td>  
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmodel" runat="server" Text="Model"></asp:Label></td>
                <td><asp:Label ID="lblmodel1" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblsalesid" runat="server" Text="Salesid"></asp:Label></td>
            <td><asp:Label ID="lblsalesid1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbldate" runat="server" Text="Delivery Date"></asp:Label>
           
            </td>
            <td><asp:Label ID="lbldate1" runat="server"></asp:Label></td>        </tr>
    </table></center>
    <center><asp:Label ID="display" Text="Thank you for purchasing" runat="server"></asp:Label></center>
    <center><asp:Button ID="btnsignout" Text="signout" runat="server" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" OnClick="btnsignout_Click" /></center>
</asp:Content>

