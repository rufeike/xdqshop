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

    protected static  function init(){
        //数据插入前进行图片上传处理
        Goods::event('before_insert', function ($goods) {
            if($_FILES){
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