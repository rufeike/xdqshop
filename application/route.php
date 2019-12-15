<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
//Route::rule('cate/:cate_id','index/article_category/index','GET|POST',['ext' =>'html|htm'],['cate_id'=>'\d{1,3}']);
Route::rule([
    'cate/:cate_id'  =>  'index/article_category/index',
    'article/:id' =>  ['index/article/index',['ext'=>'html'],['id'=>'\d{1,3}']],
],'','GET',['ext'=>'html'],['id'=>'\d+']);
/*return [
//    '__pattern__' => [
//        'name' => '\w+',
//    ],
//    '[hello]'     => [
//        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
//        ':name' => ['index/hello', ['method' => 'post']],
//    ],
//    'cate/:id' => ['index/atricle_category/index',['method'=>'get'],['id'=>'\d{1,3}']],
];
*/
