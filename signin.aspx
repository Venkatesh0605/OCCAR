<%@ Page Title="" Language="C#" MasterPageFile="~/car.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function userid() {
            var u = document.getElementById('<%=txtid.ClientID%>');
            if (u.value == "") {
                u.style.borderColor = "red";
                return false;
            }
            else {
                u.style.borderColor = "";
                return true;
            }}
            function fname() {
                var n = document.getElementById('<%=Txtfname.ClientID%>');
                if (n.value == "") {
                    n.style.borderColor = "red";
                    return false;
                }
                else {
                    n.style.borderColor = "";
                    return true;
                }
            }
        
        function lname() {
            var u = document.getElementById('<%=Txtlname.ClientID%>');
            if (u.value == "") {
                u.style.borderColor = "red";
                return false;
            }
            else {
                u.style.borderColor = "";
                return true;
            }
        }

        function pass() {
            var u = document.getElementById('<%=txtpass1.ClientID%>');
            if (u.value == "") {
                u.style.borderColor = "red";
                return false;
            }
            else {
                u.style.borderColor = "";
                return true;
            }
        }
        function passwordcheck() {
            var i = document.getElementById('<%=txtpass1.ClientID %>').value;
            var j = document.getElementById('<%=Txtcpass.ClientID%>').value;
            if (i != j) {
                alert("Password Doesnt Match");
                return false;

            }
            else return true;
            
        }
        function mobilecheck() {
            var e = document.getElementById('<%=txtmobile.ClientID%>');

            if (isNaN(e.value)) {
                alert("Mobile number cannot be in character");
                return false;

            } else if (e.value) {
                return mobilecheck1();
                return false;
            } else { return true; }

        }
            function mobilecheck1() {
                var e = document.getElementById('<%=txtmobile.ClientID%>');
                if (length(e.value) != 10) {
                    alert("Mobile Number should be 10 digit");
                    return false;
                } else { return true; }
            }

        
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 118px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:Label ID="lblvis1" runat="server" Text="Successfully Signed Up!!" Font-Size="Larger"  Font-Bold="true" ForeColor="Green" Visible="false"></asp:Label>
    <br /><br /><br /> <center><div id="d1" style="float:left"><table>
        <tr>
            <td>
                User id
            </td>
            <td>
                <asp:TextBox ID="txtuserid" runat="server" OnTextChanged="txtuserid_TextChanged"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>
                Password
            </td>
            <td>
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            
        </tr>
        <tr><td></td>
            <td>
                <asp:RadioButtonList ID="rbbtn" runat="server">
                    <asp:ListItem Text="Do TestDrive">    </asp:ListItem>
                    <asp:ListItem Text="Purchase Car"> </asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="btnsignin" Text="Sign in" runat="server" OnClick="btnsignin_Click" BackColor="#3366FF" BorderColor="#3366FF" Font-Bold="True" Font-Names="Comic Sans MS" style="height: 29px" /></td>
            <td><asp:Button ID="btnCancel" Text="Cancel" runat="server" BackColor="#0066FF" BorderColor="#3366FF" Font-Bold="True" Font-Names="Comic Sans MS" /></td>
           
        </tr>
        <center><tr>
            <td colspan="2"><asp:Button ID="btnnewsignup" Text="No Account? Register Now in 1 Step" runat="server" OnClick="btnnewsignup_Click" BackColor="#0066FF" Font-Bold="True" Font-Names="Comic Sans MS" /></td>
                </tr></center>
    </table></div></center>
    <asp:Panel ID="panelid" runat="server" Visible="false"  >
        <table style="width:517px; height:200px;">
        <tr>
            <td><span> UserId</span></td>
            <td><asp:TextBox ID="txtid" runat="server"  onblur="return userid()" OnTextChanged="txtid_TextChanged"></asp:TextBox></td>
             <td class="auto-style1">
                <asp:Label ID="lblvis" runat="server" Text="Userid Already Exist" Visible="false" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><span> FirstName</span></td>
            <td> <asp:TextBox ID="Txtfname" runat="server" onblur="return fname()"></asp:TextBox></td>
        </tr>
        <tr>
            <td><span>LastName</span></td>
            <td> <asp:TextBox ID="Txtlname" runat="server" onblur="return lname()"></asp:TextBox></td>
        </tr>
        <tr>
            <td><span> PassWord</span></td>
            <td> <asp:TextBox ID="txtpass1" runat="server" TextMode="Password" onblur="return pass()"></asp:TextBox></td>
        </tr>
        <tr>
            <td><span> ConfirmPassword</span></td>
            <td> <asp:TextBox ID="Txtcpass" runat="server" TextMode="Password" onblur="return passwordcheck()"></asp:TextBox></td>
        </tr>
        <tr>
            <td><span>Mobile No </span></td>
            <td><asp:TextBox ID="txtmobile" runat="server" onblur="return mobilecheck()"></asp:TextBox></td>
        </tr>
        <tr>
            <td><span> Email_id</span></td>
            <td><asp:TextBox ID="Txtemail" runat="server"></asp:TextBox></td>
        </tr>
            <tr>
                <td><span>Image</span></td>
                <td><asp:FileUpload ID="Fu1" runat="server" /></td>
            </tr>
        <tr>
            <td><span> Address</span></td>
            <td> <asp:TextBox ID="Txtaddress" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><span> Pincode</span></td>
            <td> <asp:TextBox ID="Txtpin" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            
            <td> <asp:Button ID="btnregister" Text="REGISTER" runat="server" BackColor="#0066FF" OnClick="btnregister_Click" BorderColor="#0066FF" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="White" ></asp:Button></td>
        
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#0066FF" Text="CANCEL" BorderColor="#0066FF" Font-Bold="True" Font-Italic="False" Font-Names="Comic Sans MS" ForeColor="White" OnClick="Button1_Click" />
                </td>

            
        </tr>
        
       
    </table>

    </asp:Panel>

    

</asp:Content>


