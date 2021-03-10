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
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
$empresa= $recordset22->fetch(PDO::FETCH_OBJ);



// --> Actualizar Cliente
$sqlValidate22 = "UPDATE cliente SET cliente='{$nam}',telefono='{$tel}',correo='{$cor}',direccion='{$dir}'  WHERE id = ".$idE;
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
// --> Actualizar Pedido
$sqlValidate22 = "UPDATE pedidos SET status_pedido_id = 2, nota='{$not}' WHERE id = ".$idP;
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
// --> Pedido
$sql44 = "SELECT * FROM pedidos WHERE id = ".$idP;
$rec44 = $db->prepare($sql44);
$rec44->execute();
$pedido= $rec44->fetch(PDO::FETCH_OBJ);


// Extraer datos cliente
$sqlValidate22 = "SELECT * FROM cliente WHERE id = ".$idE;
$recordset22 = $db->prepare($sqlValidate22);
$recordset22->execute();
$cliente= $recordset22->fetch(PDO::FETCH_OBJ);
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