<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html lang="en">
        <head>
            <title>Biblio nueva</title>
        </head>
        <style>
            table{
                widht: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                font-family: Arial;
            }
            h1 {color:blue;
            text-align:center;}
            th, td {
                border: 2px solic blue;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: grey;
                font-weight: bold;
            }
        </style>
        <body>
            <h1>Libros posteriores a 2001</h1>
            <table>
                <tr>
                    <th>Nombre</th>
                    <th>Autor</th>
                    <th>Idioma</th>
                    <th>Año de Publicación</th>
                    <th>ISBN</th>
                </tr>
                <xsl:for-each select="number(año_primera_edicion) &gt; 1991">
                    <tr>
                        <td><xsl:value-of select="nombre"/></td>
                        <td><xsl:value-of select="autor"/></td>
                        <td><xsl:value-of select="idioma"/></td>
                        <td><xsl:value-of select="año_publicacion"/></td>
                        <td><xsl:value-of select="@ISBN"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>