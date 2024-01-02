<?php
class control{
    public function view($view, $data = [])
    {
        //karena dia hanya tampilan
        require_once('view/') . $view . '.php';
    }

    public function model($model)
    {
        require_once('models/') . $model . '.php';
        return new $model;
    }

}
?>