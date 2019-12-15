<?php
/**
 * Created by 前台公共类。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/10
 * Time: 20:20
 */
namespace app\index\controller;
use think\Controller;

class Base extends Controller{
    //初始方法
    public function _initialize(){
        $this->_getHelpArticles();//获取网站帮助类文章
        $this->_getWebArticles();//获取网站帮助类文章
        $this->_getTopNav();//获取头部网站导航
        $this->_getConfigInfo();//获取网站配置项
    }

    //空方法处理
    public function _empty(){
        $this->redirect(url('index/index'),302);
    }

    //获取帮助类文章
    private function _getHelpArticles(){
        $helpArticles = model('article')->getHelpArticles();
        $this->assign('helpArticles',$helpArticles);
    }
    //获取底部网站信息类文章
    private function _getWebArticles(){
        $webArticles = model('article')->getBottomArticles();
        $this->assign('webArticles',$webArticles);
    }

    //获取顶部导航
    private function _getTopNav(){
       $topNav = db('nav')->where(array('status'=>1))->order('sort ASC')->select();
       $this->assign('topNav',$topNav);
    }

    //获取配置项
    private function _getConfigInfo(){
        $configInfo= model('config')->getConfigInfo();
        $this->assign('configInfo',$configInfo);
    }
}
