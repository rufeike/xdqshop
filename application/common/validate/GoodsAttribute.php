<?php
/**
 * Created by 商品属性表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class GoodsAttribute extends Validate{
    protected $rule = [
		'__token__'=>'require',
        'goods_type_id'=>'require|gt:0',
		'attr_name'=>'require',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
		'attr_name'=>'属性名称不能為空',
        'goods_type_id'=>'请选择商品类型',
	];
}