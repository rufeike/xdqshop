<?php
/**
 * Created by 推荐位表验证器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/12/15
 * Time: 21:05
 */
namespace app\common\validate;
use think\Validate;

class Recommend extends Validate{
    protected $rule = [
        '__token__'=>'require',
        'rec_name'=>'require|unique:recommend',
    ];
    protected $message = [
        '__token__'=>'令牌不能為空',
        'rec_name.require'=>'推荐位名称不能為空',
        'rec_name.unique'=>'推荐位名称不能重复',
    ];

}