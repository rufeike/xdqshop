<?php
/**
 * Created by 文章分类模块。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 21:30
 */
namespace app\admin\controller;
use rufeike\Catetree;

class ArticleCategory extends Base{
    public function index(){
        $info= db('article_category')->where('is_del',1)->order('sort ASC,id DESC')->select();
        $cateTree = new Catetree($info);
        $info = $cateTree->getTree();

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
        $db = db('article_category');
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
    public function save()
    {
        $param = request()->param();
        check_token($param);//防止重复提交
        $id = isset($param['id']) ? $param['id'] : '';
        $action = isset($param['action']) ? $param['action'] : '';

        //提交数据验证
        $validate = Validate('ArticleCategory');
        $validate_res = $validate->check($param);
        if (!$validate_res) {
            get_jsonData(0, $validate->getError(), array('token' => request()->token()));
        }


        $data = array(
            'cate_name' => isset($param['cate_name']) ? $param['cate_name'] : '',
            'description' => isset($param['description'])?$param['description']:'',
            'keywords' => isset($param['keywords'])?$param['keywords']:'',
            'pid' => isset($param['pid']) ? $param['pid'] : 0,
            'status' => isset($param['status']) ? $param['status'] : 0,
        );

        //判断添加和修改
        if ($action == 'add') {
            $data['create_time'] = time();
            $id = db('article_category')->insert($data);
            if ($id) {
                get_jsonData(200, '操作成功');
            }
        } else if ($action == 'edit') {
            $res = db('article_category')->where('id', $id)->data($data)->update();
            if ($res !== false) {
                get_jsonData(200, '操作成功');
            }
        }

        get_jsonData(0, '非法操作', array('token' => request()->token()));
    }
}