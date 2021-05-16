<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="Testdrive.aspx.cs" Inherits="Testdrive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/jquery-1.11.1.js"></script>
    <script src="Scripts/jquery-1.11.1.min.js"></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui.min.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/datepicker.css" rel="stylesheet" />
       <script>
           
           $(document).ready(function(){
               $("input[id$=txtdate1]").datepicker();
           });
</script>
    

 <script>
     function datecheck() {
         var d = getCalendarDate();

         var i = document.getElementByid('<%=txtdate1.ClientID %>').value;
         document.getElementByid('<%=datech.ClientID %>').value = d;

        
         if (i < d) {
             alert('Enter a Valid date');
             return false;
         }
         else {
             return true;
         }
     }
 </script>
  
    <script>
         function noback() {
             window.history.forward(0);
         }
         setTimeout("noback()", 0);
         window.onunload = function () { null }
              </script>


        
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:Label ID="lblcarid" Visible="false" runat="server" ForeColor="White"></asp:Label>
    <asp:Label ID="lbluserid1" Visible="false" runat="server" ForeColor="White"></asp:Label>
      <asp:TextBox ID="datech" runat="server" Visible="false"></asp:TextBox>
    <img src="Images/testdrive_corp_530x450_oct14.jpg" style="width: 338px; float:right; height: 310px;" />
    <table align="center" style="width:367px; height:311px">
        <tr><td>Brand</td>
            <td><asp:DropDownList ID="ddbrand" runat="server" OnSelectedIndexChanged="ddbrand_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td> 
          
        </tr>
        <tr>
            <td>Model</td>
            <td><asp:DropDownList ID="ddmodel" runat="server" OnSelectedIndexChanged="ddmodel_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
        </tr>
        <tr>
            
            <td>Date</td>
            <td>
                <asp:TextBox ID="txtdate1" runat="server" OnTextChanged="txtdate1_TextChanged" AutoPostBack="True" ></asp:TextBox>
    </td>
        </tr>
        <tr>
            <td>Time</td>
            <td><asp:DropDownList ID="ddtime" runat="server" OnSelectedIndexChanged="ddtime_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
    </table>
    &nbsp;<center><asp:Button id="btnfixdrive" runat="server" Text="Fix Drive" OnClick="btnfixdrive_Click" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnsignout" runat="server" Text="Sign Out" OnClick="btnsignout_Click"  OnClientClick="return datecheck()"/></center> 
</asp:Content>

