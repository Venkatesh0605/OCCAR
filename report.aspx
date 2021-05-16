<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="Scripts/jquery-1.11.1.js"></script>
    <script src="Scripts/jquery-1.11.1.min.js"></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui.min.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/datepicker.css" rel="stylesheet" />
       <script>

           $(document).ready(function () {
               $("input[id$=txtdate]").datepicker();
           });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <center><br /><br /><table><tr>
        <td>
            <asp:Label ID="lbldisplay" Text="ENTER DATE TO VIEW THE SALES REPORT" runat="server"></asp:Label>
            
        </td>
        <td><asp:TextBox ID="txtdate" runat="server" placeholder="mm-dd-yyyy"></asp:TextBox></td>
                   </tr>
        <td colspan="2">
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White"/>
        </td><tr>
                 <td colspan="2">
                     <asp:Label ID="lbldisplay1" Text="Total car sold out today" runat="server"></asp:Label>
                     <asp:Label ID="lblcount"  runat="server"></asp:Label>
                 </td>  </tr> 
      <tr><td colspan="2"><center><asp:GridView ID="gv1" runat="server"></asp:GridView></center></td></tr>
        <tr><td><asp:Label ID="lbltotal" Text="Total Price" runat="server"></asp:Label>
        <asp:Label ID="lbltotaldisplay" runat="server"></asp:Label></td></tr>
                        </table></center>
    



</asp:Content>


