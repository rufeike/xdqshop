<?php
/**
 * Created by 后台首页。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 15:42
 */
namespace app\admin\controller;

class Index extends Base{
    public function index(){
        return $this->fetch();
    }

    public function _empty(){
        $this->redirect(url('index',302));
    }
}
