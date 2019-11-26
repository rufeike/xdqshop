<?php
/**
 * Created by 文章管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;
use think\Db;
use rufeike\Catetree;

class Article extends Base{
    public function index(){
        $info= db('article')->where('is_del',1)->order('sort ASC,id DESC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['status_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
            if ($v['show_top'] == 1) {
                $info[$k]['show_top_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['show_top_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //回收站
    public function recycle(){
        $info= db('article')->where('is_del',0)->order('sort ASC,id DESC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['status_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
            if ($v['show_top'] == 1) {
                $info[$k]['show_top_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            } else {
                $info[$k]['show_top_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //添加
    public function add(){
        $cate= db('article_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $cate = $cateTree->getTree();
        $this->assign('cateTree',$cate);
        return $this->fetch();
    }

    //修改
    public function edit(){
        $param = request()->param();
        $db = db('article');
        $info = $db->where('id = ?')->bind(array($param['id']))->find();
        $this->assign('info',$info);

        $cate= db('article_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $cate = $cateTree->getTree();
        $this->assign('cateTree',$cate);

        return $this->fetch();
    }


    //保存信息
    public function save(){
        $param = request()->param();
        check_token($param);//防止重复提交
        $id = isset($param['id'])?$param['id']:'';
        $action = isset($param['action'])?$param['action']:'';
        $old_pic= isset($param['old_pic'])?$param['old_pic']:'';

        //提交数据验证
        $validate = Validate('article');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        $pic = $this->upload();
        $link_url = isset($param['link_url'])?trim($param['link_url']):'';

        if($link_url!=''){
            $preg = "/^http(s)?:\\/\\/.+/i";
            if(!preg_match($preg,$link_url)) {
                $link_url = 'http://'.$link_url;
            }
        }

        $data = array(
            'cate_id' => isset($param['cate_id'])?$param['cate_id']:0,
            'title' => isset($param['title'])?$param['title']:'',
            'author' => isset($param['author'])?$param['author']:'',
            'link_url' => $link_url,
            'thumb' => $pic!=''?$pic:$old_pic,
            'description' => isset($param['description'])?$param['description']:'',
            'keywords' => isset($param['keywords'])?$param['keywords']:'',
            'show_top' => isset($param['show_top'])?$param['show_top']:0,
            'status' => isset($param['status'])?$param['status']:0,
            'content' => isset($param['content'])?$param['content']:'',
        );

        //判断添加和修改
        if($action=='add'){
            $data['create_time'] = time();
            $id = db('article')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
            $data['update_time'] = time();
            $res = db('article')->where('id',$id)->data($data)->update();
            if($res!==false){
                if($pic){//删除老照片地址
                    $path = ROOT_PATH . 'public' . DS . 'uploads'.DS.'article'.DS.$old_pic;
                    @unlink($path);
                }
                get_jsonData(200,'操作成功');
            }
        }

        get_jsonData(0,'非法操作',array('token'=>request()->token()));
    }

    //上传图片
    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');

        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'article');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                //echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                return $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                //echo $info->getFilename();
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }else{
            return '';
        }
    }

    //彻底删除数据
    public function delete_ever(){
        $param = request()->param();
        $id= isset($param['id'])?$param['id']:0;
        $model = isset($param['model'])?$param['model']:'';

        // 启动事务
        Db::startTrans();
        try{
            $info = Db::name($model)->where(array('id'=>$id))->find();
            $res = Db::name($model)->where(array('id'=>$id))->data(array('is_del'=>0))->delete();
            if($res!=false){
                //删除文字缩略图
                if(isset($res['thumb'])&&$res['thumb']!=''){//删除老照片地址
                    $path = ROOT_PATH . 'public' . DS . 'uploads'.DS.'article'.DS.$res['thumb'];
                    @unlink($path);
                }

                // 提交事务
                Db::commit();
            }
            get_jsonData(200,'成功',array('row'=>$res));
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            get_jsonData(0,'失败',array('error'=>$e->getMessage()));
        }
    }


}