
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace NarolaInfotech.Utility
{
  public static class clsGenControls
  {
    #region GetHyperLinkControl
    /// <summary>
    /// Method to convert Hyper Link control.
    /// </summary>
    /// <param name="ID">Id of Hyperlink Control.</param>
    /// <param name="NavigateURL">URL of Hyperlink Control.</param>
    /// <param name="Text">Text of Hyperlink Control.</param>
    /// <param name="ToolTip">ToolTip of Hyperlink Control.</param>
    /// <param name="CssClass">Class Css of Hyperlink Control.</param>
    /// <returns>Hyper Link Control.</returns>
    public static HyperLink GetHyperLinkControl(string ID, string NavigateURL, string Text, string ToolTip, string CssClass)
    {
      HyperLink objHyperLink = new HyperLink();
      objHyperLink.ID = ID;
      objHyperLink.NavigateUrl = NavigateURL;
      objHyperLink.Text = Text;
      objHyperLink.ToolTip = ToolTip;
      objHyperLink.CssClass = CssClass;

      return objHyperLink;
    } 
    #endregion

    #region GetLabelControl
    /// <summary>
    /// Method To Convert Label Control.
    /// </summary>
    /// <param name="ID">Id of Label Contorl.</param>
    /// <param name="CssClass">CSS Class of Label Contorl.</param>
    /// <param name="Text">Text of Label Contorl.</param>
    /// <returns>Label Control.</returns>
    public static Label GetLabelControl(string ID, string CssClass, string Text)
    {

      Label objLabel = new Label();
      objLabel.ID = ID;
      objLabel.CssClass = CssClass;
      objLabel.Text = Text;

      return objLabel;
    } 
    #endregion

    #region GetImageControl
    /// <summary>
    /// Method to Convert Image Control.
    /// </summary>
    /// <param name="ID">ID of Image Control.</param>
    /// <param name="ImageUrl">Image URL of Image Control.</param>
    /// <param name="ToolTip">Tool Tip of Image Control.</param>
    /// <returns>Image Control</returns>
    public static Image GetImageControl(string ID, string ImageUrl, string ToolTip)
    {
      Image objImage = new Image();
      objImage.ID = ID;
      objImage.ImageUrl = ImageUrl;
      objImage.ToolTip = ToolTip;
      return objImage;
    } 
    #endregion

    #region GetHtmlAnchorControl
    /// <summary>
    /// Method to Convert Html Anchor Control. 
    /// </summary>
    /// <param name="ID">Id of Html Anchor Control</param>
    /// <param name="Href">Href of Html Anchor Control</param>
    /// <param name="Target">Target of Html Anchor Control</param>
    /// <returns>Html Anchor Control</returns>
    public static HtmlAnchor GetHtmlAnchorControl(string ID, string Href, string Target)
    {
      HtmlAnchor objHtmlAnchor = new HtmlAnchor();
      objHtmlAnchor.ID = ID;
      objHtmlAnchor.HRef = Href;
      objHtmlAnchor.Target = Target;

      return objHtmlAnchor;
    } 
    #endregion

    #region GetTableRow
    /// <summary>
    /// Method to Convert Table Row.
    /// </summary>
    /// <param name="pCellsValue">Value of Table Row</param>
    /// <returns></returns>
    public static HtmlTableRow GetTableRow(string[] pCellsValue)
    {
      HtmlTableRow oTr = new HtmlTableRow();
      for (int Cnt = 0; Cnt < pCellsValue.Length; Cnt++)
      { oTr.Cells.Add(GetTableCell(pCellsValue[Cnt])); }
      return oTr;
    } 
    #endregion
    
    #region GetTableCell
    /// <summary>
    /// Method to Convert Table Cell.
    /// </summary>
    /// <param name="pValue">Value of Table Cell</param>
    /// <returns></returns>
    public static HtmlTableCell GetTableCell(object pValue)
    {
      HtmlTableCell oTd = new HtmlTableCell();
      oTd.InnerHtml = pValue.ToString();
      return oTd;
    } 
    #endregion
  }
}
