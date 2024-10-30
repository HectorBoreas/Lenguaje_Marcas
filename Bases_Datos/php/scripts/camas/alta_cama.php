<?php
if (isset($_POST['insertar_cama'])) {
  $resultado = [
    'error' => false,
    'mensaje' => 'Se ha añadido la cama con éxito'
  ];
  $config = include 'config_DB.php';

  try {
    $dsn = 'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['name'];
    //echo $dsn;
    $conexion = new PDO($dsn, $config['db']['user'], $config['db']['pass'], $config['db']['options']);

    $cama = array(
      "zona"   => $_POST['zona'],
      "planta" => $_POST['planta'],
      "fechaCambioSabanas" => $_POST['fecha']
    );
//INSERT INTO Camas(planta, fechaCambioSabanas) VALUES("25", "2023/01/29");
    $consultaSQL = "INSERT INTO camas (zona, planta, fechaCambioSabanas) ";
    $consultaSQL .= "values (:" . implode(", :", array_keys($cama)) . ")";

    $sentencia = $conexion->prepare($consultaSQL);
    $sentencia->execute($cama);

  } catch(PDOException $error) {
    $resultado['error'] = true;
    $resultado['mensaje'] = $error->getMessage();
  }
}
?>

<?php include "../templates/header.php"; ?>

<?php
if (isset($resultado)) {
  ?>
  <div class="container mt-3">
    <div class="row">
      <div class="col-md-12">
        <div class="alert alert-<?= $resultado['error'] ? 'danger' : 'success' ?>" role="alert">
          <?= $resultado['mensaje'] ?>
        </div>
      </div>
    </div>
  </div>
  <?php
}

?>
<?php include "../templates/footer.php"; ?>
