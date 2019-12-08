<?php
/**
 * Created by 商品库存表验证。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/23
 * Time: 23:49
 */

namespace app\common\validate;
use think\Validate;

class GoodsStock extends Validate{
    protected $rule = [
		'__token__'=>'require',
        'goods_id'=>'require|between:1,1000',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
        'goods_id.require'=>'商品ID不能为空',
	];
}