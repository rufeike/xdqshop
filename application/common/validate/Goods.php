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
        'goods_category_id'=>'require|between:1,1000',
        'goods_name'=>'require|unique:goods',
        'market_price'=>'require|number',
        'shop_price'=>'require|number',
        'goods_weight'=>'require|number',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
        'goods_category_id'=>'请选择商品分类',
		'goods_name.require'=>'商品名称不能為空',
        'goods_name.unique'=>'商品名称已存在',
        'market_price.require'=>'市场价格不能為空',
        'shop_price.require'=>'商品价格不能為空',
        'goods_weight.require'=>'商品重量不能為空',
	];
}