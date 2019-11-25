<?php
/**
 * Created by 后台模块公共类。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 15:41
 */

namespace app\admin\controller;
use think\Controller;

class Base extends Controller{

    public function ajaxSort(){
        if(request()->isPost()){
            $param = input('post.');
            $id = isset($param['id'])?(int)$param['id']:0;
            $number = isset($param['number'])?(int)$param['number']:99;
            $model = isset($param['model'])?$param['model']:'';
            if($id!=0 && $model!=''){
                $rel = db($model)->where('id',$id)->data(array('sort'=>$number))->update();
                if($rel>0){
                    get_jsonData(200,'操作成功',array());
                }
            }

            get_jsonData(0,'操作失败',array());
        }

        get_jsonData(0,'操作失败',array());
    }
}
