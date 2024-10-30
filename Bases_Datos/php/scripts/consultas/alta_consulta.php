<?php
if (isset($_POST['insertar_consulta'])) {
  $resultado = [
    'error' => false,
    'mensaje' => 'Se ha añadido la consulta con éxito'
  ];
  $config = include '../config_DB.php';

  try {
    $dsn = 'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['name'];
    
    $conexion = new PDO($dsn, $config['db']['user'], $config['db']['pass'], $config['db']['options']);

    $paciente = array(
      "dni"   => $_POST['paciente'],
    );
    echo $paciente['dni'].'<br>';

  } catch(PDOException $error) {
    $resultado['error'] = true;
    $resultado['mensaje'] = $error->getMessage();
  }
}
?>

<?php include "../../templates/header.php"; ?>

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
<?php include "../../templates/footer.php"; ?>
