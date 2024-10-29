<?php require('views/header/header_administrador.php'); ?>
<h1>Empleados</h1>
<?php if (isset($mensaje)) : $app->alert($tipo, $mensaje); endif; ?>
<a href="empleado.php?accion=crear" class="btn btn-success">Nuevo</a>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Primer Apellido</th>
            <th>Segundo Apellido</th>
            <th>Nombre</th>
            <th>RFC</th>
            <th>Correo</th>
            <th>Fotografía</th>
            <th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($empleados as $empleado) : ?>
        <tr>
            <td><?php echo $empleado['id_empleado']; ?></td>
            <td><?php echo $empleado['primer_apellido']; ?></td>
            <td><?php echo $empleado['segundo_apellido']; ?></td>
            <td><?php echo $empleado['nombre']; ?></td>
            <td><?php echo $empleado['rfc']; ?></td>
            <td><?php echo $empleado['correo']; ?></td> 
            <td><img src="<?php echo $empleado['fotografia']; ?>" width="50" height="50" alt="Foto"></td>
            <td>
                <a href="empleado.php?accion=actualizar&id=<?php echo $empleado['id_empleado']; ?>" class="btn btn-primary">Actualizar</a>
                <a href="empleado.php?accion=eliminar&id=<?php echo $empleado['id_empleado']; ?>" class="btn btn-danger">Eliminar</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>
<?php require('views/footer.php'); ?>

