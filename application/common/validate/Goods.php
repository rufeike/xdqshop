<?php
/**
 * Created by 商品表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class Goods extends Validate{
    protected $rule = [
		'__token__'=>'require',
        'goods_category_id'=>'require|between:1,1000',
		'goods_name'=>'require|unique:goods',
        //'content'=>'require',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
        'goods_category_id'=>'请选择商品分类',
		'goods_name.require'=>'商品名称不能為空',
        'goods_name.unique'=>'商品名称已存在',
        //'content'=>'商品描述内容不能为空',
	];
}