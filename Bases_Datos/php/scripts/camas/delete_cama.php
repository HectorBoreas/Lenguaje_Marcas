<?php
if (isset($_POST['borrar_cama'])) {
  if($_POST ['id_cama']){
    $resultado = [
      'error' => false,
      'mensaje' => 'Se ha borrado la cama con éxito'
    ];
    $config = include 'config_DB.php';

    try {
      $dsn = 'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['name'];
      
      $conexion = new PDO($dsn, $config['db']['user'], $config['db']['pass'], $config['db']['options']);
    
      $consultaSQL = "DELETE FROM camas WHERE id_cama=".$_POST['id_cama'];
      $conexion->query($consultaSQL);
      
    } catch(PDOException $error) {
      $resultado['error'] = true;
      $resultado['mensaje'] = $error->getMessage();
    }
  }else{
    $resultado = [
      'error' => true,
      'mensaje' => 'El id es obligatorio para poder borrar una cama'
    ];
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
