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
use think\Db;

class Base extends Controller{

    //修改排序
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

    //恢复数据
    public function recover(){
        $param = request()->param();
        $id= isset($param['id'])?$param['id']:0;
        $model = isset($param['model'])?$param['model']:'';

        // 启动事务
        Db::startTrans();
        try{
            $res = Db::name($model)->where(array('id'=>$id))->data(array('is_del'=>1))->update();
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
