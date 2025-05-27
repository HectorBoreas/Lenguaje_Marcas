<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <!-- Template raíz -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Productos GamerZone</title>
        <style>
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 20px;
          }

          h1 {
            text-align: center;
            color: #2c3e50;
          }

          h2 {
            margin-top: 40px;
            color: #1a73e8;
            border-bottom: 2px solid #1a73e8;
            padding-bottom: 5px;
          }

          .producto {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
          }

          .agotado {
            color: red;
            font-weight: bold;
          }

          .precio-alto {
            color: #e67e22;
            font-weight: bold;
          }

          .teclado {
            background-color: #e3f2fd;
          }
        </style>
      </head>
      <body>
        <h1>Tienda Gaming: <xsl:value-of select="tiendaGaming/@nombre"/></h1>

        <h2>1. Productos Agotados</h2>
        <xsl:apply-templates select="tiendaGaming/producto[stock = 0]"/>

        <h2>2. Productos con Precio &gt; 100 EUR</h2>
        <xsl:apply-templates select="tiendaGaming/producto[precio &gt; 100]"/>

        <h2>3. Productos de Categoría Teclado</h2>
        <xsl:apply-templates select="tiendaGaming/producto[@categoria = 'teclado']"/>
      </body>
    </html>
  </xsl:template>

  <!-- Template para productos agotados -->
  <xsl:template match="producto[stock = 0]">
    <div class="producto agotado">
      <strong><xsl:value-of select="nombre"/></strong> (AGOTADO)<br/>
      Marca: <xsl:value-of select="marca"/><br/>
      Precio: <xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/>
    </div>
  </xsl:template>

  <!-- Template para productos con precio mayor a 100 -->
  <xsl:template match="producto[precio &gt; 100]">
    <div class="producto precio-alto">
      <strong><xsl:value-of select="nombre"/></strong><br/>
      Marca: <xsl:value-of select="marca"/><br/>
      Precio: <xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/>
    </div>
  </xsl:template>

  <!-- Template para productos de categoría teclado -->
  <xsl:template match="producto[@categoria = 'teclado']">
    <div class="producto teclado">
      <strong><xsl:value-of select="nombre"/></strong><br/>
      Marca: <xsl:value-of select="marca"/><br/>
      Precio: <xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/><br/>
      Stock: <xsl:value-of select="stock"/> (Disponible: <xsl:value-of select="stock/@disponible"/>)
    </div>
  </xsl:template>

</xsl:stylesheet>
