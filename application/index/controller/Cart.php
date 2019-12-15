<?php
/**
 * Created by 购物车。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/12
 * Time: 0:23
 */

namespace app\index\controller;

class Cart extends Base{
    public function index(){
        return $this->fetch();
    }

    //支付
    public function pay(){
        return $this->fetch();
    }

    //支付成功
    public function paysuccess(){
        return $this->fetch();
    }
}