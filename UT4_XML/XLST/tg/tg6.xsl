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
                    color: #333;
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
                    color: blue;
                }
            </style>
            <body>
                <h1>Productos de la tienda: <xsl:value-of select="@nombre"/></h1>
                <h2>Productos con precio mayor o igual que 100 €</h2>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Marca</th>
                        <th>Precio</th>
                        <th>Categoria</th>
                    </tr>
                    <xsl:apply-templates select="producto[number(precio) &gt;= 100]"/>
                </table>
                <h2>Productos con precio menor que 100 €</h2>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Marca</th>
                        <th>Precio</th>
                        <th>Categoria</th>
                    </tr>
                    <xsl:apply-templates select="producto[number(precio) &lt; 100]"/>                    
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="marca"/></td>
            <td><xsl:value-of select="precio"/></td>
            <td><xsl:value-of select="@categoria"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>