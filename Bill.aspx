<%@ Page Title="" Language="C#" MasterPageFile="~/Hospital.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="HospitalBill.WebForms.Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-content">
        <div class="row-content heading">
            <h3>Hospital Bill</h3>
        </div>
        <div class="row-content">
            <asp:Label ID="lbl_BillNo" class="field-labels lbl_BillNo" runat="server" Text="Bill Number"></asp:Label>
            <asp:TextBox ID="txt_BillNo" runat="server" Enabled="False"></asp:TextBox>
            <asp:Label ID="lbl_BillDate" class="field-labels lbl_BillDate" runat="server" Text="Bill Date"></asp:Label>
            <asp:TextBox ID="txt_BillDate" runat="server" TextMode="Date" Enabled="False"></asp:TextBox>
        </div>
        <div class="row-content">
            <asp:Label ID="lbl_PatientName" class="field-labels lbl_PatientName" runat="server" Text="Patient Name"></asp:Label>
            <asp:TextBox ID="txt_PatientName" runat="server"></asp:TextBox>
            <asp:Label ID="lbl_Gender" class="field-labels lbl_Gender" runat="server" Text="Gender"></asp:Label>
            <asp:DropDownList ID="ddl_Gender" runat="server">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem Selected="True" Value="-1" Text=" ">  </asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lbl_DateOfBirth" class="field-labels lbl_DateOfBirth" runat="server" Text="Date of Birth"></asp:Label>
            <asp:TextBox ID="txt_DateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <div class="row-content">
            <asp:Label ID="lbl_Address" class="field-labels lbl_Address" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="txt_Address" class="txt_Address" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lbl_Email" class="field-labels lbl_Email" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txt_Email" runat="server" TextMode="Email"></asp:TextBox>
            <asp:Label ID="lbl_MobileNumber" class="field-labels lbl_MobileNumber" runat="server" Text="Mobile Number"></asp:Label>
            <asp:TextBox ID="txt_MobileNumber" runat="server" TextMode="Phone"></asp:TextBox>
        </div>
        <div class="row-content">
            <asp:Label ID="lbl_Investigation" class="field-labels lbl_Investigation" runat="server" Text="Investigation"></asp:Label>
            <asp:DropDownList ID="ddl_Investigation" runat="server">
                <asp:ListItem>Investigation1</asp:ListItem>
                <asp:ListItem>Investigation2</asp:ListItem>
                <asp:ListItem Selected="True" Value="-1" Text=" ">  </asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lbl_Fee" class="field-labels lbl_Fee" runat="server" Text="Fee"></asp:Label>
            <asp:TextBox ID="txt_Fee" runat="server" Enabled="False"></asp:TextBox>
            <asp:Button ID="btn_AddToGrid" class="btn_AddToGrid" runat="server" Text="Add To Grid"
                BackColor="#0066CC" BorderColor="#0066CC" BorderStyle="Solid"
                ForeColor="White" OnClick="btn_AddToGrid_Click" />
            <%--<asp:ImageButton ID="ImageButton1" runat="server" />--%>
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="BillNumber"
        ShowHeaderWhenEmpty="True"
        OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <%-- Theme Properties  --%>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
        <Columns>

            <asp:TemplateField HeaderText="PatientName">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("PatientName") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatientName" Text='<%#Eval("PatientName") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtPatientNameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Gender") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtGender" Text='<%#Eval("Gender") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGenderFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Address") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" Text='<%#Eval("Address") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddressFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MobileNumber">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("MobileNumber") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtMobileNumber" Text='<%#Eval("MobileNumber") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtMobileNumberFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EmailId">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("EmailId") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmailId" Text='<%#Eval("EmailId") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtEmailIdFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Investigation">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Investigation") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtInvestigation" Text='<%#Eval("Investigation") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtInvestigationFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fee">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Fee") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtFee" Text='<%#Eval("Fee") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtFeeFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ImageUrl="~/png/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                    <asp:ImageButton ImageUrl="~/png/Delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ImageUrl="~/png/Save.png" runat="server" CommandName="Save" ToolTip="Save" Width="20px" Height="20px" />
                    <asp:ImageButton ImageUrl="~/png/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:ImageButton ImageUrl="~/png/addnew.png" runat="server" CommandName="AddNew" ToolTip="AddNew" Width="20px" Height="20px" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

