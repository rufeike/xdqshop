<?php
/**
 * Created by 配置项模块。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 21:30
 */
namespace app\admin\controller;
use rufeike\Catetree;
use think\Db;
use think\exception\ErrorException;

class Config extends Base{
    //配置项列表
    public function index(){
        $info= db('config')->where('is_del',1)->order('sort DESC,id DESC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['status_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
            if ($v['config_type'] == 1) {
                $info[$k]['config_type_text'] = '商品配置';
            } else {
                $info[$k]['config_type_text'] = '网站配置';
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
        $id = isset($param['id'])?$param['id']:0;
        $db = db('config');
        $info = $db->where('id = ?')->bind(array($id))->find();
        $this->assign('info',$info);

        return $this->fetch();
    }


    //保存信息
    public function save()
    {
        $param = request()->param();
        $id = isset($param['id']) ? $param['id'] : '';
        $pid = isset($param['pid']) ? $param['pid'] : '';
        check_token($param);//防止重复提交


        $action = isset($param['action']) ? $param['action'] : '';

        //提交数据验证
        $validate = Validate('Config');
        $validate_res = $validate->check($param);
        if (!$validate_res) {
            get_jsonData(0, $validate->getError(), array('token' => request()->token()));
        }

        //复选框、单选框、下拉框必须指定可选值,同时对‘，’进行替换成‘,’
        if(in_array($param['form_type'],array('select','radio','checkbox'))){
            if(empty($param['values'])){
                get_jsonData(0, '复选框、单选框或下拉框必须指定默认值', array('token' => request()->token()));
            }

            if($param['form_type']=='checkbox'){
                $value = isset($param['value'])?str_replace('，',',',$param['value']):'';
            }else{
                $value = isset($param['value'])?str_replace('，',',',$param['value']):'';
                $value = explode(',',$value);
                $value= !empty($value)?$value[0]:'';
            }

            $values = isset($param['values'])?str_replace('，',',',$param['values']):'';
        }else{
            $value = isset($param['value'])?$param['value']:'';
            $values = isset($param['values'])?$param['values']:'';
        }

        $data = array(
            'cname' => isset($param['cname']) ? $param['cname'] : '',
            'ename' => isset($param['ename']) ? $param['ename'] : '',
            'value' => trim($value,','),
            'values' => trim($values,','),
            'form_type' => isset($param['form_type']) ? $param['form_type'] : 'input',
            'config_type' => isset($param['config_type']) ? $param['config_type'] : 0,
            'status' => isset($param['status']) ? $param['status'] : 0,
        );

        //判断添加和修改
        if ($action == 'add') {
            $data['create_time'] = time();
            $id = db('config')->insert($data);
            if ($id) {
                get_jsonData(200, '操作成功');
            }
        } else if ($action == 'edit') {
            //判断是否准备设置自己的子类为值得父类
            $map = array(
                'is_del'=>1,
            );

            $res = db('config')->where('id', $id)->data($data)->update();
            if ($res !== false) {
                get_jsonData(200, '操作成功');
            }
        }

        get_jsonData(0, '非法操作', array('token' => request()->token()));
    }


    //配置详情页
    public function info(){

        return $this->fetch();
    }

    //配置内容
    public function ajax_info(){
        $param = request()->param();
        $config = isset($param['config_type'])?$param['config_type']:1;
        $config = db('config')->where(array('config_type'=>$config,'is_del'=>1))->order('sort DESC')->select();
        if($config){
            foreach($config as $fk => $fv){
                if($fv['form_type']=='file'){
                    $pathinfo = pathinfo($fv['value']);
                    $realPath = ROOT_PATH.$fv['value'];
                    if(isset($pathinfo['extension'])&&in_array('.'.$pathinfo['extension'],[".png", ".jpg", ".jpeg", ".gif", ".bmp"])){
                        $config[$fk]['file_type']='img';
                    }else if(is_file($realPath)){
                        $config[$fk]['file_type']='file';
                    }else{
                        $config[$fk]['file_type']='none';
                    }
                }
            }
        }
        $this->assign('info',$config);
        return $this->fetch();
    }

    public function save_info(){
        $param = request()->param();
        $config_type = isset($param['config_type'])?$param['config_type']:1;

        //获取所有配置项中的多选项，用于判断是否取消默认值
        $checkboxNames = array();
        $fileNames = array();
        $config = db('config')->where(array('config_type'=>$config_type))->where("form_type='checkbox' OR form_type='file'")->field('ename,form_type')->select();
        if($config){
            foreach($config as $v){
                if($v['form_type']=='checkbox'){
                    $checkboxNames[] = $v['ename'];
                }elseif($v['form_type']=='file'){
                    $fileNames[] = $v['ename'];
                }
            }
        }

        //获取提交数组中的键名
        $postKeys = array_keys($param);
        //比较获取不存在的多谢框值
        $noPostCheckbox = array_diff($checkboxNames,$postKeys);

        check_token($param);//防止重复提交
        Db::startTrans();

        $table = Db::name('config');
        try {
            //普通数据数据更改
            foreach ($param as $pk => $pv) {
                if(!in_array($pk,$fileNames)) {//非文件类型的数据
                    //处理多选框数据提交修改
                    if (is_array($pv)) {
                        $value = implode(',', $pv);
                    } else {
                        $value = $pv;
                    }
                    $table->where(array('config_type'=>$config_type))->where(array('ename' => $pk))->data(array('value' => $value))->update();
                }
            }

            //图片获取文件数据更改
            if ($_FILES) {
                foreach ($_FILES as $fk => $fv) {
                    $path = $this->rfkUpload($fk, 'config');
                    $table->where(array('config_type'=>$config_type))->where(array('ename'=>$fk))->data(array('value'=>$path))->update();
                }
            }

            //对于空的多选框进行清空默认值
            foreach($noPostCheckbox as $v){
                $table->where(array('config_type'=>$config_type))->where(array('ename'=>$v))->data(array('value'=>''))->update();
            }

            Db::commit();
            get_jsonData(200, '操作成功');
        }catch (Exception $e){
            DB::rollback();//回滚操作
            get_jsonData(0, '操作失败', array('token' => request()->token(),$e->getMessage()));
        }
    }



}