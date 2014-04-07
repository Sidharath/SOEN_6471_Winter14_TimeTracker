using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;


using System.IO;
using System.Xml;

namespace NarolaInfotech.Utility
{
  public static class clsSecure
  {
    #region EncryptText
    public static string EncryptText(string fsString)
    {
      return Encrypt(fsString, "&%#@?,:*");
    } 
    #endregion

    #region DecryptText
    public static string DecryptText(string fsString)
    {
      return Decrypt(fsString, "&%#@?,:*");
    } 
    #endregion

    #region Encrypt
    private static string Encrypt(string strText, string strEncrKey)
    {
      //Dim byKey() As Byte = {}
      byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };

      try
      {
        byte[] byKey = System.Text.Encoding.UTF8.GetBytes(strEncrKey);
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        byte[] inputByteArray = Encoding.UTF8.GetBytes(strText);
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        return Convert.ToBase64String(ms.ToArray());
      }

      catch (Exception ex)
      {
        return ex.Message;
      }
    } 
    #endregion

    #region Decrypt
    private static string Decrypt(string strText, string sDecrKey)
    {
      byte[] byKey = { };
      byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
      byte[] inputByteArray = new byte[strText.Length + 1];

      try
      {
        byKey = System.Text.Encoding.UTF8.GetBytes(sDecrKey);
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        inputByteArray = Convert.FromBase64String(strText);
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);

        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        System.Text.Encoding encoding = System.Text.Encoding.UTF8;

        return encoding.GetString(ms.ToArray());
      }

      catch (Exception ex)
      {
        return ex.Message;
      }

    } 
    #endregion
  }
}
