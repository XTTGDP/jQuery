using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    /// <summary>
    /// 获取创建的所有相册名称
    /// </summary>
    public void GetPhotoDirectory()
    {
        string path = Server.MapPath("~/uploads/");
        string[] D_Name = Directory.GetDirectories(path);
        if (D_Name.Length == 0)
        {
            ddlDir.Items.Add("无");
        }
        else
        {
            foreach (string s in D_Name)
            {
                ddlDir.Items.Add(Path.GetFileName(s));
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetPhotoDirectory();
        }
    }

    //此处两个变量必须声明为静态的，否则当单击按钮重新刷新页面后，其值还会是初始化的值
    static int curpage = 1;//记录当前页码
    static System.Web.UI.WebControls.PagedDataSource ps;//控件数据源对象
    private void dataBind()
    {
        string path = Server.MapPath("~/uploads/");
        path = path + this.ddlDir.SelectedItem.Text + "\\s";
        if (Directory.Exists(path))
        {
            string[] files = Directory.GetFiles(path);
            if (files.Length != 0)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("images");
                dt.Columns.Add("source");
                foreach (string s in files)
                {
                    if (Path.GetExtension(s) != ".db")
                    {
                        string[] a = { "uploads/" + this.ddlDir.SelectedItem.Text.Trim() + "/s/" + Path.GetFileName(s), "uploads/" + this.ddlDir.SelectedItem.Text.Trim() + "/" + Path.GetFileName(s) };
                        dt.Rows.Add(a);
                    }
                }
                ps = new PagedDataSource();
                ps.DataSource = dt.DefaultView;
                ps.AllowPaging = true;
                ps.PageSize = 6;
                ps.CurrentPageIndex = curpage - 1;
                DataList1.DataSource = ps;
            }
            else
            {
                DataList1.DataSource = null;
            }
            if (ps.PageCount > 1)
            {

                ImageButton1.Visible = true;
                ImageButton2.Visible = true;
            }
            else
            {
                ImageButton1.Visible = false;
                ImageButton2.Visible = false;
            }
            DataList1.DataBind();
        }
        else
        {
            DataList1.DataSource = null;
            DataList1.DataBind();
            ImageButton1.Visible = false;
            ImageButton2.Visible = false;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (curpage < ps.PageCount)
        {
            curpage++;
            dataBind();
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (curpage > 1)
        {
            curpage--;
            dataBind();
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ddlDir.SelectedItem.Text != "无")
        {
            curpage = 1;
            dataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ddlDir.Items.Clear();
        GetPhotoDirectory();
    }
}  
