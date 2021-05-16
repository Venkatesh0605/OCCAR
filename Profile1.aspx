<%@ Page Title="" Language="C#" MasterPageFile="~/C1.master" AutoEventWireup="true" CodeFile="Profile1.aspx.cs" Inherits="Profile1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>  label
    {
    flex-align:center;
    }
      .auto-style1
      {
          height: 26px;
      }
      #btnupdate1
      {
          border-radius:20px 20px 20px 20px;
      }
    </style>
    
    <script>
        function noback() {
            window.history.forward(0);
        }
        setTimeout("noback()", 0);
        window.onunload = function () { null }
              </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" Runat="Server">
    <br /><br />
  
   <div id="d1" style="width:800px;height:500px;float:left">
   <br /><br /> <center><table>
       
    <tr> <td> <asp:Image ID="image" runat="server"  Width="100px" Height="100px"/> </td>
    <td><asp:FileUpload ID="fu1" runat="server" Font-Names="Comic Sans MS" BackColor="#0099FF" Font-Bold="True" /></td>
        <td><asp:Button ID="btnupdate11" runat="server" Font-Names="Comic Sans MS" BackColor="#0099FF" Font-Bold="True"  Text="Change Profile Picture" OnClick="btnupdate11_Click"/> </td>
    </tr> 
       
       <tr><td><asp:Label ID="lblfname" runat="server"  Text="First Name" Font-Names="Comic Sans MS"></asp:Label></td>
       <td><asp:TextBox ID="txtfname" runat="server" Font-Names="Comic Sans MS"></asp:TextBox></td></tr>
       <tr><td class="auto-style1"><asp:Label ID="lbllname" runat="server" Text="Last Name" Font-Names="Comic Sans MS"></asp:Label></td>
       <td class="auto-style1"><asp:TextBox ID="txtlname" runat="server" Font-Names="Comic Sans MS" ></asp:TextBox></td></tr>
       
      <tr><td><asp:Label ID="lblcpass" runat="server" Text="Change Password" Font-Names="Comic Sans MS"></asp:Label></td>
       <td><asp:Button ID="btncpass" runat="server" Text="Change Password" OnClick="btncpass_Click" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" /></td></tr> 
       <tr><td><asp:Label ID="lblmobile" runat="server" Text="Mobile" Font-Names="Comic Sans MS"></asp:Label></td>
      <td> <asp:TextBox ID="txtmobile" runat="server" Font-Names="Comic Sans MS" ></asp:TextBox></td></tr>
       
       <tr><td><asp:Label ID="lblemail" runat="server" Text="Email Id" Font-Names="Comic Sans MS"></asp:Label></td>
      <td> <asp:TextBox ID="txtemail" runat="server" Font-Names="Comic Sans MS" ></asp:TextBox></td></tr>
       
     <tr><td>  <asp:Label ID="lbladdress" runat="server" Text="Address" Font-Names="Comic Sans MS"></asp:Label></td>
       <td><asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Font-Names="Comic Sans MS" ></asp:TextBox></td></tr>
       </table></center>     <br /><br />
         <div id="d3" > &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnupdate1" runat="server" Text="Update" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" OnClick="btnupdate1_Click" />
             &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
             <asp:Button ID="btncancel1" runat="server" Text="Cancel" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" /><br />
             <center><asp:Button ID="btndeactivate" runat="server" Text="Deactivate Account" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" OnClick="btndeactivate_Click" /></center>
         </div>
       </div>
    <br />
    <br />
    <br /><br />
    <div id="d2" style="width:400px;height:300px;float:left">
        <asp:Panel ID="p1" runat="server" Visible="false" OnLoad="Page_Load">

      <asp:Label ID="lblvis1"  Text="Pass Word Changed Successfully" Font-Size="Small" runat="server" Font-Names="Comic Sans MS" ForeColor="Green" Visible="false"></asp:Label> 
        <table><tr><td> <asp:Label ID="lblcpass1" runat="server" Text="Enter Current Password" Font-Names="Comic Sans MS"></asp:Label></td>
            <td> <asp:TextBox ID="txtcpass" runat="server" Font-Names="Comic Sans MS" TextMode="Password"></asp:TextBox></td>
               </tr>
            <tr> <td> <asp:Label ID="lblepass" runat="server" Text="Enter New Password" Font-Names="Comic Sans MS"></asp:Label></td>
                <td> <asp:TextBox ID="txtepass" runat="server" Font-Names="Comic Sans MS" TextMode="Password" ></asp:TextBox></td></tr>
            <tr><td> <asp:Label ID="lblcpass2" runat="server" Text="Confirm Password" Font-Names="Comic Sans MS"></asp:Label></td>
                <td> <asp:TextBox ID="txtcpass2" runat="server" Font-Names="Comic Sans MS" TextMode="Password"></asp:TextBox></td>
            </tr> </table>
      
            <br /><br />
         <div id="d4" > &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnupdate" runat="server" Text="Update" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" OnClick="btnupdate_Click" />
             &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
             <asp:Button ID="btncancel" runat="server" Text="Cancel" BackColor="#0099FF" Font-Bold="True" Font-Names="Comic Sans MS" OnClick="btncancel_Click" />
         </div>
                 
              
        
        
  </asp:Panel>
    </div>

    </asp:Content>
