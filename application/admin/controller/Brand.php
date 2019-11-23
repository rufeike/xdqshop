<?php
/**
 * Created by 商品品牌管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;

class Brand extends Base{
    public function index(){
        $info = [
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
            ['id'=>1,'brand_name'=>'安踏','brand_url'=>'http://www.anta.com','brand_src'=>'','description'=>''],
        ] ;
        $this->assign('info',$info);

        return $this->fetch();
    }
}