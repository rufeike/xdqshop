<?php
/**
 * Created by 空控制器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 15:40
 */
namespace app\index\controller;
use think\Controller;
class Error extends Controller{
    public function _empty(){
        $this->redirect(url('index/index'),302);
    }
}