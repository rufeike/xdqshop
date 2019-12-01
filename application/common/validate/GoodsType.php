<?php
/**
 * Created by 商品类型表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class GoodsType extends Validate{
    protected $rule = [
		'__token__'=>'require',
		'type_name'=>'require|unique:goods_type',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
		'type_name.require'=>'商品类型不能為空',
        'type_name.unique'=>'商品类型已存在',
	];
}