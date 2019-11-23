<?php
/**
 * Created by 登录控制器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 16:48
 */
namespace app\admin\controller;
use think\Controller;
class Login extends Controller{
    public function index(){
        return $this->fetch();
    }
}
