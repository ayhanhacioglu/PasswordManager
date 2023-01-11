using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;

/******************************************************************************/
/* Copyright(c) 2023 Password Manager Application Inc.                        */
/* All rights reserved.                                                       */
/*                                                                            */
/* Description : Self Registertration Process                                 */
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
  public partial class WebForm2 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnGeneratePassword_Click(object sender, EventArgs e)
    {
      
      string allowedChars = "";

      allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";

      allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";

      allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";

      char[] sep = { ',' };

      string[] arr = allowedChars.Split(sep);

      string passwordString = "";

      string temp = "";

      Random rand = new Random();

      for (int i = 0; i < Convert.ToInt32(8); i++)

      {

        temp = arr[rand.Next(0, arr.Length)];

        passwordString += temp;

      }
      
      TboxRegPassword.Text = passwordString;
    }

    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
      string constr = WebConfigurationManager.ConnectionStrings["PasswordManagerConnectionString"].ConnectionString;
      SqlConnection con = new SqlConnection(constr);

      try
      {
        con.Open();
        SqlCommand sqlcmd = new SqlCommand("SELECT COUNT (*) FROM TBL_USER WHERE Username= '" + TboxRegUsername.Text + "'", con);
        SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        sqlcmd.ExecuteNonQuery();
        if (dt.Rows[0][0].ToString() == "1")
        {
          Response.Write("<script>alert('This account has already been taken! Please change your Username!')</script>");
        }
        else
        {
          string sqlinsert = "INSERT INTO [TBL_USER] (Username, Password, Email, RegisterDate, ModifyDate) VALUES ('" + TboxRegUsername.Text + "','" + TboxRegPassword.Text + "','" + TboxRegEmail.Text + "','" + DateTime.Now + "','" + DateTime.Now + "')";
          using (SqlConnection cn = new SqlConnection(constr))
          using (SqlCommand cmdinsert = new SqlCommand(sqlinsert, cn))
          {
            cn.Open();
            cmdinsert.ExecuteNonQuery();
            cn.Close();

            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('Registration complete, you are redirecting Login Page!');");
            Response.Write("document.location.href='../Default.aspx';");
            Response.Write("</script>");
          }
        }

      }
      catch (Exception)
      {

        throw;
      }
    }

    protected void BtnRegLogout_Click(object sender, EventArgs e)
    {
      Session.Abandon();
      Response.Redirect("~/Default.aspx");
    }
  }
}