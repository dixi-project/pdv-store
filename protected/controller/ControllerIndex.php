<?php
class ControllerIndex extends Controller {
    function __construct($view, $conf, $var, $acc) {
        parent::__construct($view, $conf, $var, $acc);
    }
    public function main() {
        foreach ($this->var as $key => $value) {
            $$key = $value;
            $this->data[$key] = $value;
        }
        $dd=explode("/",$con);
        $uu = $dd[0];
        $ss="SELECT * FROM empresa WHERE url_tienda='{$uu}'";
        $this->data["empresa"] = indexModel::bd($this->conf)->getSQL($ss)[0];
        // var_dump( $this->data["empresa"]);
        $aux = explode("/",$this->conf["pathCMSSite"])[2];
        // echo $aux;
       
        if( empty($this->data["empresa"])){
            $this->view->show("error404.html", $this->data, $this->accion); 
            exit();
        }
        $this->data["idEmpresa"]=$this->data["empresa"]->id;
        $vv = array(
            "empresa_id"=>$this->data["idEmpresa"]
        );


        //Categorias
        $sql11 = "SELECT c.* FROM empresa AS e INNER JOIN categoria AS c 
        WHERE e.id=c.empresa_id AND e.id=".$this->data["idEmpresa"];
        $this->data["categoria"] = indexModel::bd($this->conf)->getSQL($sql11); 

        //Productos
        $sql="SELECT p.*,c.categoria FROM producto AS p 
        INNER JOIN categoria AS c ON p.categoria_id=c.id 
        WHERE p.user_id =". $_COOKIE["idUser"];
        $this->data["product"] = indexModel::bd($this->conf)->getSQL($sql);
        //  echo $sql;

          //Producto
        // $thefolderr = "../".$aux."/includes/images/productos/";
        // // echo $thefolderr;

        // if ($handler = opendir($thefolderr)) {
        //     while (false !== ($file = readdir($handler))) {
        //         $file2 = explode("_", $file);
        //         if (is_numeric($file2[0])) {
        //             $im = $file2[0];
        //             $this->data["id_imagenproducto"][$im][] = array("image" => $file);
        //         }
        //     }
        //     closedir($handler);
        // }
        
        //$this->data["categorias"] = indexModel::bd($this->conf)->getDominioID("categoria",$vv);
        // $this->data["categorias"] = indexModel::bd($this->conf)->getSql("SELECT * FROM categoria WHERE empresa_id = ". $this->data["idEmpresa"]." ORDER BY categoria");
        //asort($this->data["categorias"]);
        //var_dump($this->data["categorias"] );
        $this->data["productos"] = indexModel::bd($this->conf)->getDominioID("producto",$vv);

        $this->data["unidades"] = indexModel::bd($this->conf)->getDominioID("unidad_medida");
        $template="plantilla1.twig";
         
        $this->view->show($template, $this->data, $this->accion);
    }
}
?>
