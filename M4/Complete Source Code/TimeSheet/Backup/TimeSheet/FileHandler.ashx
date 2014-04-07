<%@ WebHandler Language="C#" Class="FileHandler" %>

using System;
using System.Web;

public class FileHandler : IHttpHandler , System.Web.SessionState.IReadOnlySessionState
{
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            System.IO.Stream outputStream = context.Response.OutputStream;

            byte[] file = (byte[])context.Session["AttachedFile"];
            string fileName = context.Request.QueryString["fileName"].ToString().Trim();
            string contentType = context.Request.QueryString["contentType"].ToString().Trim();

            context.Response.ContentType = contentType;
            context.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0};", fileName));
            outputStream.Write(file, 0, file.Length);
            context.Response.End();
        }
        finally
        {
            context.Session["AttachedFile"] = null;
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}