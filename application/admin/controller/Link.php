<?php
/**
 * Created by 商品品牌管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;
use think\Db;

class Link extends Base{
    public function index(){
        $info= db('link')->where('is_del',1)->order('sort ASC,id DESC')->select();
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
        $db = db('link');
        $info = $db->where('id = ?')->bind(array($param['id']))->find();
        $this->assign('info',$info);
        return $this->fetch();
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
            // 提交事务
            Db::commit();
            get_jsonData(200,'成功',array('row'=>$res));
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            get_jsonData(0,'失败',array('error'=>$e->getMessage()));
        }
    }

    //保存信息
    public function save(){
        $param = request()->param();
        check_token($param);//防止重复提交
        $id = isset($param['id'])?$param['id']:'';
        $action = isset($param['action'])?$param['action']:'';
        $old_pic= isset($param['old_pic'])?$param['old_pic']:'';

        //提交数据验证
        $validate = Validate('link');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        if($_FILES){
            $pic = $this->rfkupload('file','link');
        }else{
            $pic = '';
        }
        $link_url = isset($param['link_url'])?trim($param['link_url']):'';

        if($link_url!=''){
            $preg = "/^http(s)?:\\/\\/.+/i";
            if(!preg_match($preg,$link_url)) {
                $link_url = 'http://'.$link_url;
            }
        }

        $data = array(
            'link_name' => isset($param['link_name'])?$param['link_name']:'',
            'link_url' => $link_url,
            'link_src' => $pic!=''?$pic:$old_pic,
            'description' => isset($param['description'])?$param['description']:'',
            'status' => isset($param['status'])?$param['status']:0,
        );

        //判断添加和修改
        if($action=='add'){
            $data['create_time'] = time();
            $id = db('link')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
            $res = db('link')->where('id',$id)->data($data)->update();
            if($res!==false){
                if($pic){//删除老照片地址
                    $path = ROOT_PATH . DS.$old_pic;
                    @unlink($path);
                }
                get_jsonData(200,'操作成功');
            }
        }

        get_jsonData(0,'非法操作',array('token'=>request()->token()));
    }



}