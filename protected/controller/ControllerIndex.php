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
        $this->data["empresa"] = (object) indexModel::bd($this->conf)->getSQL($ss)[0];
        $this->data["idEmpresa"]=$this->data["empresa"]->id;
        $vv = array(
            "empresa_id"=>$this->data["idEmpresa"]
        );
        $this->data["categorias"] = indexModel::bd($this->conf)->getDominioID("categoria",$vv);
        $this->data["productos"] = indexModel::bd($this->conf)->getDominioID("producto",$vv);
        $this->data["unidades"] = indexModel::bd($this->conf)->getDominioID("unidad_medida");
        $template="plantilla3.html";
         
        $this->view->show($template, $this->data, $this->accion);
    }
}
?>
