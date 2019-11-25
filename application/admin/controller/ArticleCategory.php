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
use think\Db;

class ArticleCategory extends Base{
    public function index(){
        $info= db('article_category')->alias('AC')->join('article_category PAC','AC.pid = PAC.id','LEFT')->where('AC.is_del',1)->order('AC.sort ASC,AC.id DESC')->field("AC.*,PAC.cate_name as pname")->select();
        $cateTree = new Catetree($info);
        $info = $cateTree->getTree();

        foreach($info as $k => $v){
            switch ($v['cate_type']){
                case 1:
                    $info[$k]['cate_type_text'] = '系统分类';
                    break;
                case 2:
                    $info[$k]['cate_type_text'] = '网店帮助';
                    break;
                case 3:
                    $info[$k]['cate_type_text'] = '网店信息';
                    break;
                default:
                    $info[$k]['cate_type_text'] = '普通分类';
            }
        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //添加
    public function add(){
        $param = request()->param();
        $id = isset($param['id'])?$param['id']:0;
        $info= db('article_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid")->select();

        //获取树状结构数据
        $cateTree = new Catetree($info);
        $info = $cateTree->getTree();
        $this->assign('info',$info);
        $this->assign('id',$id);
        return $this->fetch();
    }

    //修改
    public function edit(){
        $param = request()->param();
        $id = isset($param['id'])?$param['id']:0;
        $db = db('article_category');
        $info = $db->where('id = ?')->bind(array($id))->find();
        $this->assign('info',$info);

        $where = array(
            'is_del'=>1,
            'id'=>array('neq',$id),
        );

        $cate= db('article_category')->where($where)->order('sort ASC')->field("id,cate_name,pid")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $cate = $cateTree->getTree();
        $this->assign('cateTree',$cate);
        return $this->fetch();
    }

    //删除
    public function delete(){
        $param = request()->param();
        $id= isset($param['id'])?$param['id']:0;

        if(in_array($id,array(1,2,3))){
            get_jsonData(0,'系统分类、网站帮助和网站信息分类均属于内置分类不能删除');
        }

        $model = isset($param['model'])?$param['model']:'';

        // 启动事务
        Db::startTrans();
        try{

            $map = array(
                'is_del'=>1,
            );
            $cate= db('article_category')->where($map)->order('sort ASC')->field("id,cate_name,pid")->select();
            //获取树状结构数据
            $cateTree = new Catetree($cate);
            $childrenIds = $cateTree->getChildrenIds($id);
            $childrenIds[] = $id;//包含本身

            $res = Db::name($model)->where(array('id'=>array('in',$childrenIds)))->data(array('is_del'=>0))->update();
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
        $id = isset($param['id']) ? $param['id'] : '';
        $pid = isset($param['pid']) ? $param['pid'] : '';
        check_token($param);//防止重复提交

        if (in_array($pid,array(1,3))&&!in_array($id,array(1,2,3))) {
            get_jsonData(0, '该分类不能添加子分类', array('token' => request()->token()));
        }

        $action = isset($param['action']) ? $param['action'] : '';

        //提交数据验证
        $validate = Validate('ArticleCategory');
        $validate_res = $validate->check($param);
        if (!$validate_res) {
            get_jsonData(0, $validate->getError(), array('token' => request()->token()));
        }


        //获取父级分类类型
        $cate_type = db('article_category')->where('id',$pid)->field('cate_type')->find();

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
            $data['cate_type'] = isset($cate_type[0])?$cate_type[0]:0;
            $id = db('article_category')->insert($data);
            if ($id) {
                get_jsonData(200, '操作成功');
            }
        } else if ($action == 'edit') {
            //判断是否准备设置自己的子类为值得父类
            $map = array(
                'is_del'=>1,
            );
            $cate= db('article_category')->where($map)->order('sort ASC')->field("id,cate_name,pid")->select();
            //获取树状结构数据
            $cateTree = new Catetree($cate);
            $childrenIds = $cateTree->getChildrenIds($id);
            if(in_array($pid,$childrenIds)){
                get_jsonData(0,'子类不能修改为父类', array('token' => request()->token()));
            }

            if((in_array($id,array(2,3))&&$pid!=1)||($id==1&&$pid!=0)){
                get_jsonData(0,'系统分类、网站帮助和网站信息分类均属于内置分类不能修改其父类', array('token' => request()->token()));
            }

            //设置分类类型
            if($id==1){
                $data['cate_type'] = 1;
            }else if($id==2){
                $data['cate_type'] = 2;
            }else if($id==3){
                $data['cate_type'] = 3;
            }else{
                $data['cate_type'] = isset($cate_type[0])?$cate_type[0]:0;
            }



            $res = db('article_category')->where('id', $id)->data($data)->update();
            if ($res !== false) {
                get_jsonData(200, '操作成功');
            }
        }

        get_jsonData(0, '非法操作', array('token' => request()->token()));
    }
}