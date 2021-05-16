<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="adminsignin.aspx.cs" Inherits="adminsignin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br /><br />
 
    <center><table >
        <tr>
            <td>
                <asp:Label ID="lbluserid" runat="server" Text="Userid"></asp:Label>
                <asp:TextBox ID="txtsignin" runat="server" Height="17px" style="margin-left: 23px" Width="124px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblpassword" runat="server" Text="Password">
                </asp:Label>
                <asp:TextBox ID="txtpass1" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
            </table><asp:Button ID="btnsignin" runat="server" Text="Sign in" OnClick="btnsignin_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" />&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<asp:Button ID="btncancel" runat="server" Text="Cancel" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" />
       
    </center>
     <asp:Label ID="lbldisp" Text="You are not admin kindly check userid and password" ForeColor="Red" Font-Size="Small" runat="server" Font-Bold="true" Visible="false"></asp:Label>
</asp:Content>


