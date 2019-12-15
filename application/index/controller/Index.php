<?php
namespace app\index\controller;

class Index extends Base {
    public function index(){
        return $this->fetch();
    }
    public function search(){
        return $this->fetch();
    }

    //手机模板下的分类
    public function sort(){
        return $this->fetch();
    }
}
