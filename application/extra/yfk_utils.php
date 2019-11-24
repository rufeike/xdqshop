<?php
/**
 * Created by 自定义函数库。
 * user: rufeike
 * email: rufeike@163.com
 * Date：2019/11/24
 * Time: 14:20
 */

/*
* 返回json格式数据
* @param int 編碼
* @param string 返回信息
* @param array 返回數組
*/
function get_jsonData($code,$msg,$result=array()){
    $data = array(
        'code'=>$code,
        'msg' =>$msg,
        'result'=>$result,
    );
    echo json_encode($data);
    exit();
}

//檢驗token
function check_token($param){
    $rule= [
        '__token__' => 'require|token',     //在需要表单token的地方加入令牌验证
    ];
    $validate=new \think\Validate($rule);
    // var_dump($validate->check($param));exit;
    if(!$validate->check($param)){
        $result['token'] = request()->token();
        get_jsonData('101','请勿重复提交',$result);
    }
}