<?php
/**
 * Created by 友情链接表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class Link extends Validate{
    protected $rule = [
		'__token__'=>'require',
		'link_name'=>'require',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
		'link_name'=>'链接名称不能為空',
	];
}