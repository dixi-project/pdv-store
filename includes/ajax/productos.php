<?php
include 'configAjax.php';
foreach ($_REQUEST as $key => $value) {
    //echo $key . "--".$value."<br>";
    $$key = Security($value);
}
/*
foreach ($_COOKIE as $key => $value){
   // echo $key . "--".$value."\n";
    $$key = Security($value);
}*/

if(isset($idEmpresa)){
    $sqll="SELECT * FROM producto WHERE empresa_id=$idEmpresa AND categoria_id=$idC";
    $recordset = $db->prepare($sqll);
    $recordset->execute();
    $productos= $recordset->fetchAll(PDO::FETCH_OBJ);
    $data='<div class="product_items" style="width: 20%; display: -webkit-box;">';

    foreach ($productos as $key => $value){

        $data .='<article class="single_product">
                    <figure>
                        <div class="product_thumb" style="width: 213.2px; margin-right: 20px;">
                            <a class="primary_img" href="product-details.html"><img src="'.$pathSite.'design/'.$design.'/assets/img/product/product1.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="'.$pathSite.'design/'.$design.'/assets/img/product/product2.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                                <span class="label_new">New</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="add_to_cart"><a href="cart.html" data-tippy="Add to cart" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"> <span class="lnr lnr-cart"></span></a></li>
                                    <li class="quick_button"><a href="#" data-tippy="quick view" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-bs-toggle="modal" data-bs-target="#modal_box" > <span class="lnr lnr-magnifier"></span></a></li>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy="Add to Wishlist" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"><span class="lnr lnr-heart"></span></a></li>
                                    <li class="compare"><a href="#" data-tippy="Add to Compare" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"><span class="lnr lnr-sync"></span></a></li>
                                </ul>
                            </div>
                        </div>
                        <figcaption class="product_content">
                            <h4 class="product_name"><a href="product-details.html">'.$value->producto.'</a></h4>
                            <p><a href="#">'.$value->producto.'</a></p>
                            <div class="price_box">
                                <span class="current_price">'.$value->precio_venta.'</span>
                                <span class="old_price">$362.00</span>
                            </div>
                        </figcaption>
                    </figure>
                </article>';
    }
    $data .=' </div>';

    echo $data;
}


?>