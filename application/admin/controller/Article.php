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
        $validate = Validate('article');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        $pic = $this->upload();
        $article_url = isset($param['article_url'])?trim($param['article_url']):'';

        if($article_url!=''){
            $preg = "/^http(s)?:\\/\\/.+/i";
            if(!preg_match($preg,$article_url)) {
                $article_url = 'http://'.$article_url;
            }
        }

        $data = array(
            'article_name' => isset($param['article_name'])?$param['article_name']:'',
            'article_url' => $article_url,
            'article_src' => $pic!=''?$pic:$old_pic,
            'description' => isset($param['description'])?$param['description']:'',
            'status' => isset($param['status'])?$param['status']:0,
        );

        //判断添加和修改
        if($action=='add'){
            $data['create_time'] = time();
            $id = db('article')->insert($data);
            if($id){
                get_jsonData(200,'操作成功');
            }
        }else if($action=='edit'){
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


}