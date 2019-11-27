<?php
/**
 * Created by 配置项验证器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 21:55
 */

namespace app\common\validate;
use think\Validate;

class Config extends Validate{
    protected $rule = [
        '__token__'=>'require',
        'ename'=>'require|unique:config',
        'cname'=>'require|unique:config',
        'form_type'=>'require',
    ];
    protected $message = [
        '__token__'=>'令牌不能為空',
        'ename.require'=>'英文名称不能為空',
        'ename.unique'=>'英文名称已存在',
        'cname.require'=>'中文名称不能為空',
        'cname.unique'=>'中文名称已存在',
        'form_type'=>'请选择表单类型',
    ];
}