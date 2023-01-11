using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;

/******************************************************************************/
/* Copyright(c) 2023 Password Manager Application Inc.                        */
/* All rights reserved.                                                       */
/*                                                                            */
/* Description : Login Page and Controls                                      */
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
  public partial class WebForm1 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
      string constr = WebConfigurationManager.ConnectionStrings["PasswordManagerConnectionString"].ConnectionString;
      SqlConnection con = new SqlConnection(constr);

      try
      {
        con.Open();
        SqlCommand sqlcmd = new SqlCommand("SELECT COUNT(*) FROM TBL_USER WHERE Username='"+TboxUsername.Text+"' AND Password='"+TboxPassword.Text+"' ",con);
        SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        sqlcmd.ExecuteNonQuery();
        if (dt.Rows[0][0].ToString() == "1")
        {
          SqlCommand sqlcmd2 = new SqlCommand("SELECT ID FROM TBL_USER WHERE Username='" + TboxUsername.Text + "' AND Password='" + TboxPassword.Text + "' ", con);
          SqlDataAdapter sda2 = new SqlDataAdapter(sqlcmd2);
          DataTable dt2 = new DataTable();
          sda2.Fill(dt2);
          sqlcmd2.ExecuteNonQuery();

          Session["UserID"] = dt2.Rows[0][0].ToString();
          Session["Username"] = TboxUsername.Text.Trim();
          Response.Redirect("~/MyPasswords.aspx");
        }
        else
        {
          Response.Write("<script>alert('Login Incorrect, Please check your Username or Password!')</script>");
        }
      }
      catch (Exception)
      {

        throw;
      }
    }
  }
}