<?php
/**
 * Created by 个人中心。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/11
 * Time: 23:54
 */
namespace app\index\controller;

class Person extends Base{
    public function index(){
        return $this->fetch();
    }

    //我的收藏
    public function collection(){
        return $this->fetch();
    }
    //我的足迹
    public function foot(){
        return $this->fetch();
    }

    //我的订单
    public function order(){
        return $this->fetch();
    }

    //我的资产
    public function bill(){
        return $this->fetch();
    }

    //我的地址
    public function address(){
        return $this->fetch();
    }

    //我的资料
    public function information(){
        return $this->fetch();
    }

    //消息
    public function news(){
        return $this->fetch();
    }

    //安全设置
    public function safety(){
        return $this->fetch();
    }

    //退款
    public function change(){
        return $this->fetch();
    }

    //红包
    public function bonus(){
        return $this->fetch();
    }

    //优惠劵
    public function coupon(){
        return $this->fetch();
    }
    //我的评价
    public function commentlist(){
        return $this->fetch();
    }
}
