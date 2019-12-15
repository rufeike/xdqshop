<?php
/**
 * Created by 文章模块。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/15
 * Time: 1:20
 */
namespace app\index\controller;

class Article extends ArticleCategory{
    public function index(){
        $param = request()->param();
        $id = isset($param['id'])?(int)$param['id']:0;
        //获取文章内容
        $article = db('article')->where(array('id'=>$id))->find();
        if(!$article){
            $this->redirect(url('article_category/index'));
        }


        $pid = $article['cate_id'];
        $cateTree = $this->cateTree;
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
        $this->assign('article',$article);
        return $this->fetch();
    }

    
}
