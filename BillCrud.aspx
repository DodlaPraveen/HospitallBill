<%@ Page Title="" Language="C#" MasterPageFile="~/Hospital.Master" AutoEventWireup="true" CodeBehind="BillCrud.aspx.cs" Inherits="HospitalBill.WebForms.BillCrud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 83%;
            height: 312px;
            margin-left: 103px;
        }
        .auto-style2 {
            width: 523px;
            margin-left: 40px;
        }
        .auto-style3 {
            width: 372px;
        }
        .auto-style4 {
            width: 365px;
        }
        .auto-style5 {
            margin-left: 240px;
            height: 65px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hospital Bill</h1>
    </div>




    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="BillNumber"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium"  style="margin-left: 49px"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label5" runat="server" Text="BillDate"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium"  style="margin-left: 38px" Width="182px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="PatientName"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium"  style="margin-left: 17px"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="Medium" Width="200px">
                    <asp:ListItem>Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Address"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium"  style="margin-left: 73px"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:Label ID="Label7" runat="server" Text="EmailId"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium"  style="margin-left: 29px"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label9" runat="server" Text="MobileNumber"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox7" runat="server" Font-Size="Medium"  style="margin-left: 29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Investigation"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="Medium" style="margin-left: 41px" Width="200px">
                    <asp:ListItem>Disease</asp:ListItem>
                    <asp:ListItem>cancer</asp:ListItem>
                    <asp:ListItem>Tuberculosis</asp:ListItem>
                    <asp:ListItem>corona</asp:ListItem>
                    <asp:ListItem>Typhoid</asp:ListItem>
                    <asp:ListItem>Dengue</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style3">
                <asp:Label ID="Label8" runat="server" Text="Fee"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium"  style="margin-left: 57px"></asp:TextBox>
            </td>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="Lime" BorderStyle="Solid" style="margin-left: 40px" Text="AddToGrid" OnClick="Button1_Click" Width="162px" Height="41px" />
                </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="3">&nbsp;</td>
        </tr>
    </table>
    <div>


        <asp:GridView ID="GridView1" runat="server" style="margin-left: 240px" Width="976px" BackColor="#CCFFFF" Height="159px">
        </asp:GridView>


        <br />
                <asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" BorderStyle="Solid" style="margin-left: 40px" Text="Add" OnClick="Button2_Click" Width="162px" Height="41px" />
                <asp:Button ID="Button3" runat="server" BackColor="#CCCCCC" BorderStyle="Solid" style="margin-left: 40px" Text="Update" OnClick="Button3_Click" Width="162px" Height="41px" />
                <asp:Button ID="Button4" runat="server" BackColor="#CCCCCC" BorderStyle="Solid" style="margin-left: 40px" Text="Save" OnClick="Button4_Click" Width="162px" Height="41px" />
                <asp:Button ID="Button5" runat="server" BackColor="#CCCCCC" BorderStyle="Solid" style="margin-left: 40px" Text="Delete" OnClick="Button5_Click" Width="162px" Height="41px" />
                <asp:Button ID="Button6" runat="server" BackColor="#CCCCCC" BorderStyle="Solid" style="margin-left: 40px" Text="Export" OnClick="Button6_Click" Width="162px" Height="41px" />
                <asp:Button ID="Button7" runat="server" BackColor="#CCCCCC" BorderStyle="Solid" style="margin-left: 40px" Text="Print" OnClick="Button7_Click" Width="162px" Height="41px" />


    </div>




</asp:Content>
