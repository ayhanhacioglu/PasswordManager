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
/* Description : Category Management Process And Their Controls               */
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
  public partial class WebForm4 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      LblCategoryUserName.Text = "Hi " + Session["Username"] + ", Welcome to Password Manager Application!"; //+ Session["UserID"];
    }

    protected void BtnCategoryInsert_Click(object sender, EventArgs e)
    {
      DsCategory.InsertParameters["UserID"].DefaultValue = Session["UserID"].ToString();
      DsCategory.InsertParameters["CategoryName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtCategoryName")).Text;
      DsCategory.Insert();
    }

    protected void BtnCategoryLogout_Click(object sender, EventArgs e)
    {
      Session.Abandon();
      Response.Redirect("~/Default.aspx");
    }

    protected void BtnGoToMyPassword_Click(object sender, EventArgs e)
    {
      Response.Redirect("~/MyPasswords.aspx");
    }
     
  }
}