<?php
/**
 * Created by 商品分类验证器。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 21:55
 */

namespace app\common\validate;
use think\Validate;

class GoodsCategory extends Validate{
    protected $rule = [
        '__token__'=>'require',
        'cate_name'=>'require|unique:goods_category',
    ];
    protected $message = [
        '__token__'=>'令牌不能為空',
        'cate_name.require'=>'分类名称不能為空',
        'cate_name.unique'=>'分类名称已存在',
    ];
}