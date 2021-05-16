<%@ Page Title="" Language="C#" MasterPageFile="~/C1.master" AutoEventWireup="true" CodeFile="chitchathome1.aspx.cs" Inherits="chitchathome1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="StyleSheet2.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function cntdwn(twt, twttot, tot) {
            var twtlen = twt.value.length;
            document.getElementById(tot).innerHTML = twttot - twtlen;
            if (twtlen >= twttot) {
                twt.value = twt.value.substring(-1, twttot);
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
     <style>
      
  #btnupdated   {
            border-radius:20px 20px 20px 20px;
        
        }
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content1" Runat="Server">
    <div id="d" style="width:300px;height:400px;font-family:'Bauhaus 93';float:left" >
      <asp:Image ID="userimage" Width="100px" Height="100px"  runat="server"/>
      <asp:Label ID="Label1" runat="server" Text="Welcome"/>&nbsp &nbsp;&nbsp;&nbsp;<asp:Label ID="lbldisplayuser" runat="server"></asp:Label><br /><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
     
  
    <br />
        
   
           <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="lblchitcount1" runat="server" Visible="true" Text="COUNT"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblchitcount" runat="server"></asp:Label><br /><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblfolloingcount1" runat="server" Text="FOLLOWING"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblfollowingcount" runat="server" ></asp:Label><br /><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="lblfollowerscount1" runat="server" Text="FOLLOWERS">
           </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfollowerscount" runat="server"></asp:Label>
   </div>
   <div id="d2" style="width:650px;height:500px;float:left">
       <div id="d3" style="width:600px;height:200px;border-color:black">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <%--<asp:Label ID="tot1" runat="server" Text="Characters Remaining:"></asp:Label><asp:Label ID="total" runat="server" Text="140"  ></asp:Label>--%><br />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:TextBox ID="t1"  TextMode="MultiLine" Height="49px" Width="364px" Placeholder="Enter your chits here" onkeydown="cntdwn(this,140,'total')" EnableTheming="true" runat="server"  MaxLength="140"></asp:TextBox><br /><center><asp:Label ID="lbldisp" Text="No message Entered!!" ForeColor="Red" runat="server" Visible="false" Font-Size="Small" Font-Names="Comic Sans Ms"></asp:Label></center><br />
        
          
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Button ID="btnupdated" runat="server" Font-Bold="True" Text="Update"  Width="80px" height="30px" BackColor="#0099FF" BorderStyle="Solid" Font-Names="Comic Sans MS" Font-Size="Medium" OnClick="btnupdated_Click" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        </div>
      
       <div id="d4" ><center style="height: 196px; width: 597px; float:left; margin-right: 4px;">  
         <asp:Panel ID="panelid" ScrollBars="Auto" style="z-index: 1; left: 355px; top: 287px; position: absolute; width: 599px; height: 434px" runat="server" > <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" Font-Names="Comic Sans MS" Font-Size="Medium" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDataBound="GridView1_RowDataBound1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Bold="True">
         <Columns>
       <asp:TemplateField HeaderText="ID" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ID")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
              
                    <asp:TemplateField HeaderText="PICTURE">
                <ItemTemplate>
                  <asp:Image ID="img" runat="server" ImageUrl='<%#"Picture.ashx?userid="+Eval("userid")%>' width="100px" Height="100px"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="USERID">
                <ItemTemplate>
                    <asp:Label ID="lbluserid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"USERID")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CHITS">
                <ItemTemplate>
                    <asp:Label ID="lblmessage" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CHITS")%>'></asp:Label>

                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CHITS")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="TIME">
                <ItemTemplate>
                    <asp:Label ID="lbltime" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TIME")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnedit" Text="Edit" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server"  Visible="true"/>
                    <asp:Button ID="btndelete" Text="Delete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>'  runat="server" Visible="true"  />
                    <asp:Button ID="btnreply" Text="Reply" CommandName="Insert" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>' runat="server"   Visible="true"  />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnupdate" Text="Update" CommandName="Update" runat="server" />
                    <asp:Button ID="Btncancel" Text="Cancel" CommandName="Cancel" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
         
          
        </Columns>
           </asp:GridView></asp:Panel> 
           </div>
           </center>

           <%--<asp:GridView ID="gv1" runat="server">
                <asp:GridView ID="GridView1" runat="server">
           </asp:GridView>
           </asp:GridView>--%>
       </div>
    <div id="d5" style="width:300px;height:600px;float:right"> 
        <%--<asp:AdRotator ID="add1" runat="server" AdvertisementFile="~/XMLFile.xml" OnAdCreated="add1_AdCreated" width="200px" height="400px" /> --%>   
    <table style="height:515px; width:300px; float:right; color:black; font-family:'Comic Sans MS'; margin-top: 86px;">
        <tr>
            <td>
                <img src="Images/Headshot_Large.jpg" style="height:100px; width:129px; float:left" /></td>
               <td> <b>   Mike Lawrie </b>&nbsp&nbsp<br />
                   <br />
                   <asp:label ID="dummy" Text="Follow" runat="server" BackColor="#0099FF" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"
></asp:label>            </td>
        </tr>
        <tr>
            <td>
                <img src="Images/rajnikanth.jpg" style="height:100px; width:130px; float:left" /></td>
                          <td> <b>   Rajinikanth </b> &nbsp&nbsp&nbsp&nbsp<br />
                              <br />
                              <asp:label ID="dummy1" Text="Follow" runat="server" BackColor="#0099FF" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px"
></asp:label>            </td>
        </tr>
        <tr>
            <td>
                <img src="Images/sac.jpg" style="height:100px; width:131px; float:left" /></td>
      
            <td>  <b> Sachin Tendulkar </b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:label ID="dummy2" Text="Follow" runat="server" BackColor="#0099FF" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:label> </td>
        </tr>
           
        <tr>
            <td>
                <img src="Images/images.jpg"  style="height:100px; width:137px; float:left" /></td>
      
            <td>  <b>  Mark Zuckerberg</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  <asp:label ID="Button1" Text="Follow" runat="server" OnClick="Button1_Click" BackColor="#0099FF" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:label> </td>
        </tr>
    </table>

    </div>
</asp:Content>

