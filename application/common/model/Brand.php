<?php
/**
 * Created by 商品分类模型。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 15:45
 */
namespace app\common\model;
use think\Model;

class Brand extends Model{

    public function findAll(){
        return $this->all();
    }
}