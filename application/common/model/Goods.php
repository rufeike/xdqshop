<?php
/**
 * Created by 商品模型类。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 15:45
 */
namespace app\common\model;
use think\Model;
use \think\Image;

class Goods extends Model{
    //自动过滤掉不存在的字段
    protected static  function init(){
        //数据插入前进行图片上传处理
        Goods::beforeInsert(function ($goods) {
            if(isset($_FILES['file'])&&$_FILES['file']){
                $basePath = ROOT_PATH.'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");
                $relativePath = 'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");
                $or_thumb = $goods->upload('file');
                $sm_thumb = 'sm_'.$or_thumb;
                $mid_thumb = 'mid_'.$or_thumb;
                $big_thumb = 'big_'.$or_thumb;
                $image = Image::open($basePath.DS.$or_thumb);
                $image->thumb(800, 800)->save($basePath.DS.$big_thumb);
                $image->thumb(400, 400)->save($basePath.DS.$mid_thumb);
                $image->thumb(150, 150)->save($basePath.DS.$sm_thumb);

                $goods->or_thumb = $relativePath.DS.$or_thumb;
                $goods->sm_thumb = $relativePath.DS.$sm_thumb;
                $goods->mid_thumb = $relativePath.DS.$mid_thumb;
                $goods->big_thumb = $relativePath.DS.$big_thumb;

            }

            $goods->goods_num = time().rand(10000,99999);
        });

        //数据插入后进行会员价格、商品属性以及图片相册上传处理
        Goods::afterInsert(function ($goods) {
            //添加会员价格
            $goods_id = $goods->id;
            $param = request()->post();
            foreach($param['member_price'] as $mpk =>$mpv){
                if(trim($mpv)!=''){
                    $priceArr = array();
                    $priceArr['goods_id'] = $goods_id;
                    $priceArr['member_level_id'] = $mpk;
                    $priceArr['member_price'] = floatval($mpv);
                    $price_rel = db('member_price')->insert($priceArr);
                }
            }

            //添加商品属性
            $goods_type_id = isset($param['goods_type_id'])?$param['goods_type_id']:0;
            if($goods_type_id>0){
                $insert_arr = array();
                $only = isset($param['only'])?$param['only']:array();
                $radio = isset($param['radio'])?$param['radio']:array();
                $balance = isset($param['balance'])?$param['balance']:array();
                //单选属性处理
                if($radio){
                    $tmparr = array();
                    foreach($radio as $rk => $rv) {
                        foreach($rv as $rkk => $rvv){
                            //忽略无效数据
                            if(trim($rvv)==''||trim($balance[$rk][$rkk])==''){
                                continue;
                            }
                            $tmparr['goods_attribute_id'] = $rk;
                            $tmparr['value'] = trim($rvv);
                            $tmparr['balance'] = (float)$balance[$rk][$rkk];
                            $tmparr['goods_id'] = $goods_id;
                            $insert_arr[] = $tmparr;
                        }
                    }
                }

                //唯一属性处理
                if($only){
                    foreach($only as $ok => $ov){
                        foreach($ov as $okk => $ovv){
                            //忽略无效数据
                            if(trim($ovv=='')){
                                continue;
                            }
                            $tmparr = array();
                            $tmparr['goods_attribute_id'] = $ok;
                            $tmparr['value'] = $ovv;
                            $tmparr['balance']=0;
                            $tmparr['goods_id'] = $goods_id;
                            $insert_arr[] = $tmparr;
                        }
                    }
                }

                if(!empty($insert_arr)){
                    $attr_rel = db('goods_attribute_detail')->insertAll($insert_arr);
                }
            }

            //添加商品相册数据处理
            if(isset($_FILES['files'])&&$_FILES['files']){
                // 获取表单上传文件
                $files = request()->file('files');
                foreach($files as $file){
                    $basePath = ROOT_PATH.'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");
                    $relativePath = 'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");

                    // 移动到框架应用根目录/public/uploads/ 目录下
                    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'goods');
                    if($info){
                        // 输出 42a79759f284b767dfcb2a0197904287.jpg
                        $or_thumb =  $info->getFilename();
                        $sm_thumb = 'sm_'.$or_thumb;
                        $mid_thumb = 'mid_'.$or_thumb;
                        $big_thumb = 'big_'.$or_thumb;
                        $image = Image::open($basePath.DS.$or_thumb);
                        $image->thumb(800, 800)->save($basePath.DS.$big_thumb);
                        $image->thumb(400, 400)->save($basePath.DS.$mid_thumb);
                        $image->thumb(150, 150)->save($basePath.DS.$sm_thumb);

                        $photoArr = array();
                        $photoArr['or_thumb'] = $relativePath.DS.$or_thumb;//原图
                        $photoArr['sm_thumb'] = $relativePath.DS.$sm_thumb;//小图
                        $photoArr['mid_thumb'] = $relativePath.DS.$mid_thumb;//中图
                        $photoArr['big_thumb'] = $relativePath.DS.$big_thumb;//大图
                        $photoArr['goods_id'] =  $goods->id;//商品ID
                        $photo_rel = db('goods_photo')->insert($photoArr);

                    }else{
                        // 上传失败获取错误信息
                        get_jsonData(0,$file->getError());
                    }
                }

            }

        });

