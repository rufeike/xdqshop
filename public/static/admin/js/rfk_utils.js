/**
 * 地址跳转
 * @param url
 */
function jump(url){
    window.location.href = url;
}


function deleteById(url,id,model){
    layer.confirm('确定删除吗', {
        icon: 3,
        title:'提示'
    }, function(index){
        layer.closeAll();
        $.post(url,{id:id,model:model},function(r){
            var json = $.parseJSON(r);
            if(json.code==200){
                layer.msg('操作成功',{icon:1,time:3000},function(){
                    window.location.reload();
                })
            }else{
                console.log(r);
            }
        })
    });

}
