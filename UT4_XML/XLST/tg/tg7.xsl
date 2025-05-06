<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
    <xsl:template match="/tiendaGaming">
        <html>
            <head>
                <title>Productos de <xsl:value-of select="@nombre"/></title>
            </head>
            <style>
                body{
                    font-family: Arial;
                    background-color: #f9f9f9;
                    padding: 20px;
                }
                h2 {
                    color: blue;
                }
                table {
                    border-collapse: collapse;
                    width: 100%;
                    margin-botton: 30px;
                }
                th, td {
                    border: 1px solid #333;
                    padding: 8px;
                    color: black;
                }
                th {
                    background-color: green;
                    color: azure;
                }
                h1 {
                    color: green;
                    text-align: center;
                }
            </style>
            <body>
                <h1>Productos de la tienda: <xsl:value-of select="@nombre"/></h1>
                <h2>1. Productos Agotados</h2>
                <hr/>
                <table class="agotados">                    
                    <xsl:apply-templates select="producto[number(stock) = 0]"/>
                </table>

                <h2>2.Productos con precio mayor o igual que 100 €</h2><!--modificar--> 
                <hr/>
                <table class="up_100">
                    <xsl:apply-templates select="producto[number(precio) &gt;= 100]"/>
                </table>

                <h2>3. Productos categoria teclado</h2>
                <hr/>
                <table class="teclado" >
                    <xsl:apply-templates select="producto[@categoria = 'teclado']"/>
                </table>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="producto[stock = 0]">
        <tr><xsl:value-of select="nombre"/></tr>
        <tr><xsl:value-of select="marca"/></tr>
        <tr><xsl:value-of select="precio"/></tr>        
        <!--<tr><xsl:value-of select="@categoria"/></tr>-->
        <br/>
    </xsl:template>
    <xsl:template match="producto[precio &gt;= 100]">
        <tr><xsl:value-of select="nombre"/></tr>
        <tr><xsl:value-of select="marca"/></tr>
        <tr><xsl:value-of select="precio"/></tr>        
        <!--<tr><xsl:value-of select="@categoria"/></tr>-->
        <br/>
    </xsl:template>
    <xsl:template match="producto[@categoria = 'teclado']">
        <tr><xsl:value-of select="nombre"/></tr>
        <tr><xsl:value-of select="marca"/></tr>
        <tr><xsl:value-of select="precio"/></tr>        
        <!--<tr><xsl:value-of select="@categoria"/></tr>-->
        <br/>
    </xsl:template>
</xsl:stylesheet>