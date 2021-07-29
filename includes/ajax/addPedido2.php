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


// --> Datos de la empresa
$sqlValidate2  = "SELECT * FROM empresa WHERE id='{$ide}'";
$recordset2 = $db->prepare($sqlValidate2);
$recordset2->execute();
$empresaa = $recordset2->fetch(PDO::FETCH_OBJ);


// --> Buscar el cliente para generarle su pedido
$sqlValidate2  = "SELECT count(*)as nr, id FROM cliente WHERE cookie='{$PHPSESSID}'";
$recordset2 = $db->prepare($sqlValidate2);
$recordset2->execute();
$cliente = $recordset2->fetch(PDO::FETCH_OBJ);

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
    $sqlV  = "INSERT INTO cliente (`cliente`, `telefono`,  `direccion`, `empresa_id`, `cookie`) 
                          VALUES ('{$cliente}','{$tele}','{$dire}','{$ide}','{$PHPSESSID}')";
    $reco2 = $db->prepare($sqlV);
    $reco2->execute();
    $idCliente = $db->lastInsertId();
} else {
    $idCliente = $cliente->id;
}

// --> Buscar pedido abierto 
$sqlValidate22  = "SELECT count(*)as nr, id FROM pedidos WHERE cliente_id={$idCliente} AND empresa_id={$ide} AND status_pedido_id={$empresaa->status_pedido_id}";
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
$pedido = $recordset22->fetch(PDO::FETCH_OBJ);
if ($pedido->nr == 0) {
    $sqlV = "INSERT INTO `pedidos`( `fecha_hora`, `total`, `cliente_id`, `empresa_id`, `status_pedido_id`,`nota`,fecha_entrga) VALUES (NOW(),0,{$idCliente},{$ide} ,{$empresaa->status_pedido_id},'{$not}','{$fec}')";
    $reco2 = $db->prepare($sqlV);
    $reco2->execute();
    $idPedido = $db->lastInsertId();
} else {
    $idPedido = $pedido->id;
}

//--> Datos del producto
$sqlValidateP2  = "SELECT * FROM producto WHERE id='{$idp}'";
$recorPro = $db->prepare($sqlValidateP2);
$recorPro->execute();
$producto = $recorPro->fetch(PDO::FETCH_OBJ);

// --> Agregar registro
if ($acti == "add") {
    // --> Validar si el peiddo ya vive en el registro de  productos
    $sqlValidateS2  = "SELECT count(*) as nr,id,cantidad FROM detalle_pedido WHERE producto_id={$idp} AND pedidos_id = {$idPedido}";
 
    $recoro = $db->prepare($sqlValidateS2);
    $recoro->execute();
    $detallePed = $recoro->fetch(PDO::FETCH_OBJ);

    if($detallePed->nr == 0 ){
        $tott = $producto->precio_venta * $can;
        $sqlV3 = "INSERT INTO detalle_pedido (producto_id,pedidos_id,cantidad,precio_venta,total) VALUES ({$idp},{$idPedido},{$can},{$producto->precio_venta},{$tott})";
    }else{
        
       // $NUEVcANT = $can + $detallePed->cantidad;
        $tott = $producto->precio_venta * $can;
        $sqlV3 = "UPDATE detalle_pedido SET cantidad = $can, total = $tott WHERE id = ".$detallePed->id;
    }
   
    $reco23 = $db->prepare($sqlV3);
    $reco23->execute();
   
} elseif ($acti == "delete") {
    $sqlV3 = "DELETE FROM detalle_pedido WHERE id = " . $idp;
    $reco23 = $db->prepare($sqlV3);
    $reco23->execute();
}
// --> sumar todo el detalle del dedido
$sqTot  ="SELECT SUM(total) as total  FROM detalle_pedido WHERE pedidos_id= {$idPedido}";
$re24tot = $db->prepare($sqTot);
$re24tot->execute();
$rowTotale = $re24tot->fetch(PDO::FETCH_OBJ);

// --> Actualizar totales en pedido 
$sqTot ="UPDATE pedidos SET total= '$rowTotale->total' WHERE id= {$idPedido}";
$re24tot = $db->prepare($sqTot);
$re24tot->execute();

$sq2  = "SELECT a.*,b.producto,b.precio_venta FROM detalle_pedido AS a LEFT JOIN producto AS b ON b.id=a.producto_id WHERE pedidos_id= {$idPedido}";
$re2 = $db->prepare($sq2);
$re2->execute();
$capa = "";
$tot = 0;

while ($row = $re2->fetch(PDO::FETCH_OBJ)) {
    $total = $row->cantidad * $row->precio_venta;
    $tot += $total;
    $capa .=' <div class="cart_item">
            <div class="cart_img">
                <a href="#"><img src="'.$pathSite.'design/'.$design.'/assets/img/s-product/product.jpg" alt=""></a>
            </div>
            <div class="cart_info">
                <a href="#" class="product_title_modal" style="font-size: 15px;">'.$row->producto.'</a>
                <div class="product_variant quantity" style="margin-bottom: 0px !important;">
                    <label style="font-size: 12px;">Cant.</label>
                    <input class="input_cant cant-'.$row->producto_id.'" min="1" max="100" pv="'.$row->precio_venta.'" idp="'.$row->producto_id.'" idDP="'.$row->pedidos_id.'" value="'.$row->cantidad.'" type="number" style="  text-align: center;
                    width: 73px;
                    height: 25px;">

                </div>
                <p><span class="price_card pro-'.$row->producto_id.'" style="color: #40A944;
                    font-size: 16px;"> $'.$total.' </span></p>    
                
            </div>
            <div class="cart_remove">
                <a class="" href="#" onclick="Delete_ProductoCard('. $row->id .')"  ><i class="icon-x"></i></a>
            </div>
        </div>';
    }
    
    echo $capa;

?>
<script>

    function Delete_ProductoCard(id){
        Pedido(id,0,'delete');
    }

    $(".input_cant").bind('keyup mouseup', function () {
        var idDP = $(this).attr("idDP");//Id detalle pedido
        var idp = $(this).attr("idp");//Id producto
        var pv = $(this).attr("pv");//precio venta
        var cantidad = $(this).val();
        var idEmpresa = $("#idEmpresa").val();

        var precio_total = pv*cantidad;
        $('.pro-'+idp).html("$"+precio_total);
      
      /*  var datos={"idDP":idDP,"idp":idp,"can":cantidad,"ide":idEmpresa,"acti":"add"}
        $.ajax({
            url:  "includes/ajax/addPedido2.php",
            type: "POST",
            data: datos,
            async: false,
            dataType: "text",
            success: function (res){
                $('#capaCard').html(res);
            }
        });*/
      
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
        var fec = $("#txtFec").val();
        if (fec.trim() == "") {
            alert(unescape("Es necesario su fecha de entrega!!!"));
            $("#txtFec").focus();
            return false;
        }


        var dir = $("#txtDireccion").val();
        var nota = $("#txtNota").val();

        var idPedido = $(this).attr("data-pedido");
        var idEmpresa = $(this).attr("data-empresa");
        var idCliente = $(this).attr("data-cliente");
        var data = {
            "idP": idPedido,
            "idE": idEmpresa,
            "idC": idCliente,
            "nam": name,
            "fec": fec,
            "tel": tel,
            "dir": dir,
            "not": nota
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