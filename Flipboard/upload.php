<?php
include_once("class/class-conexion.php");
session_start();
if (isset($_SESSION['usuario'])) {
  $codigoUsuario = $_SESSION['usuario']['CODIGO_USUARIO'];
} else{
  header('Location: index.php');
}



//echo count($_FILES["file0"]["name"]);exit;
if($_SERVER['REQUEST_METHOD'] == "POST" && isset($_FILES["files"]["type"])){
$target_dir = "images/foto_perfiles/";
$carpeta=$target_dir;
if (!file_exists($carpeta)) {
    mkdir($carpeta, 0777, true);
}
 
$target_file = $carpeta . basename($_FILES["files"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["files"]["tmp_name"]);
    if($check !== false) {
        $errors[]= "El archivo es una imagen - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        $errors[]= "El archivo no es una imagen.";
        $uploadOk = 0;
    }
}
// Check if file already exists

// Check file size
if ($_FILES["files"]["size"] > 10485760) {
    $errors[]= "Lo sentimos, la foto es demasiado grande.  Tamaño máximo admitido: 10 MB";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    $errors[]= "Lo sentimos, sólo archivos JPG, JPEG, PNG & GIF  son permitidos.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    $errors[]= "Lo sentimos, tu foto no se ha cambiado.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["files"]["tmp_name"], $target_file)) {
       $messages[]= "Foto actualizada correctamente. ";


      
	   
	   
    } else {
       $errors[]= "Lo sentimos, hubo un error subiendo la foto.";
    }
}
 
if (isset($errors)){
	?>
	<div class="alert alert-danger alert-dismissible" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  
	  <?php
	  foreach ($errors as $error){
		  echo"<p>$error</p>";
	  }
	  ?>
	</div>
	<?php
}
 
if (isset($messages)){
	?>
	<div class="alert alert-success alert-dismissible" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>

	  <?php
	  foreach ($messages as $message){
		  echo"<p>$message</p>";
	  }
	  ?>
	</div>

	<?php
$url="'"."images/foto_perfiles/".$_FILES["files"]["name"]."'";
include_once("class/class-conexion.php");
	$conexion = new Conexion();
		$sql = "  
				call P_ACTUALIZAR_FOTO($url,$codigoUsuario)
				";
    $resultadoAct = $conexion->ejecutarInstruccion($sql);
    $conexion->commit();


}


	

}


?>