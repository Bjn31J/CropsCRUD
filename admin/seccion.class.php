<?php
require_once('../sistema.class.php');

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

class Seccion extends Sistema
{
    function create($data)
    {
        $result = [];
        $this->conexion();
        $sql = "INSERT into seccion(seccion,area,id_invernadero) 
        VALUES(
        :seccion,
        :area, 
        :id_invernadero);";
        $insertar = $this->con->prepare($sql);
        $insertar->bindParam(':seccion', $data['seccion'], PDO::PARAM_STR);
        $insertar->bindParam(':area', $data['area'], PDO::PARAM_INT);
        $insertar->bindParam(':id_invernadero', $data['id_invernadero'], PDO::PARAM_INT);
        $insertar->execute();
        $result = $insertar->rowCount();
        return $result;
    }

    function update($id, $data)
    {
        $this->conexion();
        $result = [];
        $sql = "UPDATE seccion SET seccion=:seccion, area=:area, 
        id_invernadero=:id_invernadero WHERE id_seccion=:id_seccion;";
        $modificar = $this->con->prepare($sql);
        $modificar->bindParam(':id_seccion', $id, PDO::PARAM_INT);
        $modificar->bindParam(':seccion', $data['seccion'], PDO::PARAM_STR);
        $modificar->bindParam(':area', $data['area'], PDO::PARAM_INT);
        $modificar->bindParam(':id_invernadero', $data['id_invernadero'], PDO::PARAM_INT);
        $modificar->execute();
        $result = $modificar->rowCount();
        return $result;
    }

    function delete($id)
    {
        $this->conexion();
        $result = [];
        if (is_numeric($id)) {
            $sql = "DELETE from seccion where id_seccion = :id_seccion";
            $borrar = $this->con->prepare($sql);
            $borrar->bindParam(':id_seccion', $id, PDO::PARAM_INT);
            $borrar->execute();
            $result = $borrar->rowCount();
        }
        return $result;
    }
    function readOne($id)
    {
        $this->conexion();
        $result = [];
        $query = "SELECT * FROM seccion where id_seccion = :id_seccion;";
        $sql = $this->con->prepare($query);
        $sql->bindParam(":id_seccion", $id, PDO::PARAM_INT);
        $sql->execute();
        $result = $sql->fetch(PDO::FETCH_ASSOC);
        return $result;
    }
    function readAll()
    {
        $this->conexion();
        $result = [];
        $query = "SELECT s.*,i.invernadero FROM seccion s join invernadero i on s.id_invernadero = i.id_invernadero";
        $sql = $this->con->prepare($query);
        $sql->execute();
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    function reporte()
    {
        require_once '../vendor/autoload.php';
        $this->conexion();
        $sql = 'Select * from vw_n_invernaderos_seccion';
        $consulta = $this->con->prepare($sql);
        $consulta->execute();
        $data = $consulta->fetchAll(PDO::FETCH_ASSOC);
        try {
            include('../lib/phpqrcode/qrlib.php');
            $id_factura =  rand(1,1000); 
            $file_name = '../qr/'.$id_factura.'.png';
            QRcode::png('http://localhost/crops/facturas/'.$id_factura,$file_name,2,10,3);
            ob_start();
            $content = ob_get_clean();
            $content = '
            <html>
            <body style="font-family: Arial, sans-serif; color: #333;">
                <div style="text-align: center; margin-bottom: 20px;">
                    <img src="../images/descarga.jpg" alt="Logo" style="width: 150px; height: auto;">
                </div>
                <h1 style="text-align: center; color: green;">Número de Invernaderos por Sección</h1>
                <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; border-collapse: collapse; margin-top: 20px; text-align: center;">
                    <thead>
                        <tr style="background-color: green; color: white;">
                            <th style="padding: 10px;">Sección</th>
                            <th style="padding: 10px;">Número de Invernaderos</th>
                        </tr>
                    </thead>
                    <tbody>';

            foreach ($data as $seccion) {
                $content .= '<tr>';
                $content .= '<td style="padding: 10px; border: 1px solid #ddd;">' . $seccion['seccion'] . '</td>';
                $content .= '<td style="padding: 10px; border: 1px solid #ddd;">' . $seccion['N_Invernaderos'] . '</td>';
                $content .= '</tr>';
            }

            $content .= '
                    </tbody>
                </table>
                 <div>
                 <h1 style="text-align: center; color: green;">Tenemos ';
                 $content.= $cantidad = sizeof($data);
                 $content.=' Secciones</h1>
                 </div>
                    <div>
                    <p>Dirección de los Invernaderos en Guanajuato:</p>
                    <p>Carretera Celaya - Salamanca km 15, Col. San Pedro, Celaya, Guanajuato, México</p>
                    <img src="../qr/'.$id_factura.'.png" width="150">
                    </div>
                    
            </body>
            </html>
            ';
            $html2pdf = new Html2Pdf('P', 'A4', 'fr');
            $html2pdf->setDefaultFont('Arial');
            $html2pdf->writeHTML($content);
            $html2pdf->output('ejemplo.pdf');
        } catch (Html2PdfException $e) {
            $html2pdf->clean();

            $formatter = new ExceptionFormatter($e);
            echo $formatter->getHtmlMessage();
        }
    }
}
