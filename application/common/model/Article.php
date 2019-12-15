<?php
/**
 * Created by 文章模型类。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/15
 * Time: 0:18
 */

namespace app\common\model;
use think\Model;

class Article extends Model{
    public function getHelpArticles(){
        //获取帮助分类
        $helpCate=model('article_category')->where(array('pid'=>array('neq',1),'cate_type'=>2,'is_del'=>1,'status'=>1))->select();
        foreach($helpCate as $hk => $hv){
            $articles = $this->where(array('cate_id'=>$hv['id']))->field('id,title')->select();
            $helpCate[$hk]['articles'] = $articles;
        }

        return $helpCate;
    }

    public function getBottomArticles(){
        $articles = $this->where(array('cate_id'=>3,'is_del'=>1))->select();
        return $articles;
    }
}
