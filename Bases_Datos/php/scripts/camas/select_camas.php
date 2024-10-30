<?php include "../../templates/header.php"; ?>
<?php

    $config = include '../config_DB.php';

    try {
      $dsn = 'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['name'];
      
      $conexion = new PDO($dsn, $config['db']['user'], $config['db']['pass'], $config['db']['options']);
      $camasResultado = $conexion->query("SELECT * FROM camas");
      echo '<a class="btn btn-primary" href="../../pages/camas/index_update_camas.php">Editar</a>
            <a class="btn btn-primary" href="../../pages/camas/index_insert_cama.php">Alta</a>
            <a class="btn btn-primary" href="../../pages/camas/index_delete_cama.php" >Borrar</a>';      
      echo '<table class="table table-striped custom-table display" id="tabla">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Zona</th>
                                <th scope="col">Planta</th>
                                <th scope="col">Fecha Cambio Sábanas</th>
                            </tr>
                        </thead>
                        <tbody>';
                           while ($row = $camasResultado->fetch()) {
                                  echo '<tr scope="row">';
                                  echo '<td>'.$row['id_cama'].'</td>';
                                  echo '<td>'.$row['zona'].'</td>';
                                  echo '<td>'.$row['planta'].'</td>';
                                  echo '<td>'.$row['fechaCambioSabanas'].'</td></tr>';

                           }
                       echo  '</tbody></table>';
    }catch(PDOException $error) {
      echo $error->getMessage();
    }
  
  ?>
<?php include "../../templates/footer.php"; ?>