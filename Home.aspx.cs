using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Session.Clear();
            DataSet dataSet = new DataSet();
            dataSet.ReadXml(Server.MapPath("~/Products.xml"));
            ProductGrid.DataSource = dataSet;
            ProductGrid.DataBind();
        }
    }

    protected void cartButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Cart.aspx");
    }

    protected void ExtractProduct(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            cartButton.Enabled = true;
            //GridViewRow gridViewRow = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            //int index = (int)ProductGrid.DataKeys[gridViewRow.RowIndex].Value;    
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = ProductGrid.Rows[index];
            List<string> productsList = new List<string>();
            int quantity = 0;
            int id = index + 1;
            string item = row.Cells[0].Text;
            string name = row.Cells[1].Text;
            string description = row.Cells[2].Text;
            decimal price = Convert.ToDecimal(row.Cells[4].Text);
            if (productsList.Contains(item))
            {
                quantity++;
            }
            else
            {
                productsList.Add(item);
            }
            Product product = new Product(item,id);
            Cart cart = new Cart(product,price,quantity);
            Session["Session" + Session.Count] = cart;
        }
    }
}