<%@ WebHandler Language="C#" Class="upload" %>

using System;
using System.Web;
using System.Web.SessionState;
public class upload : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            if (context.Request.Files.Count > 0)
            {
                
                string tempFile = context.Request.PhysicalApplicationPath+context.Request["folder"].Trim('/').Replace("/","\\");
                if (!System.IO.Directory.Exists(tempFile+"\\s"))
                {
                    System.IO.Directory.CreateDirectory(tempFile+"\\s"); 
                }
                for (int j = 0; j < context.Request.Files.Count; j++)
                {
                    HttpPostedFile uploadFile = context.Request.Files[j];
                    if (uploadFile.ContentLength > 0)
                    {
                        uploadFile.SaveAs(tempFile+"\\"+System.IO.Path.GetFileName(uploadFile.FileName));
                        MakeThumbnail(tempFile + "\\" + System.IO.Path.GetFileName(uploadFile.FileName), tempFile + "\\s\\" + System.IO.Path.GetFileName(uploadFile.FileName), 80, 80);
                    }
                }
            }
            HttpContext.Current.Response.Write(" ");
        }
        catch
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }
    }

    private void MakeThumbnail(string sourcePath, string newPath, int width, int height)
    {
        System.Drawing.Image ig = System.Drawing.Image.FromFile(sourcePath);
        int towidth = width;
        int toheight = height;
        int x = 0;
        int y = 0;
        int ow = ig.Width;
        int oh = ig.Height;
        if ((double)ig.Width / (double)ig.Height > (double)towidth / (double)toheight)
        {
            oh = ig.Height;
            ow = ig.Height * towidth / toheight;
            y = 0;
            x = (ig.Width - ow) / 2;

        }
        else
        {
            ow = ig.Width;
            oh = ig.Width * height / towidth;
            x = 0;
            y = (ig.Height - oh) / 2;
        }
        System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
        g.Clear(System.Drawing.Color.Transparent);
        g.DrawImage(ig, new System.Drawing.Rectangle(0, 0, towidth, toheight), new System.Drawing.Rectangle(x, y, ow, oh), System.Drawing.GraphicsUnit.Pixel);
        try
        {
            bitmap.Save(newPath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            ig.Dispose();
            bitmap.Dispose();
            g.Dispose();
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}