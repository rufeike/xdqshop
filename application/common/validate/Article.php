<?php
/**
 * Created by 文字表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class Article extends Validate{
    protected $rule = [
		'__token__'=>'require',
		'title'=>'require|unique:article',
        'content'=>'require',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
		'title.require'=>'标题不能為空',
        'title.unique'=>'标题已存在',
        'content'=>'内容不能为空',
	];
}