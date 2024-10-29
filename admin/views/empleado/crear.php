<?php require('views/header/header_administrador.php'); ?>
<h1><?php echo ($accion == "crear") ? "Nuevo " : "Modificar "; ?>Empleado</h1>

<form action="empleado.php?accion=<?php echo ($accion == "crear") ? 'nuevo' : 'modificar&id=' . $id; ?>" method="post">
    <div class="row mb-3">
        <label for="primer_apellido" class="col-sm-2 col-form-label">Primer Apellido</label>
        <div class="col-sm-10">
            <input type="text" name="data[primer_apellido]" class="form-control" placeholder="Primer apellido"
                   value="<?php echo isset($empleado['primer_apellido']) ? $empleado['primer_apellido'] : ''; ?>" required/>
        </div>
    </div>
    <div class="row mb-3">
        <label for="segundo_apellido" class="col-sm-2 col-form-label">Segundo Apellido</label>
        <div class="col-sm-10">
            <input type="text" name="data[segundo_apellido]" class="form-control" placeholder="Segundo apellido"
                   value="<?php echo isset($empleado['segundo_apellido']) ? $empleado['segundo_apellido'] : ''; ?>"/>
        </div>
    </div>
    <div class="row mb-3">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
        <div class="col-sm-10">
            <input type="text" name="data[nombre]" class="form-control" placeholder="Nombre"
                   value="<?php echo isset($empleado['nombre']) ? $empleado['nombre'] : ''; ?>" required/>
        </div>
    </div>
    <div class="row mb-3">
        <label for="rfc" class="col-sm-2 col-form-label">RFC</label>
        <div class="col-sm-10">
            <input type="text" name="data[rfc]" class="form-control" placeholder="RFC"
                   value="<?php echo isset($empleado['rfc']) ? $empleado['rfc'] : ''; ?>" required/>
        </div>
    </div>
    <div class="row mb-3">
        <label for="id_usuario" class="col-sm-2 col-form-label">ID Usuario</label>
        <div class="col-sm-10">
            <input type="number" name="data[id_usuario]" class="form-control" placeholder="ID Usuario"
                   value="<?php echo isset($empleado['id_usuario']) ? $empleado['id_usuario'] : ''; ?>" required/>
        </div>
    </div>
    <div class="row mb-3">
        <label for="fotografia" class="col-sm-2 col-form-label">Fotografía</label>
        <div class="col-sm-10">
            <input type="text" name="data[fotografia]" class="form-control" placeholder="URL de la fotografía"
                   value="<?php echo isset($empleado['fotografia']) ? $empleado['fotografia'] : ''; ?>"/>
        </div>
    </div>
    <input type="submit" value="Guardar" class="btn btn-success"/>
</form>
<?php require('views/footer.php'); ?>
