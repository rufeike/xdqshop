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

class Article extends Validate{
    protected $rule = [
		'__token__'=>'require',
        'cate_id'=>'require|between:1,1000',
		'goods_name'=>'require|unique:article',
        'content'=>'require',
    ];
	protected $message = [
		'__token__'=>'令牌不能為空',
        'cate_id'=>'请选择文章分类',
		'goods_name.require'=>'商品名称不能為空',
        'goods_name.unique'=>'商品名称已存在',
        'content'=>'内容不能为空',
	];
}