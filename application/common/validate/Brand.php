<?php
/**
 * Created by 商品品牌表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class Brand extends Validate{
    protected $rule = [
		'__token__'=>'require',
		'brand_name'=>'require',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
		'brand_name'=>'品牌名称不能為空',
	];
}