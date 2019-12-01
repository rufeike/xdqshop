<?php
/**
 * Created by 商品类型管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;
use think\Db;

class GoodsType extends Base{
    public function index(){
        $info= db('goods_type')->where('is_del',1)->order('id DESC')->select();
        $this->assign('info',$info);

        return $this->fetch();
    }

    //添加
    public function add(){
        return $this->fetch();
    }

    //修改
    public function edit(){
        $param = request()->param();
        $db = db('goods_type');
        $info = $db->where('id = ?')->bind(array($param['id']))->find();
        $this->assign('info',$info);
        return $this->fetch();
    }


    //保存信息
    public function save(){
        $param = request()->param();
        check_token($param);//防止重复提交
        $id = isset($param['id'])?$param['id']:'';
        $action = isset($param['action'])?$param['action']:'';

        //提交数据验证
        $validate = Validate('goods_type');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }


        $data = array(
            'type_name' => isset($param['type_name'])?$param['type_name']:'',
        );

        //判断添加和修改
        if($action=='add'){
            $id = db('goods_type')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
            $res = db('goods_type')->where('id',$id)->data($data)->update();
            if($res!==false){
                get_jsonData(200,'操作成功');
            }
        }

        get_jsonData(0,'非法操作',array('token'=>request()->token()));
    }

    //删除
    public function delete(){
        $param = request()->param();
        $id= isset($param['id'])?$param['id']:0;
        $model = isset($param['model'])?$param['model']:'';

        // 启动事务
        Db::startTrans();
        try{
            $res = Db::name($model)->where(array('id'=>$id))->data(array('is_del'=>0))->update();
            $res2 = Db::name('goods_attribute')->where(array('goods_type_id'=>$id))->data(array('is_del'=>0))->update();
            // 提交事务
            Db::commit();
            get_jsonData(200,'成功',array('row'=>$res,'row2'=>$res2));
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            get_jsonData(0,'失败',array('error'=>$e->getMessage()));
        }
    }
}