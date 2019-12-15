<?php
/**
 * Created by 配置项表模型。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/15
 * Time: 22:03
 */
namespace app\common\model;
use think\Model;

class Config extends Model{
    public function getConfigInfo(){
        $config = $this->where(array('is_del'=>1,'status'=>1))->select();
        $configInfo = array();
        foreach($config as $k => $v){
            $configInfo[$v['ename']] = $v['value'];
        }

        return $configInfo;
    }
}
