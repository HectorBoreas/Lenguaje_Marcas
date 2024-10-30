<?php

echo '<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h2 class="mt-4">Crea una consulta</h2>
      <hr>
      <form method="post" action="../../scripts/consultas/alta_consulta.php">

        <div class="form-group">
          <label for="paciente">DNI Paciente</label>
          <select name="paciente">';
          $config = include '../../scripts/config_DB.php';

          try {
            $dsn = 'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['name'];
            
            $conexion = new PDO($dsn, $config['db']['user'], $config['db']['pass'], $config['db']['options']);
            $dnisResultado = $conexion->query("SELECT dni FROM pacientes");

            while ($row = $dnisResultado->fetch()) {
              echo '<option value="'.$row[0].'">'.$row[0].'</option>';
              
            }

            
          echo '</select>
        </div>
        
        <div class="form-group">
          <input type="submit" name="insertar_consulta" class="btn btn-primary" value="Insertar Consulta">
        </div>
      </form>
    </div>
  </div>
</div>';

          }catch(PDOException $error) {
            echo $error->getMessage();
          }


?>