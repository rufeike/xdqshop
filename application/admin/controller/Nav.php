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

class Nav extends Base{
    public function index(){
        $info= db('nav')->order('sort ASC,id ASC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['status_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
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
        $db = db('nav');
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
        $validate = Validate('nav');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        $nav_url = isset($param['nav_url'])?$param['nav_url']:'';

        if($nav_url!=''){
            $preg = "/^http(s)?:\\/\\/.+/i";
            if(!preg_match($preg,$nav_url)) {
                $nav_url = 'http://'.$nav_url;
            }
        }

        $data = array(
            'nav_name' => isset($param['nav_name'])?$param['nav_name']:'',
            'nav_url' => $nav_url,
            'status' => isset($param['status'])?$param['status']:0,
            'open' => isset($param['open'])?$param['open']:1,
            'position' => isset($param['position'])?$param['position']:'top',
        );

        //判断添加和修改
        if($action=='add'){
            $data['create_time']=time();
            $id = db('nav')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
            $res = db('nav')->where('id',$id)->data($data)->update();
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