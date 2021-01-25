<?php
class ControllerIndex extends Controller {
    function __construct($view, $conf, $var, $acc) {
        parent::__construct($view, $conf, $var, $acc);
    }
    public function main() {
        $this->data["categorias"] = indexModel::bd($this->conf)->getDominio("categoria");
        $this->view->show("index.html", $this->data, $this->accion);
    }
}
?>
