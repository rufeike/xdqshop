<?php
/**
 * Created by 商品管理。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */
namespace app\admin\controller;
use think\Db;
use rufeike\Catetree;

class Goods extends Base{
    public function index(){
        $info= db('goods')->where('is_del',1)->order('sort ASC,id DESC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<span style="color:#999">已上架</span>';
            } else if($v['status']==2){
                $info[$k]['status_text'] = '<span style="color:#cccccc">已下架</span>';
            }else{
                $info[$k]['status_text'] = '<span style="color:#0000f1">待审核</span>';
            }


        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //回收站
    public function recycle(){
        $info= db('goods')->where('is_del',0)->order('sort ASC,id DESC')->select();
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
        //商品分类信息
        $cate= db('goods_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $cate = $cateTree->getTree();
        $this->assign('cateTree',$cate);

        //获取品牌名称
        $brand = db('brand')->where('is_del',1)->order('sort ASC')->select();
        $this->assign('brand',$brand);

        //获取会员级别列表
        $level = Db::name('member_level')->where(array('is_del'=>1))->select();
        $this->assign('level',$level);

        //获取会员级别列表
        $goods_type= Db::name('goods_type')->where(array('is_del'=>1))->select();
        $this->assign('goods_type',$goods_type);

        return $this->fetch();
    }

    //获取商品基本信息
    private function get_goods_info($id){
        $goods = db('goods')->where(array('id'=>$id))->find();
        return $goods;
    }


    //异步获取商品属性
    public function ajax_attribute_list(){
        $param = request()->post();
        $id = isset($param['goods_type_id'])?$param['goods_type_id']:0;
        //获取会员级别列表
        $goods_attribute= Db::name('goods_attribute')->where(array('is_del'=>1,'goods_type_id'=>$id))->order('sort ASC')->select();
        if($goods_attribute){
            foreach($goods_attribute as $k => $v){
                if($v['attr_values']!=''){
                    $goods_attribute[$k]['attr_values']=explode(',',$v['attr_values']);
                }
            }
        }

        $this->assign('goods_attribute',$goods_attribute);
        return $this->fetch();
    }
    //异步获取商品相册
    public function ajax_goods_photo(){
        return $this->fetch();
    }

    //修改
    public function edit(){
        $param = request()->param();
        $id = isset($param['id'])?$param['id']:0;
        if($id ==0){
            $this->redirect(url('goods/index'));
        }
        $db = db('goods');
        $info = $db->where('id = ?')->bind(array($id))->find();
        $this->assign('info',$info);

        //商品分类信息
        $cate= db('goods_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $cate = $cateTree->getTree();
        $this->assign('cateTree',$cate);

        //获取品牌名称
        $brand = db('brand')->where('is_del',1)->order('sort ASC')->select();
        $this->assign('brand',$brand);

        //获取会员级别列表
        $level = Db::name('member_level')->where(array('is_del'=>1))->select();
        $this->assign('level',$level);

        //获取会员级别列表
        $goods_type= Db::name('goods_type')->where(array('is_del'=>1))->select();
        $this->assign('goods_type',$goods_type);

        //获取商品会员价格
        $member_price = Db::name('member_price')->where('goods_id=?')->bind(array($id))->select();
        $priceArr = array();
        if(!empty($member_price)){
            foreach($member_price as $mpk => $mpv){
                $priceArr[$mpv['member_level_id']] = $mpv['member_price'];
            }
        }
        $this->assign('priceArr',$priceArr);

        //获取商品相册详情
        $goods_photo= db('goods_photo')->where('goods_id=?')->bind(array($id))->select();
        $this->assign('goods_photo',$goods_photo);

        return $this->fetch();
    }


    //保存信息
    public function save(){
        $param = request()->post();
        dump($param);
        die;

        check_token($param);//防止重复提交

        $id = isset($param['id'])?$param['id']:'';
        $action = isset($param['action'])?$param['action']:'';

        //提交数据验证
        $validate = Validate('goods');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        //商品分类信息
        $cate= db('goods_category')->where('is_del',1)->order('sort ASC')->field("id,cate_name,pid,allow_add")->select();
        //获取树状结构数据
        $cateTree = new Catetree($cate);
        $pids = $cateTree->getParentsId($param['goods_category_id']);
        rsort($pids);
        $goods_category_path = implode('_',$pids).'_';


        $data = array(
            'goods_category_id' => $param['goods_category_id'],
            'goods_category_path' => $goods_category_path,
            'brand_id' => $param['brand_id'],
            'goods_name' => $param['goods_name'],
            'market_price' => $param['market_price'],
            'shop_price' => $param['shop_price'],
            'goods_weight' => $param['goods_weight'],
            'goods_unit' => $param['goods_unit'],
            'status' => $param['status'],
            'description' => htmlspecialchars($param['description']),
            'goods_type_id' => $param['goods_type_id'],
            'create_time' => time(),
        );

        //判断添加和修改
        if($action=='add'){
            $data['create_time'] = time();
            $id = model('goods')->allowField(true)->save($data);
            if($id){
                get_jsonData(200,'操作成功',array('id'=>$id));
            }
        }else if($action=='edit'){
            $data['update_time'] = time();
            $res = model('goods')->allowField(true)->where('id',$id)->update($data);
            if($res!==false){
                get_jsonData(200,'操作成功',array('id'=>$id));
            }
        }

        get_jsonData(0,'非法操作',array('token'=>request()->token()));
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
                    $path = ROOT_PATH . DS.$res['thumb'];
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