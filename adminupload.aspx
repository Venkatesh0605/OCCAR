<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="adminupload.aspx.cs" Inherits="adminupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script>  function noback() {
      window.history.forward(0);
  }
            setTimeout("noback()", 0);
            window.onunload = function () { null }

     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
         Welcome Admin!!<br /> <br /> <br /><center><table style="width:400px; height:200px;">
             <tr>
                 <td colspan="2" >ENTER CAR DETAILS</td>
             </tr>
  <tr><td><asp:Label Text="Brand" ID="lblbrand" runat="server"/></td>
    <td class="auto-style1"><asp:TextBox ID="textbrand" runat="server"></asp:TextBox></td></tr>
    <tr><td><asp:Label Text="Model" ID="Lblmodel" runat="server">
 </asp:Label></td>
   <td class="auto-style1"> <asp:TextBox ID="TextModel" runat="server"></asp:TextBox></td></tr>
    <tr><td><asp:Label Text="Engine" ID="Lblengine" runat="server" ></asp:Label></td>
 
    <td class="auto-style1"><asp:DropDownList ID="ddengtype" runat="server">
        <asp:ListItem Text="Petrol"></asp:ListItem>
        <asp:ListItem Text="Deisel"></asp:ListItem>
    </asp:DropDownList></td>
   </tr><tr> <td><asp:Label Text="Price" ID="Lblprice" runat="server" >
 </asp:Label></td>
    <td class="auto-style1"><asp:TextBox ID="Textprice" runat="server"></asp:TextBox></td></tr>
    <tr> <td><asp:Label Text="Image" ID="lblimageupload" runat="server" ></asp:Label></td>
    <td class="auto-style1"><asp:FileUpload ID="fuimage" runat="server" /></td></tr>
    <tr><td><asp:Label Text="Description" ID="Lbldesc" runat="server" >
 </asp:Label></td>
    <td class="auto-style1"><asp:TextBox ID="TextDescription" runat="server"></asp:TextBox></td></tr>
     
        </table><br /><br /><br />
    <asp:Button id="btnupload" Text="Upload" runat="server" OnClick="btnupload_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White"/>&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp&nbsp&nbsp&nbsp
    <asp:Button id="btncancel" Text="Signout" runat="server" OnClick="btncancel_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White"/></center><br />
    <center><asp:button ID="btnreport" Text="SALES REPORT" runat="server" OnClick="btnreport_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="White" /></center> 
    <asp:Label ID="lbldisp" Text="Error occured while inserting into database" Visible="false" runat="server"></asp:Label>
</asp:Content>

