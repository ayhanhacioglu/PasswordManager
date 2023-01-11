using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

/******************************************************************************/
/* Copyright(c) 2023 Password Manager Application Inc.                        */
/* All rights reserved.                                                       */
/*                                                                            */
/* Description : Password Management Process And Their Controls               */
/* Purpose :                                                                  */
/* Limitations :                                                              */
/*                                                                            */
/* History:                                                                   */
/* Version Date Person Description                                            */
/* 1.0 09/01/2023 AH on going                                                 */
/* Comments:                                                                  */
/*                                                                            */
/* Aliases:                                                                   */
/* AH : Ayhan HACIOGLU                                                        */
/******************************************************************************/

namespace PasswordManager
{
  public partial class WebForm3 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

      LblMyPassUserName.Text = "Hi " + Session["Username"] + ", Welcome to Password Manager Application!"; //+ Session["UserID"];

      string constr = WebConfigurationManager.ConnectionStrings["PasswordManagerConnectionString"].ConnectionString;
      SqlConnection con = new SqlConnection(constr);
      
      try
      {
        con.Open();
        SqlCommand sqlcmd = new SqlCommand("SELECT COUNT (*) FROM TBL_CATEGORY WHERE UserID= '" + Session["UserID"] + "'", con);
        SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        sqlcmd.ExecuteNonQuery();
        if (dt.Rows[0][0].ToString() == "0")
        {
          //Response.Write("<script>alert('This account has already been taken! Please change your Username!')</script>");
          string sqlcategoryinsert = "INSERT INTO [TBL_CATEGORY] (UserID, CategoryName) VALUES ('" + Session["UserID"] + "','Password Manager')";
          string sqlpasswordmanagerinsert = "INSERT INTO [TBL_PASSWORD] (UserID, PasswordName, Username, Password, URL, CategoryID) SELECT U.ID,'Password Manager', U.Username, U.Password,'https://www.passwordmanager.com', C.ID FROM TBL_USER U JOIN TBL_CATEGORY C ON U.ID = C.UserID WHERE U.ID = '" + Session["UserID"] + "'";
          using (SqlConnection cn = new SqlConnection(constr))
          using (SqlCommand cmdcategoryinsert = new SqlCommand(sqlcategoryinsert, cn))
          using (SqlCommand cmdpasswordmanagerinsert = new SqlCommand(sqlpasswordmanagerinsert, cn))
          {
            cn.Open();
            cmdcategoryinsert.ExecuteNonQuery();
            cmdpasswordmanagerinsert.ExecuteNonQuery();
            cn.Close();
          }
        }
      }
      catch (Exception)
      {
        throw;
      }
    }

    //ToDo AH@11012023
    //public void BindGridView()
    //{

    //  if (GridView1.Rows.Count > 0) //(((DataTable)this.Get_Details()).Rows.Count > 0)
    //  {
    //    GridView1.DataSource = DsPassword; //this.Get_Details();
    //    GridView1.DataBind();
    //  }
    //  else
    //  {
    //    GridView1.DataSource = this.Get_EmptyDataTable();
    //    GridView1.DataBind();
    //  }
    //}

    //public DataTable Get_Details()
    //{
    //  DataTable dt = new DataTable();
    //  DataRow dr;
    //  string PasswordName = "PassName1,PassName2,PassName3,PassName4,PassName5";
    //  string Username = "Name1,Name2,Name3,Name4,Name5";
    //  string Password = "Pass1,Pass2,Pass3,Pass4,Pass5";
    //  string URL = "URL1,URL2,URL3,URL4,URL5";
    //  string CategoryID = "1,2,3,4,5";

    //  string[] list1 = PasswordName.Split(',');
    //  string[] list2 = Username.Split(',');
    //  string[] list3 = Password.Split(',');
    //  string[] list4 = URL.Split(',');
    //  string[] list5 = CategoryID.Split(',');

    //  dt.Columns.Add("PasswordName", typeof(Double));
    //  dt.Columns.Add("Username", typeof(string));
    //  dt.Columns.Add("Password", typeof(string));
    //  dt.Columns.Add("URL", typeof(string));
    //  dt.Columns.Add("CategoryID", typeof(DateTime));

    //  //* Uncomment below section of code to see gridview populating with data
    //  //for (int i = 0; i < list1.Length; i++)
    //  //{
    //  //    dr = dt.NewRow();
    //  //    dr["ContactName"] = list1[i];
    //  //    dr["City"] = list2[i];
    //  //    dr["Country"] = list3[i];
    //  //    dr["Price"] = list4[i];
    //  //    dr["Date"] = DateTime.Now;
    //  //    dt.Rows.Add(dr);
    //  //}

    //  return dt;
    //}


    //public DataTable Get_EmptyDataTable()
    //{
    //  DataTable dtEmpty = new DataTable();

    //  dtEmpty.Columns.Add("PasswordName", typeof(string));
    //  dtEmpty.Columns.Add("Username", typeof(string));
    //  dtEmpty.Columns.Add("Password", typeof(string));
    //  dtEmpty.Columns.Add("URL", typeof(string));
    //  dtEmpty.Columns.Add("CategoryID", typeof(int));
    //  DataRow datatRow = dtEmpty.NewRow();


    //  dtEmpty.Rows.Add(datatRow);//adding row to the datatable
    //  return dtEmpty;
    //}

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
      DsPassword.InsertParameters["UserID"].DefaultValue = Session["UserID"].ToString();
      DsPassword.InsertParameters["PasswordName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtPasswordName")).Text;
      DsPassword.InsertParameters["Username"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtUserName")).Text;
      DsPassword.InsertParameters["Password"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtPassword")).Text;
      DsPassword.InsertParameters["URL"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtURL")).Text;
      DsPassword.InsertParameters["CategoryID"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DdlCategorylistall")).SelectedValue;
      DsPassword.Insert();
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
      Session.Abandon();
      Response.Redirect("~/Default.aspx");
    }

    protected void BtnEdtCategory_Click(object sender, EventArgs e)
    {
      Response.Redirect("~/Category.aspx");
    }
  }
}