using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalBill.WebForms
{
    public partial class BillCrud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox5.Text = DateTime.Now.ToString();

            if (!IsPostBack)
            {
                GetHosList();
            }
        }
        protected void TextBoxStartDate_TextChanged(object sender, EventArgs e)
        {
            TextBox5.Text = DateTime.Now.ToString("dd-MM-yyyy");
            
        }
        SqlConnection connection = new SqlConnection(@"Data Source=192.168.0.89;Initial Catalog=INTERVIEW;User ID=interview;Password=interview@123");
        protected void Button1_Click(object sender, EventArgs e)
        {
            int BillNumber = int.Parse(TextBox1.Text);
            string PatientName = TextBox2.Text, Address = TextBox3.Text, EmailId = TextBox4.Text,
                MobileNumber = TextBox7.Text, Fee = TextBox6.Text, Investigation = DropDownList1.SelectedValue, Gender = DropDownList2.SelectedValue;
            DateTime BillDate = DateTime.Parse(TextBox5.Text);
            connection.Open();
            SqlCommand co = new SqlCommand("exec pranellore_sp '" + BillNumber + "','" + BillDate + "','" + PatientName + "','" + Gender + "','" + Address + "','"
              + EmailId + "','" + MobileNumber + "','" + Investigation + "','" + Fee + "'", connection);

            co.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully Inserted.');", true);
            GetHosList();
        }
        void GetHosList()
        {
            SqlCommand co = new SqlCommand("exec hyper ", connection);
            SqlDataAdapter sd = new SqlDataAdapter(co);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Add Bill by clicking on ok  .');", true);
            GetHosList();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int BillNumber = int.Parse(TextBox1.Text);
            string PatientName = TextBox2.Text, Address = TextBox3.Text, EmailId = TextBox4.Text,
                MobileNumber = TextBox7.Text, Fee = TextBox6.Text, Investigation = DropDownList1.SelectedValue, Gender = DropDownList2.SelectedValue;
            DateTime BillDate = DateTime.Parse(TextBox5.Text);
            connection.Open();
            SqlCommand co = new SqlCommand("exec praveenupdateSP '" + BillNumber + "','" + BillDate + "','" + PatientName + "','" + Gender + "','" + Address + "','"
                + EmailId + "','" + MobileNumber + "','" + Investigation + "','" + Fee + "'", connection);

            co.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully updated.');", true);
            GetHosList();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Add Bill by clicking on ok  .');", true);
            GetHosList();

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int BillNumber = int.Parse(TextBox1.Text);

            connection.Open();
            SqlCommand co = new SqlCommand("exec praveendeleteSP '" + BillNumber + "'", connection);

            co.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully deleted.');", true);
            GetHosList();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", "attachment; filename=HospitalBill.xls");
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
           
        }

        

        protected void Button7_Click(object sender, EventArgs e)
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename=HospitalBill.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            DivToPrint.RenderControl(hw);
           //Document doc = new Document(PageSize.A4, 50f, 50f, 30f, 30f);
          



        }


        
    }
}