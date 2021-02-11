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
        $this->data["empresa"] = (object) indexModel::bd($this->conf)->getDominio("empresa",$c)[0];
        $vv = array(
            "empresa_id"=>$c
        );
        $this->data["categorias"] = indexModel::bd($this->conf)->getDominioID("categoria",$vv);
        $this->data["productos"] = indexModel::bd($this->conf)->getDominioID("producto",$vv);
        $this->data["unidades"] = indexModel::bd($this->conf)->getDominioID("unidad_medida");
        $template="plantilla".$this->data["empresa"]->plantilla_id.".html";
        $this->view->show($template, $this->data, $this->accion);
    }
}
?>
