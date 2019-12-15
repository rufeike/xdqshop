<?php
/**
 * Created by 登录控制器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/12
 * Time: 0:03
 */

namespace app\index\controller;
use think\Controller;

class Login extends Controller{
    public function index(){
        return $this->fetch();
    }

    public function register(){

        return $this->fetch();
    }

    public function _empty(){
        $this->redirect(url('login/index'),302);
    }
}