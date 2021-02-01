<?php
class ControllerStore extends Controller {
    function __construct($view, $conf, $var, $acc) {
        parent::__construct($view, $conf, $var, $acc);
    }
    public function main() {
        foreach ($this->var as $key => $value) {
            $$key = $value;
        }
        $this->data["empresa"] = (object) indexModel::bd($this->conf)->getDominio("empresa",$c)[0];
        //$vv = array( "empresa_id"=>$c);
        //$this->data["categorias"] = indexModel::bd($this->conf)->getDominioID("categoria",$vv);
        $template="plantilla2.html";
        $this->view->show($template, $this->data, $this->accion);
    }
}
?>
