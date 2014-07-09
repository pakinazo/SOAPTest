using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Net;
using System.IO;


namespace WebTestXML
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SOAP();
        }

        private void SOAP()
        {
            //System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            //Usado para la página con el SSL Inválido (página de payu pruebas)

            WebRequest req = null;
            WebResponse rsp = null;
            try
            {
                string fileName = Server.MapPath("~/File/Soap.xml");
                string uri = "https://api-3t.sandbox.paypal.com/2.0/";
                req = WebRequest.Create(uri);
                //req.Proxy = WebProxy.GetDefaultProxy(); // Enable if using proxy
                req.Method = "POST";        // Post method
                req.ContentType = "application/xml";     // content type
                // Wrap the request stream with a text-based writer
                StreamWriter writer = new StreamWriter(req.GetRequestStream());
                //// string strReq = "<?xml version=\"1.0\" encoding=\"utf-8\"?><request><language>en</language><command>GET_PAYMENT_METHODS</command><merchant><apiLogin>012345678901</apiLogin><apiKey>012345678901</apiKey></merchant><isTest>false</isTest></request>";

                // Write the XML text into the stream
                writer.WriteLine(this.GetTextFromXMLFile(fileName));
                ////writer.WriteLine(strReq);
                writer.Close();
                // Send the data to the webserver
                rsp = req.GetResponse(); //I am getting error over here
                StreamReader sr = new StreamReader(rsp.GetResponseStream());
                string result = sr.ReadToEnd();
                sr.Close();
                lbSOAP.Text = result;
                Console.Write(result);

            }
            catch (WebException webEx)
            {
                Console.Write(webEx.Message.ToString());
                Console.Write(webEx.StackTrace.ToString());
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message.ToString());
                Console.Write(ex.StackTrace.ToString());
            }
            finally
            {
                if (req != null) req.GetRequestStream().Close();
                if (rsp != null) rsp.GetResponseStream().Close();
            }

        }

        private string GetTextFromXMLFile(string file)
        {
            StreamReader reader = new StreamReader(file);
            string ret = reader.ReadToEnd();
            reader.Close();
            return ret;
        }


    }
}