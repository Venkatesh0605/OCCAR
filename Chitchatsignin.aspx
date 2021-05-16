<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chitchatsignin.aspx.cs" Inherits="Chitchatsignin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image:url(Images/desktopography_2010_1920x1200.jpg); background-repeat:no-repeat; background-size:cover;">
   <form id="form1" runat="server">
    <div id="d1" style="float:right" runat="server">
    <asp:Label Text="CHIT CHAT LOGIN" ID="lbldisplay" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF9933"></asp:Label>
        <table>
            <tr>
                <td><asp:TextBox ID="txtuserid" placeholder="User ID" runat="server" Height="20px" Width="150px"></asp:TextBox></td>
                <td><asp:TextBox ID="txtpass" placeholder="Password" runat="server" Height="20px" Width="150px" TextMode="Password"></asp:TextBox></td>
                <td><asp:Button ID="btnsignin" Text="Signin" runat="server" OnClick="btnsignin_Click" BackColor="#FF9933" Font-Bold="True" Font-Italic="True" Font-Names="Comic sans" ForeColor="Black" Width="64px" style="height: 26px" /></td>
                <td><asp:Button ID="btncancel" Text="Cancel" runat="server" OnClick="btncancel_Click" BackColor="#FF9933" Font-Bold="True" Font-Italic="True" Font-Names="Comic Sans MS" ForeColor="Black" /></td>
            </tr>
            
        </table>
        <asp:Label ID="lblinval" runat="server" Font-Italic="True" Font-Names="Comic Sans MS" ForeColor="Red"  Visible="false">Invalid User Id or Pass word</asp:Label><br />
         <asp:Label ID="lblinval1" runat="server" Font-Italic="True" Font-Names="Comic Sans MS" ForeColor="Red"  Visible="false">Your Account has been deactivated</asp:Label>
   </div>
       </form>
</body>
</html>
