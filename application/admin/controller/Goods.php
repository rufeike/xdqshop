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
        $join = array(
            array('brand b','g.brand_id=b.id','left'),
            array('goods_type t','g.goods_type_id=t.id','left'),
            array('goods_stock s','g.id=s.goods_id','left'),
        );
        $info= db('goods')->alias('g')->join($join)->field('g.*,b.brand_name,t.type_name,SUM(s.stock_num) stock_num')->where(array('g.is_del'=>1))->group('g.id')->order('g.sort ASC,g.id DESC')->select();
        foreach($info as $k => $v) {
            if ($v['status'] == 1) {
                $info[$k]['status_text'] = '<span style="color:#999">已上架</span>';
            } else if($v['status']==2){
                $info[$k]['status_text'] = '<span style="color:#cccccc">已下架</span>';
            }else{
                $info[$k]['status_text'] = '<span style="color:#0000f1">待审核</span>';
            }

            if($v['stock_num']==''){
                $info[$k]['stock_num']=0;
            }

        }

        $this->assign('info',$info);
        return $this->fetch();
    }

    //回收站
    public function recycle(){
        $join = array(
            array('brand b','g.brand_id=b.id','left'),
            array('goods_type t','g.goods_type_id=t.id','left')
        );
        $info= db('goods')->alias('g')->join($join)->field('g.*,b.brand_name,t.type_name')->where('g.is_del',0)->order('g.sort ASC,g.id DESC')->select();
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

    //商品库存
    public function stock(){
        $param = request()->param();
        $id = isset($param['id'])?$param['id']:0;
        //获取商品的可选属性
        $_goods_attribute_detail = db('goods_attribute_detail')->field('gad.id,gad.goods_attribute_id,gad.value,ga.attr_name')->alias('gad')->join('goods_attribute ga','gad.goods_attribute_id=ga.id')->where(array('gad.goods_id'=>$id,'ga.attr_type'=>1))->select();
        //把结果重组为与属性名称为键的三维数组
        $goods_attribute_detail = array();
        if($_goods_attribute_detail){
            foreach($_goods_attribute_detail as $k => $v){
                $goods_attribute_detail[$v['attr_name']][]=$v;
            }
        }

        $this->assign('goods_attribute_detail',$goods_attribute_detail);

        $info= db('goods_stock')->where('goods_id',$id)->order('id ASC')->select();
        $this->assign('info',$info);
        $this->assign('goods_id',$id);
        return $this->fetch();
    }

    //商品库存保存
    public function stock_save(){
        $param = request()->param();
        check_token($param);//防止重复提交

        //提交数据验证
        $validate = Validate('goods_stock');
        $validate_res= $validate->check($param);
        if(!$validate_res){
            get_jsonData(0,$validate->getError(),array('token'=>request()->token()));
        }

        //重组数据
        $goods_id= isset($param['goods_id'])?$param['goods_id']:0;
        $stock_num_arr = isset($param['stock_num'])?$param['stock_num']:array();
        $attr_arr = isset($param['attr'])?$param['attr']:array();

        $insert_arr = array();
        foreach($stock_num_arr as $sk => $sv){
            if(trim($sv)==''){
                continue;
            }
            $tmp_arr = array();
            $tmp_arr['goods_id']=$goods_id;
            $tmp_arr['stock_num']=$sv;

            if($attr_arr){
                $attr_tmp_arr = array();
                foreach($attr_arr as $ak => $av){
                    if($av[$sk]==0){
                        continue 2;
                    }
                    $attr_tmp_arr[]=$av[$sk];
                }
                $tmp_arr['attr_str'] = implode(',',$attr_tmp_arr);
            }

            $insert_arr[] = $tmp_arr;
        }
        $insert_arr = array_unique($insert_arr, SORT_REGULAR);

        //删除原来的记录
        db('goods_stock')->where(array('goods_id'=>$goods_id))->delete();

        //插入新记录
        $rel = db('goods_stock')->insertAll($insert_arr);
        if($rel>0){
            get_jsonData(200,'操作成功');
        }else if($rel==0){
            get_jsonData(0,'请正确填写数据',array('token'=>request()->token()));
        }else{
            get_jsonData(0,'操作失败');
        }

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

        //获取该商品的属性详情
        $_goods_attribute_detail = db('goods_attribute_detail')->where(array('goods_id'=>$id))->select();
        $goods_attribute_detail = array();
        if($_goods_attribute_detail){
            foreach($_goods_attribute_detail as $gadk => $gadv){
                $goods_attribute_detail[$gadv['goods_attribute_id']][] = $gadv;
            }
        }
        $this->assign('goods_attribute_detail',$goods_attribute_detail);

        //获取商品对应属性
        $goods_attribute = db('goods_attribute')->where(array('goods_type_id'=>$info['goods_type_id']))->select();
        $this->assign('goods_attribute',$goods_attribute);

        //获取商品相册详情
        $goods_photo= db('goods_photo')->where('goods_id=?')->bind(array($id))->select();
        $this->assign('goods_photo',$goods_photo);

        return $this->fetch();
    }


    //保存信息
    public function save(){
        $param = request()->post();
        //dump($param);
        //die;

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
        );

        //判断添加和修改
        if($action=='add'){
            $data['create_time'] = time();
            $model = model('goods');
            $res = $model->allowField(true)->save($data);
            if($res){
                get_jsonData(200,'操作成功',array());
            }
        }else if($action=='edit'){
            $data['update_time'] = time();
            $data['or_thumb'] = $param['or_thumb'];
            $data['sm_thumb'] = $param['sm_thumb'];
            $data['mid_thumb'] = $param['mid_thumb'];
            $data['big_thumb'] = $param['big_thumb'];
            $data['update_time'] = time();
            $data['id']=$id;
            $model = model('goods');
            $res=$model->allowField(true)->update($data);
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

    //删除图片相册
    public function delete_photo(){
        $param = request()->post();
        $id = isset($param['id'])?$param['id']:0;
        $photo = db('goods_photo')->where(array('id'=>$id))->find();
        if(empty($photo)){
            get_jsonData(0,'图片不存在');
        }

        //删除图片
        @unlink(ROOT_PATH.$photo['or_thumb']);
        @unlink(ROOT_PATH.$photo['sm_thumb']);
        @unlink(ROOT_PATH.$photo['mid_thumb']);
        @unlink(ROOT_PATH.$photo['big_thumb']);
        //删除数据库记录
        $res = db('goods_photo')->delete($id);

        if($res){
            get_jsonData(200,'操作成功',array());
        }

        get_jsonData(0,'操作失败',array());
    }

    //删除商品属性
    public function delete_attr(){
        $param = request()->post();
        $id = isset($param['id'])?$param['id']:0;
        $goods_attribute_detail= db('goods_attribute_detail')->where(array('id'=>$id))->find();
        if(empty($goods_attribute_detail)){
            get_jsonData(0,'属性不存在');
        }

        //删除数据库记录
        $res = db('goods_attribute_detail')->delete($id);

        if($res){
            get_jsonData(200,'操作成功',array());
        }

        get_jsonData(0,'操作失败',array());
    }


}