        //更新之前
        Goods::beforeUpdate(function($goods){
            if(isset($_FILES['file'])&&$_FILES['file']){
                //新上传图片，则删除旧图片
                //删除旧图
                @unlink(ROOT_PATH.$goods->or_thumb);
                @unlink(ROOT_PATH.$goods->sm_thumb);
                @unlink(ROOT_PATH.$goods->mid_thumb);
                @unlink(ROOT_PATH.$goods->big_thumb);

                $basePath = ROOT_PATH.'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");
                $relativePath = 'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");
                $or_thumb = $goods->upload('file');
                $sm_thumb = 'sm_'.$or_thumb;
                $mid_thumb = 'mid_'.$or_thumb;
                $big_thumb = 'big_'.$or_thumb;
                $image = Image::open($basePath.DS.$or_thumb);
                $image->thumb(800, 800)->save($basePath.DS.$big_thumb);
                $image->thumb(400, 400)->save($basePath.DS.$mid_thumb);
                $image->thumb(150, 150)->save($basePath.DS.$sm_thumb);

                $goods->or_thumb = $relativePath.DS.$or_thumb;
                $goods->sm_thumb = $relativePath.DS.$sm_thumb;
                $goods->mid_thumb = $relativePath.DS.$mid_thumb;
                $goods->big_thumb = $relativePath.DS.$big_thumb;
            }

            //添加会员价格
            $goods_id = $goods->id;
            $param = request()->post();
            //删除原来表中的会员价格
            db('member_price')->where(array('goods_id'=>$goods_id))->delete();

            foreach($param['member_price'] as $mpk =>$mpv){
                if(trim($mpv)!=''){
                    $priceArr = array();
                    $priceArr['goods_id'] = $goods_id;
                    $priceArr['member_level_id'] = $mpk;
                    $priceArr['member_price'] = floatval($mpv);
                    $price_rel = db('member_price')->insert($priceArr);
                }
            }

            //添加商品属性
            $goods_type_id = isset($param['goods_type_id'])?$param['goods_type_id']:0;
            if($goods_type_id>0){
                $insert_arr = array();
                $only = isset($param['only'])?$param['only']:array();
                $radio = isset($param['radio'])?$param['radio']:array();
                $balance = isset($param['balance'])?$param['balance']:array();
                //单选属性处理
                if($radio){
                    $tmparr = array();
                    foreach($radio as $rk => $rv) {
                        foreach($rv as $rkk => $rvv){
                            //忽略无效数据
                            if(trim($rvv)==''||trim($balance[$rk][$rkk])==''){
                                continue;
                            }
                            $tmparr['goods_attribute_id'] = $rk;
                            $tmparr['value'] = trim($rvv);
                            $tmparr['balance'] = (float)$balance[$rk][$rkk];
                            $tmparr['goods_id'] = $goods_id;
                            $insert_arr[] = $tmparr;
                        }
                    }
                }

                //唯一属性处理
                if($only){
                    foreach($only as $ok => $ov){
                        foreach($ov as $okk => $ovv){
                            //忽略无效数据
                            if(trim($ovv=='')){
                                continue;
                            }
                            $tmparr = array();
                            $tmparr['goods_attribute_id'] = $ok;
                            $tmparr['value'] = $ovv;
                            $tmparr['balance']=0;
                            $tmparr['goods_id'] = $goods_id;
                            $insert_arr[] = $tmparr;
                        }
                    }
                }

                if(!empty($insert_arr)){
                    $attr_rel = db('goods_attribute_detail')->insertAll($insert_arr);
                }
            }


            //添加商品相册数据处理
            if(isset($_FILES['files'])&&$_FILES['files']){
                // 获取表单上传文件
                $files = request()->file('files');
                foreach($files as $file){
                    $basePath = ROOT_PATH.'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");
                    $relativePath = 'public'.DS.'uploads'.DS.'goods'.DS.date("Ymd");

                    // 移动到框架应用根目录/public/uploads/ 目录下
                    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'goods');
                    if($info){
                        // 输出 42a79759f284b767dfcb2a0197904287.jpg
                        $or_thumb =  $info->getFilename();
                        $sm_thumb = 'sm_'.$or_thumb;
                        $mid_thumb = 'mid_'.$or_thumb;
                        $big_thumb = 'big_'.$or_thumb;
                        $image = Image::open($basePath.DS.$or_thumb);
                        $image->thumb(800, 800)->save($basePath.DS.$big_thumb);
                        $image->thumb(400, 400)->save($basePath.DS.$mid_thumb);
                        $image->thumb(150, 150)->save($basePath.DS.$sm_thumb);

                        $photoArr = array();
                        $photoArr['or_thumb'] = $relativePath.DS.$or_thumb;//原图
                        $photoArr['sm_thumb'] = $relativePath.DS.$sm_thumb;//小图
                        $photoArr['mid_thumb'] = $relativePath.DS.$mid_thumb;//中图
                        $photoArr['big_thumb'] = $relativePath.DS.$big_thumb;//大图
                        $photoArr['goods_id'] =  $goods->id;//商品ID
                        $photo_rel = db('goods_photo')->insert($photoArr);

                    }else{
                        // 上传失败获取错误信息
                        get_jsonData(0,$file->getError());
                    }
                }

            }

        });

    }

    public function upload($fileName){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($fileName);
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'goods');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                //echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                //echo $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                return  $info->getFilename();
            }else{
                // 上传失败获取错误信息
                get_jsonData(0,$file->getError());
            }
        }
    }
}