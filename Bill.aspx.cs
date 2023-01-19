using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalBill.WebForms
{
    public partial class Bill : System.Web.UI.Page
    {
        string connectionstring = @"Data Source=192.168.0.89;Initial Catalog=INTERVIEW;User ID=interview;Password=interview@123";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatedGridView();
            }
        }

       public void PopulatedGridView()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM myHospital", sqlCon);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Data Found";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }


        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionstring))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO myHospital (PatientName,Gender,Address,MobileNumber,EmailId,Investigation,Fee) VALUES (@PatientName,@Gender,@Address,@MobileNumber,@EmailId,@Investigation,@Fee)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.AddWithValue("@PatientName", (GridView1.FooterRow.FindControl("lbl_PatientName") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Gender", (GridView1.FooterRow.FindControl("txtGenderFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Address", (GridView1.FooterRow.FindControl("txtAddressFooter") as TextBox).Text.Trim());

                        sqlCmd.Parameters.AddWithValue("@MobileNumber", (GridView1.FooterRow.FindControl("txtMobileNumberFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@EmailId", (GridView1.FooterRow.FindControl("txtEmailIdFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Investigation", (GridView1.FooterRow.FindControl("txtInvestigationFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Fee", (GridView1.FooterRow.FindControl("txtFeeFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulatedGridView();

                    }


                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                using (SqlConnection sqlCon = new SqlConnection(connectionstring))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM myHospital WHERE BillNumber = @BillNumber  ";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@BillNumber", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));

                    sqlCmd.ExecuteNonQuery();
                    PopulatedGridView();


                }


            }

            catch (Exception)
            {

                throw;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            PopulatedGridView();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            PopulatedGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                using (SqlConnection sqlCon = new SqlConnection(connectionstring))
                {
                    sqlCon.Open();
                    string query = "UPDATE myHospital SET PatientName=@PatientName,Gender=@Gender,Address=@Address,MobileNumber=@MobileNumber,EmailId=@EmailId,Investigation=@Investigation,Fee=@Fee WHERE BillNumber=@BillNumber";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@PatientName", (GridView1.Rows[e.RowIndex].FindControl("txtPatientName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Gender", (GridView1.Rows[e.RowIndex].FindControl("txtGender") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Address", (GridView1.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text.Trim());

                    sqlCmd.Parameters.AddWithValue("@MobileNumber", (GridView1.Rows[e.RowIndex].FindControl("txtMobileNumber") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@EmailId", (GridView1.Rows[e.RowIndex].FindControl("txtEmailId") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Investigation", (GridView1.Rows[e.RowIndex].FindControl("txtInvestigation") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Fee", (GridView1.Rows[e.RowIndex].FindControl("txtFee") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@BillNumber", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    GridView1.EditIndex = -1;
                    sqlCmd.ExecuteNonQuery();
                    PopulatedGridView();


                }


            }

            catch (Exception)
            {

                throw;
            }
        }
        static string connectionString = ConfigurationManager.ConnectionStrings["INTERVIEWConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        protected void btn_AddToGrid_Click(object sender, EventArgs e)
        {

            connection.Open();
            string query = "INSERT INTO myHospital (PatientName,Gender,Address,MobileNumber,EmailId,Investigation,Fee) VALUES (@PatientName,@Gender,@Address,@MobileNumber,@EmailId,@Investigation,@Fee)";
            SqlCommand sqlCmd = new SqlCommand(query, connection);

            sqlCmd.Parameters.AddWithValue("@PatientName", (GridView1.FooterRow.FindControl("txtPatientNameFooter") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Gender", (GridView1.FooterRow.FindControl("txtGenderFooter") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Address", (GridView1.FooterRow.FindControl("txtAddressFooter") as TextBox).Text.Trim());

            sqlCmd.Parameters.AddWithValue("@MobileNumber", (GridView1.FooterRow.FindControl("txtMobileNumberFooter") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EmailId", (GridView1.FooterRow.FindControl("txtEmailIdFooter") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Investigation", (GridView1.FooterRow.FindControl("txtInvestigationFooter") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Fee", (GridView1.FooterRow.FindControl("txtFeeFooter") as TextBox).Text.Trim());
            sqlCmd.ExecuteNonQuery();
            PopulatedGridView();
        }
    }
}