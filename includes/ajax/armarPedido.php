<?php
include 'configAjax.php';
ini_set('display_errors',1);
error_reporting(E_ALL);
foreach ($_REQUEST as $key => $value) {
    //echo $key . "--".$value."<br>"; 
    $$key =  Security($value);
}
foreach ($_COOKIE as $key => $value) {
    //echo $key . "--".$value."<br>"; 
    $$key =  Security($value);
}
// --> Empresa
$sqlValidate22 = "SELECT * FROM empresa WHERE id = ".$idE;
//echo $sqlValidate22."<br>";
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
$empresa= $recordset22->fetch(PDO::FETCH_OBJ);
$idns = $empresa->status_pedido_id + 1;
// --> Actualizar Pedido
$sqlValidate22 = "UPDATE pedidos SET status_pedido_id = {$idns}, nota='{$not}',fecha_entrga='{$fec}' WHERE id = ".$idP;
//echo $sqlValidate22 ;
//exit();
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
// --> Pedido
$sql44 = "SELECT * FROM pedidos WHERE id = ".$idP;
$rec44 = $db->prepare($sql44);
$rec44->execute();
$pedido= $rec44->fetch(PDO::FETCH_OBJ);


// Extraer datos cliente
$sqlValidate22 = "SELECT * FROM cliente WHERE id = ".$idC;
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
$cliente= $recordset22->fetch(PDO::FETCH_OBJ);

// --> somar todal de peidods del cliente 
$sqTot  ="SELECT SUM(total) as total  FROM pedidos WHERE cliente_id= {$idC} AND status_pedido_id = 3";
$re24tot = $db->prepare($sqTot);
$re24tot->execute();
$rowTotale = $re24tot->fetch(PDO::FETCH_OBJ);

$totCompras = $rowTotale->total + $pedido->total;
// --> Actualizar Cliente
$sqlValidate22 = "UPDATE cliente SET cliente='{$nam}',telefono='{$tel}',direccion='{$dir}',ultima_compra=NOW(),total_compras={$totCompras}  WHERE id = ".$idC;
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();

$cad='Saludos: '.$cliente->cliente."%0A";
$cad.=$empresa->encabezado_pedido."%0A";
$cad.="--------------------------%0A";
$sql3 = "SELECT a.*,b.producto,b.precio_venta FROM detalle_pedido AS a LEFT JOIN producto AS b ON b.id=a.producto_id WHERE pedidos_id=".$idP;
$rec3 = $db->prepare($sql3);
$rec3->execute();
$tot = 0;
while($detalle = $rec3->fetch(PDO::FETCH_OBJ)){
    $total = $detalle->cantidad * $detalle->precio_venta;
    $tot += $total; 
    $cad.=$detalle->cantidad." - ".$detalle->producto." - ". $total ."%0A";
}
$cad.="--------------------------%0A";
$cad.="TOTAL: $".number_format($tot,"2",".",",")."%0A";
$cad.="--------------------------%0A";
$cad.=$pedido->nota."%0A";
$cad.="--------------------------%0A";
$cad.=$empresa->pie_pagina_pedido;
echo "+52{$empresa->telefono}?text=".$cad;
?>