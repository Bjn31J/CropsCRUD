<?php require('views/header/header_administrador.php'); ?>
<h1><?php echo ($accion == "crear") ? "Nuevo " : "Modificar "; ?>Usuario</h1>

<form action="usuario.php?accion=<?php echo ($accion == "crear") ? 'nuevo' : 'modificar&id=' . $id; ?>" method="post">
    <div class="row mb-3">
        <label for="correo" class="col-sm-2 col-form-label">Correo electrónico</label>
        <div class="col-sm-10">
            <input type="email" name="data[correo]" placeholder="Escribe aquí el correo" class="form-control" 
                   value="<?php echo isset($usuario['correo']) ? $usuario['correo'] : ''; ?>" required/>
        </div>
    </div>
    <div class="row mb-3">
        <label for="contrasena" class="col-sm-2 col-form-label">Contraseña</label>
        <div class="col-sm-10">
            <input type="password" name="data[contrasena]" placeholder="Escribe aquí la contraseña" class="form-control" required/>
        </div>
    </div>
    <input type="submit" name="data[enviar]" value="Guardar" class="btn btn-success"/>
</form>
<?php require('views/footer.php'); ?>
