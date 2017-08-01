<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebTestXML.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%if (Request.QueryString["d"] == "1") { %>
      
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta property="og:site_name" content="Algún nombre de alguien" />
<meta property="og:type" content="article" />
<meta property="og:title" content="Título aquí" />
<meta property="og:image" content="http://resultados.tiempooficial.com/rutas/140.png"/>
<meta name="description" content="Aquí va toda la descripción que quieran" />
       <% }else{%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta property="og:site_name" content="Prueba 2" />
<meta property="og:type" content="article" />
<meta property="og:title" content="Título2 aquíx" />
<meta property="og:image" content="http://resultados.tiempooficial.com/rutas/145.png"/>
<meta name="description" content="Aquí 2 va toda la inscripción" />
    <% }%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
