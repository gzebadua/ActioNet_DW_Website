using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;

namespace dw_website
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Text = Request.LogonUserIdentity.Name;
        }

        public static string StringConnection()
        {
            return "Server=Vdbw006\\dw;Database=dwmain;Trusted_Connection=True;";
        }

        [WebMethod]
        public static int saveData(string val1, string val2, string val3)
        {
            try
            {
                int status = 1;
                string Query = string.Empty;
                using (SqlConnection dbConnection = new SqlConnection(StringConnection()))
                {
                    Query = "INSERT INTO nameOfTable (Col1,Col2,Col4) VALUES ('" + val1 + "','" + val2 + "'," + val3 + ")";
                    SqlCommand cmd = new SqlCommand(Query, dbConnection);

                    dbConnection.Open();
                    cmd.ExecuteNonQuery();
                    dbConnection.Close();
                }
                return status;
            }
            catch
            {
                return -1;
            }
        }

    }
}