<?php
/**
 * Created by 商品属性管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;
use think\Db;

class GoodsAttribute extends Base{
    public function index(){
        $info= db('goods_attribute')->alias('attr')->join('goods_type type','attr.goods_type_id = type.id','LEFT')->where(array('attr.is_del'=>1))->order('attr.goods_type_id ASC,attr.sort ASC')->field('attr.*,type.type_name')->select();
        if($info){
            foreach($info as $ik => $iv){
                if($iv['attr_type']==1){
                    $info[$ik]['attr_type_text'] = "单选属性";
                }else{
                    $info[$ik]['attr_type_text'] = "唯一属性";
                }
            }
        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //添加
    public function add(){
        $goods_type = Db::name('goods_type')->where(array('is_del'=>1))->select();
        $this->assign('goods_type',$goods_type);
        return $this->fetch();
    }

    //修改
    public function edit(){
        $param = request()->param();
        $attr = Db::name('goods_attribute');
        $info = $attr->where('id = ?')->bind(array($param['id']))->find();
        $goods_type = Db::name('goods_type')->where(array('is_del'=>1))->select();
        $this->assign('info',$info);
        $this->assign('goods_type',$goods_type);
        return $this->fetch();
    }


    //保存信息
    public function save(){
        $param = request()->param();
        check_token($param);//防止重复提交
        $id = isset($param['id'])?$param['id']:'';
        $action = isset($param['action'])?$param['action']:'';

        //提交数据验证
        $validate = Validate('goods_attribute');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        $values = isset($param['attr_values'])?str_replace('，',',',$param['attr_values']):'';

        $data = array(
            'attr_name' => isset($param['attr_name'])?$param['attr_name']:'',
            'attr_type' => isset($param['attr_type'])?$param['attr_type']:0,
            'goods_type_id' => isset($param['goods_type_id'])?$param['goods_type_id']:0,
            'attr_values' =>trim($values,','),
        );

        //判断添加和修改
        if($action=='add'){
            $id = db('goods_attribute')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
            $res = db('goods_attribute')->where('id',$id)->data($data)->update();
            if($res!==false){
                get_jsonData(200,'操作成功');
            }
        }

        get_jsonData(0,'非法操作',array('token'=>request()->token()));
    }



}