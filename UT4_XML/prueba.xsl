<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
    <xsl:template match="/biblio/libros">
        <html lang="en">
        <head>
            <title>Biblio</title>
        </head>
        <style>
            table{
                widht: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                font-family: Arial;
            }
            th,td{
                border: 1px solid #ccc;
                padding: 10px;
                text-align: center;
            }
            th{
                background-color: #333;
                color: azure;
            }
            tr:nth-child(even){
                background-color: #f2f2f2;
            }
            h1{
                text-align: center;
                font-family: Verdana;
                color: #444;
            }
        </style>
        <body>
            <h1>Libros posteriores a 2001</h1>
            <table>
                <tr>
                    
                    <th>Nombre</th>
                    <th>Autor</th>                   
                </tr>
                <xsl:for-each select="libro">
                    <xsl:if test="number(anyo_primera_edicion) &gt; 1991">
                        <tr>                            
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="autor"/></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
            
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>