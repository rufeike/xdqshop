<?php
/**
 * Created by 会员级别表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class MemberLevel extends Validate{
    protected $rule = [
		'__token__'=>'require',
		'level_name'=>'require|unique:member_level',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
		'level_name.require'=>'级别名称不能為空',
        'level_name.unique'=>'级别名称已存在',
	];
}