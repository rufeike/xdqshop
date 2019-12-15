<?php
/**
 * Created by 商品展示页面。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/10
 * Time: 20:36
 */
namespace app\index\controller;

class Goods extends Base{
    public function index(){
        return $this->fetch();
    }
}
