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

        $dd=explode(",",$con);
        $uu = $dd[0];
        $ss="SELECT * FROM empresa WHERE url_tienda='{$uu}'";
      
        //--> getSQL : Recibe como parametro la consulta SQL;
        $this->data["empresa"] = (object) indexModel::bd($this->conf)->getSQL($ss)[0];
        if($this->data["empresa"]->id > 0){
            $this->data["idEmpresa"]=$this->data["empresa"]->id;
            $this->data["categorias"] = indexModel::bd($this->conf)->getSql("SELECT * FROM categoria WHERE empresa_id = ". $this->data["idEmpresa"]." ORDER BY categoria");
            $vv = array("empresa_id"=>$this->data["idEmpresa"]);
            $this->data["productos"] = indexModel::bd($this->conf)->getDominioID("producto",$vv);

            $a = array_chunk($this->data["productos"], 2, true);
            $this->data["product_1"] = $a[0];
            $this->data["product_2"] = $a[1];

         
            $this->data["unidades"] = indexModel::bd($this->conf)->getDominioID("unidad_medida");

        //Empresa
        $thefolder = __DIR__."/../../includes/images/empresa/";
        if ($handler = opendir($thefolder)) {
            while (false !== ($file = readdir($handler))) {
                $file2 = explode(".", $file);
                if (is_numeric($file2[0])) {
                    $im = $file2[0];
                    $this->data["id_imagenempresa"][$im][] = array("image" => $file);
                }
            }
            closedir($handler);
        }

        



        }else{
            echo "Url erronea";
        }


      
        $template="plantilla1.html";
         
        $this->view->show($template, $this->data, $this->accion);
    }
}
?>
