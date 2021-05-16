<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="Scheduled.aspx.cs" Inherits="Scheduled" %>

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
    <center> <br />
      <br />
      <br />
      <table>
      <tr>
          <td colspan="2"><b>Your Test Drive Fixed</b></td>
      </tr>
    <tr>  <td><asp:Label ID="lbluserid" Text="User id" runat="server"></asp:Label></td>
        <td><asp:Label ID="lbluseriddisplay" runat="server"></asp:Label></td>
        </tr>
          <tr>
              <td>
                  <asp:Label ID="lbl" Text="Test Drive id" runat="server"></asp:Label>
              </td>
              <td>
                  <asp:Label ID="lbltestdriveid2" runat="server"></asp:Label>
              </td>
          </tr> 
      <tr>
          <td>
              <asp:Label ID="lblBrand" Text="Brand" runat="server"></asp:Label>
          </td>
          <td>
              <asp:Label ID="lblbrand1"  runat="server"></asp:Label>
          </td>
      </tr>
      <tr>
          <td>
              <asp:Label ID="lblmodel" runat="server" Text="Model"></asp:Label>
              
          </td>
          <td>
              <asp:Label ID="lblmodel1" runat="server"></asp:Label>
          </td>
      </tr>
      <tr>
          <td><asp:Label ID="lbldate" runat="server" Text="Date"></asp:Label></td>
          <td><asp:Label ID="lbldate1" runat="server"></asp:Label></td>
      </tr>
          <tr>
              <td><asp:Label ID="lbltime" runat="server" Text="Time"></asp:Label></td>
                  <td><asp:Label ID="lbltime1" runat="server"></asp:Label></td>
              
          </tr>
          <tr>
              <td>
                  <asp:Label ID="lbladdress" runat="server" Text="Address"></asp:Label>
                  
              </td>
              <td><asp:Label ID="lbladdress1" runat="server" Text="#10 ABC STREET DEF COLONY CHENNAI"></asp:Label></td>
          </tr>
   </table> </center>
      <CENTER> <asp:Button ID="btnprint" runat="server" Text="print" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:Button ID="btnsignout" runat="server" Text="signout" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" OnClick="btnsignout_Click" /></CENTER>
   <center> <asp:Label ID="Display" Text="Please Provide The Test Drive id to do the Test Drive" runat="server"></asp:Label>
    </center>
</asp:Content>

