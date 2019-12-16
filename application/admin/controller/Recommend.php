<?php
/**
 * Created by 首页导航管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;
use think\Db;

class Recommend extends Base{
    public function index(){
        $info= db('recommend')->order('id ASC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['status_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
            if ($v['rec_type'] == 1) {
                $info[$k]['rec_type_text'] = '商品推荐';
            }else {
                $info[$k]['rec_type_text'] = '栏目推荐';
            }
        }
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
        $db = db('recommend');
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
        $validate = Validate('recommend');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }


        $data = array(
            'rec_name' => isset($param['rec_name'])?$param['rec_name']:'',
            'status' => isset($param['status'])?$param['status']:0,
            'rec_type' => isset($param['rec_type'])?$param['rec_type']:1,
        );

        //判断添加和修改
        if($action=='add'){
            $id = db('recommend')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
            $res = db('recommend')->where('id',$id)->data($data)->update();
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
            $res = Db::name($model)->where(array('id'=>$id))->delete();
            // 提交事务
            Db::commit();
            get_jsonData(200,'成功',array('row'=>$res));
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            get_jsonData(0,'失败',array('error'=>$e->getMessage()));
        }
    }
}