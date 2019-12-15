<?php
/**
 * Created by 导航表验证器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/15
 * Time: 21:05
 */
namespace app\common\validate;
use think\Validate;

class Nav extends Validate{
    protected $rule = [
        '__token__'=>'require',
        'nav_name'=>'require|unique:nav',
        'nav_url'=>'require',
    ];
    protected $message = [
        '__token__'=>'令牌不能為空',
        'nav_name.require'=>'导航名称不能為空',
        'nav_name.unique'=>'导航名称不能重复',
        'nav_url.require'=>'导航地址不能為空',
    ];

}