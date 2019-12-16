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

class GoodsCategory extends Base{
    public function index(){
        $info= db('goods_category')->alias('AC')->join('goods_category PAC','AC.pid = PAC.id','LEFT')->where('AC.is_del',1)->order('AC.sort ASC,AC.id DESC')->field("AC.*,PAC.cate_name as pname")->select();
        $cateTree = new Catetree($info);
        $info = $cateTree->getTree();

        foreach($info as $k => $v){
            if($v['status']==1){
                $info[$k]['status_text'] = '<i class="fas fa-check-circle" style="color:#00ff00;font-size: 20px"></i>';
            }else{
                $info[$k]['status_text'] = '<i class="fas fa-times-circle" style="color: #ff0000;font-size: 20px"></i>';
            }
        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //添加
    public function add(){
        $param = request()->param();
        $id = isset($param['id'])?$param['id']:0;
        $info= db('goods_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();

        //获取树状结构数据
        $cateTree = new Catetree($info);
        $info = $cateTree->getTree();
        $this->assign('info',$info);
        $this->assign('id',$id);
        //获取推荐位记录
        $recommend = db('recommend')->where(array('rec_type'=>2))->select();
        $this->assign('recommend',$recommend);

        return $this->fetch();
    }

    //修改
    public function edit(){
        $param = request()->param();
        $id = isset($param['id'])?$param['id']:0;
        $db = db('goods_category');
        $info = $db->where('id = ?')->bind(array($id))->find();
        $this->assign('info',$info);

        $where = array(
            'is_del'=>1,
            'id'=>array('neq',$id),
        );

        $cate= db('goods_category')->where($where)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $cate = $cateTree->getTree();
        $this->assign('cateTree',$cate);

        //获取推荐位记录
        $recommend = db('recommend')->where(array('rec_type'=>2))->select();
        $this->assign('recommend',$recommend);
        //获取本商品的推荐位记录
        $recommend_detail = db('recommend_detail')->where(array('item_id'=>$id,'rec_type'=>2))->select();
        $recommend_ids = array();
        if($recommend_detail){
            foreach($recommend_detail as $v){
                $recommend_ids[] = $v['rec_id'];
            }
        }
        $this->assign('recommend_ids',$recommend_ids);

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

            $map = array(
                'is_del'=>1,
            );
            $cate= db('goods_category')->where($map)->order('sort ASC')->field("id,cate_name,pid")->select();
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
        $old_pic= isset($param['old_pic'])?$param['old_pic']:'';
        check_token($param);//防止重复提交

        $action = isset($param['action']) ? $param['action'] : '';

        //提交数据验证
        $validate = Validate('GoodsCategory');
        $validate_res = $validate->check($param);
        if (!$validate_res) {
            get_jsonData(0, $validate->getError(), array('token' => request()->token()));
        }



        if($_FILES){
            //获取父级分类类型
            $pic = $this->rfkUpload('file','goodscategory');
        }else{
            $pic = '';
        }

        $data = array(
            'cate_name' => isset($param['cate_name']) ? $param['cate_name'] : '',
            'description' => isset($param['description'])?$param['description']:'',
            'keywords' => isset($param['keywords'])?$param['keywords']:'',
            'thumb' => $pic!=''?$pic:$old_pic,
            'pid' => isset($param['pid']) ? $param['pid'] : 0,
            'status' => isset($param['status']) ? $param['status'] : 0,
        );

        //判断添加和修改
        if ($action == 'add') {
            $data['create_time'] = time();
            $model = model('goods_category');
            $res = $model->allowField(true)->save($data);
            if($res){
                get_jsonData(200, '操作成功');
            }
        } else if ($action == 'edit') {
            //判断是否准备设置自己的子类为值得父类
            $map = array(
                'is_del'=>1,
            );
            $cate= db('goods_category')->where($map)->order('sort ASC')->field("id,cate_name,pid")->select();
            //获取树状结构数据
            $cateTree = new Catetree($cate);
            $childrenIds = $cateTree->getChildrenIds($id);
            if(in_array($pid,$childrenIds)){
                get_jsonData(0,'子类不能修改为父类', array('token' => request()->token()));
            }

            $data['id']=$id;
            $model = model('goods_category');
            $res=$model->allowField(true)->update($data);
            if ($res !== false) {
                if($pic){//删除老照片地址
                    $path = ROOT_PATH . $old_pic;
                    @unlink($path);
                }

                get_jsonData(200, '操作成功');
            }
        }

        get_jsonData(0, '非法操作', array('token' => request()->token()));
    }

}