<?php
/**
 * 系统文件管理器模块 。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/28
 * Time: 23:48
 */
namespace app\admin\controller;
class FileManager extends Base{
    //上传图片管理
    public function index(){
        $pathArr=$this->getFilesPath();
        $this->assign('info',$pathArr);
        return $this->fetch();
    }

    //ajax_获取文件夹信息内容
    public function ajax_index(){
        $param = request()->param();
        $path=isset($param['path'])?$param['path']:'public/uploads';
        $pathArr=$this->getFilesPath($path);
        $this->assign('info',$pathArr);
        return $this->fetch();
    }

    //ueditor图片管理
    public function imgManagement(){
        $pathArr=$this->getImagesPath();
        $this->assign('info',$pathArr);
        return $this->fetch();
    }

    //ajax_获取文件夹信息内容
    public function ajax_imgManagement(){
        $param = request()->param();
        $path=isset($param['path'])?$param['path']:'public/ueditor/image';
        $pathArr=$this->getImagesPath($path);
        $this->assign('info',$pathArr);
        return $this->fetch();
    }



    //获取路径层次
    public function getLever($path,$base){
        static $arr = array();
        if($path!=$base){
            $name = substr($path,strrpos($path,'/')+1);
            $newPath = substr($path,0,strrpos($path,'/'));
            $prev['name']=$name;
            $prev['path']=$path;
            array_unshift($arr,$prev);
            $this->getLever($newPath,$base);
        }
        return $arr;
    }


    //获取图片文件
    public function getImagesPath($path='public/ueditor/image',$base='public/ueditor/image'){
        $path = str_replace('\\','/',$path);
        $prev= array();
        if($path!=$base){
            $prev = $this->getLever($path,$base);
        }
        $path =ROOT_PATH.$path;

        $files = scandir($path,true);
        $pathArr = array();

        foreach($files as $v){
            $tmpArr = array();
            if($v!='.'&&$v!='..'){
                $pathinfo=pathinfo($v);
                if(is_dir($path.DS.$v)){
                    $tmpArr['type'] = 'dir';
                    $tmpArr['name'] = $v;
                    $tmpArr['realpath'] = $path.DS.$v;
                    $tmpArr['path'] = str_replace(ROOT_PATH,'',$path.DS.$v);
                    array_unshift($pathArr,$tmpArr);
                }else{
                    if(isset($pathinfo['extension'])&&in_array('.'.$pathinfo['extension'],[".png", ".jpg", ".jpeg", ".gif", ".bmp"])){
                        $tmpArr['type'] = 'file';
                        $tmpArr['name'] = $v;
                        $tmpArr['realpath'] = $path.DS.$v;
                        $tmpArr['path'] = DS.str_replace(ROOT_PATH,'',$path.DS.$v);
                    }
                    $pathArr[] = $tmpArr;
                }
            }
        }

        return array('prev'=>$prev,'data'=>$pathArr);
    }

    //获取文件
    public function getFilesPath($path='public/uploads',$base='public/uploads'){
        $path = str_replace('\\','/',$path);
        $prev= array();
        if($path!=$base){
            $prev = $this->getLever($path,$base);
        }
        $path =ROOT_PATH.$path;

        $files = scandir($path,true);
        $pathArr = array();

        foreach($files as $v){
            $tmpArr = array();
            if($v!='.'&&$v!='..'){
                $pathinfo=pathinfo($v);
                if(is_dir($path.DS.$v)){
                    $tmpArr['type'] = 'dir';
                    $tmpArr['name'] = $v;
                    $tmpArr['realpath'] = $path.DS.$v;
                    $tmpArr['path'] = str_replace(ROOT_PATH,'',$path.DS.$v);
                    array_unshift($pathArr,$tmpArr);
                }else{
                    if(isset($pathinfo['extension'])&&in_array('.'.$pathinfo['extension'],[".png", ".jpg", ".jpeg", ".gif", ".bmp"])){
                        $tmpArr['type'] = 'img';
                        $tmpArr['name'] = $v;
                        $tmpArr['realpath'] = $path.DS.$v;
                        $tmpArr['path'] = DS.str_replace(ROOT_PATH,'',$path.DS.$v);
                    }else{
                        $tmpArr['type'] = 'file';
                        $tmpArr['name'] = $v;
                        $tmpArr['realpath'] = $path.DS.$v;
                        $tmpArr['path'] = DS.str_replace(ROOT_PATH,'',$path.DS.$v);
                    }
                    $pathArr[] = $tmpArr;
                }
            }
        }

        return array('prev'=>$prev,'data'=>$pathArr);
    }

    //删除编辑器图片
    public function del_img(){
        $param = request()->param();
        $path = isset($param['path'])?trim(trim($param['path'],'/'),'\\'):'';
        $realPath = ROOT_PATH.$path;
        if($path==''||!is_file($realPath)){
            get_jsonData(0,'图片路径不存在');
        }

        if(@unlink($realPath)){
            get_jsonData(200,'图片删除成功');
        }
    }

}
