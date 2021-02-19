<?php
include 'configAjax.php';
foreach ($_REQUEST as $key => $value) {
    //echo $key . "--".$value."<br>"; 
    $$key =  Security($value);
}
foreach ($_COOKIE as $key => $value) {
    //echo $key . "--".$value."<br>"; 
    $$key =  Security($value);
}
// --> Buscar el cliente para generarle su pedido
$sqlValidate2  = "SELECT count(*)as nr, id FROM cliente WHERE cookie='{$PHPSESSID}'";
//echo $sqlValidate2."<br>";
$recordset2 = $db->prepare($sqlValidate2);
$recordset2->execute();
$cliente = $recordset2->fetch(PDO::FETCH_OBJ);
//var_dump($cliente);
// --> Si el cliente no existe crearlo 
if ($cliente->nr == 0) {
    $cliente = "";
    $tele = "";
    $corr = "";
    $dire = "";
    if (trim($na) != "") $cliente = $na;
    if (trim($tel) != "") $tele = $tel;
    if (trim($cor) != "") $corr = $cor;
    if (trim($dir) != "") $dire = $dir;
    $sqlV  = "INSERT INTO cliente (`cliente`, `telefono`, `correo`, `direccion`, `empresa_id`, `cookie`) VALUES ('{$cliente}','{$tele}','{$corr}','{$dire}','{$ide}','{$PHPSESSID}')";
    //echo $sqlV."<br>";
    $reco2 = $db->prepare($sqlV);
    $reco2->execute();
    $idCliente = $db->lastInsertId();
} else {
    $idCliente = $cliente->id;
}
//echo "ID: ".$idCliente;
// --> Buscar pedido abierto 
$sqlValidate22  = "SELECT count(*)as nr, id FROM pedidos WHERE cliente_id={$idCliente} AND empresa_id={$ide} AND status_pedido_id=1";
//echo "X:".$sqlValidate22."<br>";

$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
$pedido = $recordset22->fetch(PDO::FETCH_OBJ);
if ($pedido->nr == 0) {
    $sqlV = "INSERT INTO `pedidos`( `fecha_hora`, `total`, `cliente_id`, `empresa_id`, `status_pedido_id`) VALUES (NOW(),0,{$idCliente},{$ide} ,1)";
    //echo "I: ".$sqlV."<br>";
    $reco2 = $db->prepare($sqlV);
    $reco2->execute();
    $idPedido = $db->lastInsertId();
} else {
    $idPedido = $pedido->id;
}
//echo "IDP: ".$idPedido;
//--> Datos del producto
$sqlValidateP2  = "SELECT * FROM producto WHERE id='{$idp}'";
$recorPro = $db->prepare($sqlValidateP2);
$recorPro->execute();
$producto = $recorPro->fetch(PDO::FETCH_OBJ);

// --> Agregar registro
if ($acti == "add") {
    $tott = $producto->precio_venta * $can;
    $sqlV3 = "INSERT INTO detalle_pedido (producto_id,pedidos_id,cantidad,precio_venta,total) VALUES ({$idp},{$idPedido},{$can},{$producto->precio_venta},{$tott})";
    //echo $sqlV3."<br>";
    $reco23 = $db->prepare($sqlV3);
    $reco23->execute();
} elseif ($acti == "delete") {
    //echo "BORRAR:";
    $sqlV3 = "DELETE FROM detalle_pedido WHERE id = " . $idp;
    $reco23 = $db->prepare($sqlV3);
    $reco23->execute();
}
// --> somar todo el detalle del dedido
$sqTot  ="SELECT SUM(total) as total  FROM detalle_pedido WHERE pedidos_id= {$idPedido}";
$re24tot = $db->prepare($sqTot);
$re24tot->execute();
$rowTotale = $re24tot->fetch(PDO::FETCH_OBJ);
//echo "T:".$rowTotale->total;
// --> Actualizar totales en pedido 
$sqTot ="UPDATE pedidos SET total= '$rowTotale->total' WHERE id= {$idPedido}";
$re24tot = $db->prepare($sqTot);
$re24tot->execute();



$sq2  = "SELECT a.*,b.producto,b.precio_venta FROM detalle_pedido AS a LEFT JOIN producto AS b ON b.id=a.producto_id WHERE pedidos_id= {$idPedido}";
//echo $sq2."<br>";
$re2 = $db->prepare($sq2);
$re2->execute();
$dat = "";
$tot = 0;
while ($row = $re2->fetch(PDO::FETCH_OBJ)) {
    //echo $row->cantidad . " - ".$row->producto."<br>";
    $total = $row->cantidad * $row->precio_venta;
    $tot += $total;
    $dat .= '<tr>
    <td>
        ' . $row->cantidad . '
    </td>
    <td>
        <p class="c-detail">' . $row->producto . '</p>
    </td>
    
    <td class="c-price">
    ' . $total . '
    </td>
    <td class="delete-icon">
        <i class="fa fa-trash cmdDele" aria-hidden="true" data-id="' . $row->id . '"></i>
    </td>
</tr>';
}
echo '
<div class="view-items aos-init aos-animate" data-aos="fade-right" data-aos-once="true">
    <h3>Productos</h3>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th></th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
                ' . $dat . '
            </tbody>
        </table>
    </div>
</div>
<div class="payment-method">
<h4>Total: $' . number_format($tot, "2", ".", ",") . '</h4>
<form action="" method="post" name="frm12" id="frm12">
 <button class="checkout-btn btn" type="button" title="Realizar pedido" name="cmd11" id="cmd11" data-cliente="' . $idCliente . '" data-empresa="' . $ide . '" data-pedido="' . $idPedido . '">Solicitar<span class="icon"></span></button>
 </form>
</div>
';
?>
<script>
    $(".cmdDele").click(function() {
        var idProducto = $(this).attr("data-id");
        var actionS = "delete";
        pedido(idProducto, actionS);
    });
    $("#cmd11").click(function() {
        var name = $("#txtName").val();
        if (name.trim() == "") {
            alert(unescape("Es necesario su nombre!!!"));
            $("#txtName").focus();
            return false;
        }
        var tel = $("#txtPhone").val();
        if (tel.trim() == "") {
            alert(unescape("Es necesario su teléfono!!!"));
            $("#txtPhone").focus();
            return false;
        }
        var cor = $("#txtEmail").val();
        var dir = $("#txtDireccion").val();

        var idPedido = $(this).attr("data-pedido");
        var idEmpresa = $(this).attr("data-empresa");
        var idCliente = $(this).attr("data-cliente");
        var data = {
            "idP": idPedido,
            "idE": idEmpresa,
            "idC": idCliente,
            "nam": name,
            "cor": cor,
            "tel": tel,
            "dir": dir
        };
        var path = $("#path").val();
        var html = $.ajax({
            url: path + "includes/ajax/armarPedido.php",
            type: "POST",
            data: data,
            async: false
        }).responseText;
        window.open('https://wa.me/' + html, '_blank');
        $("#frm12").submit();
    });
</script>