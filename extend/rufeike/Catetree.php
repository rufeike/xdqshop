<?php
/**
 * Created by 无限分类操作类。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 23:12
 */

namespace rufeike;

class Catetree{
    private $key;
    private $parentKey;
    private $cate;

    public function __construct($cate=array(),$key='id',$parentKey='pid'){
        $this->key = $key;
        $this->parentKey = $parentKey;
        $this->cate = $cate;
    }

    /**
     * 增加等级标识
     * @param int $pid
     * @param int $level
     * @return mixed
     */
    private function _toLayer($pid=0,$level=0){
        static $arr = array();
        $cate = $this->cate;
        foreach($cate as $k => $v){
            //判断下标是否存在
            if(!isset($v[$this->parentKey])||!isset($v[$this->key])){
                return false;
            }

            if($v[$this->parentKey] == $pid){
                $v['level'] = $level;
                $arr[] = $v;
                $this->_toLayer($v[$this->key],$level+1);
            }
        }

        return $arr;
    }

    /**
     * 对查询数组进行分级归类
     * @param null $cate
     * @param int $pid
     * @return array
     */
    private function _getSubTree($cate=null,$pid = 0){
        if($cate==null){
            $cate = $this->cate;
        }
        $tree = array();
        foreach ($cate as $k => $v) {
            //判断下标是否存在
            if(!isset($v[$this->parentKey])||!isset($v[$this->key])){
                return false;
            }

            if ($v[$this->parentKey] == $pid) {
                unset($cate[$k]);
                if (!empty($cate)) {
                    $children = $this->_getSubTree($cate, $v[$this->key]);
                    if (!empty($children)) {
                        $v["_child"] = $children;
                    }
                }
                $tree[] = $v;
            }
        }
        return $tree;
    }



    /**
     * 根据指定的ID获取所有父级ID集合
     * @param int $pid
     * @return array
     */
    private function _getParentsId($pid=0){
        $cate = $this->cate;

        $arr=array();
        foreach($cate as $k => $v){
            //判断下标是否存在
            if(!isset($v[$this->parentKey])||!isset($v[$this->key])){
                return false;
            }

            if($v[$this->key]==$pid){
                $arr[]=$v[$this->key];
                $arr=array_merge($arr,$this->_getParentsId($v[$this->parentKey]));
            }
        }
        return $arr;
    }

    /**
     * 对数据进行处理
     * @param $id
     * @return array
     */
    private function _getChildrenIds($id){
        static $arr = array();
        $cate = $this->cate;
        foreach($cate as $k => $v){
            //判断下标是否存在
            if(!isset($v[$this->parentKey])||!isset($v[$this->key])){
                return false;
            }

            if($v[$this->parentKey]==$id){
                $arr[] = $v[$this->key];
                $this->_getChildrenIds($v[$this->key]);
            }
        }
        return $arr;
    }

    /**
     * 获取带等级标识的数据
     * @param int $pid
     * @param int $level
     * @return mixed
     */
    public function getTree($pid=0,$level=0){
        return $this->_toLayer($pid,$level);
    }

    /**
     * 根据指定的ID 获取其所有父级ID集合
     * @param $pid
     * @return array
     */
    public function getParentsId($pid){
        return $this->_getParentsId($pid);
    }

    /**
     * 指定ID获取其所有子级的ID集合
     * @param $id
     * @return array
     */
    public function getChildrenIds($id){
        return $this->_getChildrenIds($id);
    }


    /**
     * 指定ID获取其下级
     * @param $pid
     * @return array
     */
    public function getSubTree($pid){
        return $this->_getSubTree(null,$pid);
    }
}
