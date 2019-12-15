<?php
/**
 * Created by 文章分类模块。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/15
 * Time: 1:20
 */
namespace app\index\controller;
use rufeike\Catetree;

class ArticleCategory extends Base{
    protected $cateTree = null;
    public function _initialize(){
        parent::_initialize();
        $this->getArticleCategory();
    }

    public function index(){
        $param = request()->param();
        $cateTree = $this->cateTree;
        $pid = isset($param['cate_id'])?(int)$param['cate_id']:0;
        $cate_ids = $cateTree->getChildrenIds($pid);//获取所有子cate_id;
        $pids = $cateTree->getParentsId($pid);//获取父级cate_id
        if($pid==0){
            $articles = db('article')->where(array('is_del'=>1))->paginate(5);
            $breadcrumb[] = array('cate_name'=>'所有文章','id'=>0);
        }else{
            if($pids){
                $breadcrumb = db('article_category')->where(array('id'=>array('in',$pids)))->select();
            }
            $cate_ids[] = $pid;
            $map =[
                'is_del'=>1,
                'cate_id'=>['in',$cate_ids],
            ];
            $articles = db('article')->where($map)->paginate(5);
        }
        $this->assign('cate_id',$pid);
        $this->assign('articles',$articles);
        $this->assign('breadcrumb',$breadcrumb);
        return $this->fetch();
    }

    //获取文字分类栏目信息
    public function getArticleCategory(){
        $articleCategory = db('article_category')->where(array('is_del'=>1,'status'=>1))->select();
        $cateTree = new Catetree($articleCategory);
        $this->cateTree = $cateTree;
        $cate = $cateTree->getSubTree(0);
        $this->assign('cate',$cate);
    }


}
