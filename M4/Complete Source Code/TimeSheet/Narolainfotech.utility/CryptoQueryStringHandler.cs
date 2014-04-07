using System.Collections.Specialized;
using System.Text;

namespace NarolaInfotech.Utility
{
    /// <summary>
    /// This class contains methods to en-/decrypt query strings.
    /// </summary>
    public static class CryptoQueryStringHandler
    {
        /// <summary>
        /// Encrypt query strings from string array.
        /// </summary>
        /// <param name="unencryptedStrings">Unencrypted query strings in the format 'param=value'.</param>
        /// <param name="key">Key, being used to encrypt.</param>
        /// <returns></returns>
        public static string EncryptQueryStrings(string[] unencryptedStrings, string key)
        {
            StringBuilder strings = new StringBuilder();

            foreach (string unencryptedString in unencryptedStrings)
            {
                if (strings.Length > 0) strings.Append("&");
                strings.Append(unencryptedString);
            }

            return string.Concat("request=", Encryption64.Encrypt(strings.ToString(), key));
        }

        /// <summary>
        /// Encrypt query strings from name value collection.
        /// </summary>
        /// <param name="unencryptedStrings">Unencrypted query strings.</param>
        /// <param name="key">Key, being used to encrypt.</param>
        /// <returns></returns>
        public static string EncryptQueryStrings(NameValueCollection unencryptedStrings, string key)
        {
            StringBuilder strings = new StringBuilder();

            foreach (string stringKey in unencryptedStrings.Keys)
            {
                if (strings.Length > 0) strings.Append("&");
                strings.Append(string.Format("{0}={1}", stringKey, unencryptedStrings[stringKey]));
            }

            return string.Concat("request=", Encryption64.Encrypt(strings.ToString(), key));
        }

        /// <summary>
        /// Decrypt query string.
        /// </summary>
        /// <param name="encryptedStrings">Encrypted query string.</param>
        /// <param name="key">Key, being used to decrypt.</param>
        /// <remarks>The query string object replaces '+' character with an empty character.</remarks>
        /// <returns></returns>
        public static string DecryptQueryStrings(string encryptedStrings, string key)
        {
            return Encryption64.Decrypt(encryptedStrings.Replace(" ", "+"), key);
        }

        /// <summary>
        /// get Parameter From Encripted Querystring
        /// </summary>
        /// <param name="psParameterName">Parameter Name</param>
        /// <returns></returns>
        public static System.String getQueryStringParameter(System.String psParameterName)
        {
            System.String lsValue = "";
            string encryptedQueryString = System.Web.HttpContext.Current.Request.QueryString["request"];
            if (!string.IsNullOrEmpty(encryptedQueryString))
            {
                // Decrypt query strings
                string cryptoKey = System.Web.Configuration.WebConfigurationManager.AppSettings["CryptoKey"];
                string decryptedQueryString = NarolaInfotech.Utility.CryptoQueryStringHandler.DecryptQueryStrings(encryptedQueryString, cryptoKey);

                System.Int32 liIndexOfParameter = decryptedQueryString.IndexOf(psParameterName) + psParameterName.Length + 1;
                System.Int32 liIndexOfEmpersand = (decryptedQueryString.IndexOf("&", liIndexOfParameter) == -1) ? decryptedQueryString.Length : decryptedQueryString.IndexOf("&", liIndexOfParameter);
                lsValue = decryptedQueryString.Substring(liIndexOfParameter, liIndexOfEmpersand - liIndexOfParameter);
            }
            return lsValue;

        }
    }
}