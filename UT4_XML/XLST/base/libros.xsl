<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Libros Favoritos</title>
            </head>
            <style>
                h3{color:green;}
                table{border:3px solid green;}
                th{
                    color:azure;
                    background-color:blue;
                    padding:5px;
                }
                tr{text-align: center;}
                td{
                    padding: 5px;
                    border: 1px solid black;
                }
            </style>
            <body>
                <h3>Lista de libros favoritos</h3>
                <table>
                    <tr>
                        <th>TÍTULO</th>
                        <th>AUTOR</th>
                        <th>F. NACIMIENTO</th>
                        <th>AÑO PUBLICACIÓN</th>
                    </tr>
                    <xsl:for-each select="//libro">
                        <tr>
                            <td>
                                <xsl:value-of select="titulo"/>
                            </td>
                            <td>
                                <xsl:value-of select="autor"/>
                            </td>
                            <td>
                                <xsl:value-of select="autor/@fecha_nacimiento"/>
                            </td>
                            <td>
                                <xsl:value-of select="fecha_publicacion/@año"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>