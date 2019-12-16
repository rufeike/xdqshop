<?php
/**
 * Created by 商品分类模型类。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 15:45
 */
namespace app\common\model;
use think\Model;
use \think\Image;

class GoodsCategory extends Model{
    //自动过滤掉不存在的字段
    protected static  function init(){
        GoodsCategory::afterInsert(function ($goods_category) {
            //添加会员价格
            $id = $goods_category->id;
            $param = request()->post();
            //添加推荐位信息
            if(isset($param['recommend'])){
                $recommend = $param['recommend'];
                foreach($recommend as $reck => $recv){
                    $recommendArr = array();
                    $recommendArr['item_id'] = $id;
                    $recommendArr['rec_id'] = $recv;
                    $recommendArr['rec_type'] = 2;
                    $recommend_rel = db('recommend_detail')->insert($recommendArr);
                }
            }
        });

        //更新之前
        GoodsCategory::beforeUpdate(function($goods_category){


            $id = $goods_category->id;
            $param = request()->post();

            //添加推荐位信息
            //删除推荐位老纪录信息
            db('recommend_detail')->where(array('item_id'=>$id,'rec_type'=>2))->delete();
            if(isset($param['recommend'])){
                $recommend = $param['recommend'];
                foreach($recommend as $reck => $recv){
                    $recommendArr = array();
                    $recommendArr['item_id'] = $id;
                    $recommendArr['rec_id'] = $recv;
                    $recommendArr['rec_type'] = 2;
                    $recommend_rel = db('recommend_detail')->insert($recommendArr);
                }
            }

        });

    }

}