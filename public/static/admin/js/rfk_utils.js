/**
 * 地址跳转
 * @param url
 */
function jump(url){
    window.location.href = url;
}

/**
 * 指定接口地址，根据id和数据表进行恢复数据
 * @param url
 * @param id
 * @param model
 */
function recoverById(url,id,model){
    layer.confirm('确定恢复该数据吗', {
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
            }else if(json.code==0){
                layer.alert(json.msg,{icon:2});
            }else{
                console.log(r);
            }
        })
    });
}

/**
 * 指定接口地址，根据id和数据表进行删除数据
 * @param url
 * @param id
 * @param model
 */
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
            }else if(json.code==0){
                layer.alert(json.msg,{icon:2});
            }else{
                console.log(r);
            }
        })
    });
}

/**
 * 指定接口地址，根据id和数据表进行彻底删除数据
 * @param url
 * @param id
 * @param model
 */
function deleteByIdForever(url,id,model){
    layer.confirm('确定彻底删除吗,删除后数据将不可恢复！', {
        icon: 9,
        title:'提示'
    }, function(index){
        layer.closeAll();
        $.post(url,{id:id,model:model},function(r){
            var json = $.parseJSON(r);
            if(json.code==200){
                layer.msg('操作成功',{icon:1,time:3000},function(){
                    window.location.reload();
                })
            }else if(json.code==0){
                layer.alert(json.msg,{icon:2});
            }else{
                console.log(r);
            }
        })
    });
}

function ajaxSort(url,id,obj,model){
    var number = obj.val();
    $.post(url,{number:number,id:id,model:model},function(r){
        var json = $.parseJSON(r);
        if(json.code==200){
            layer.msg(json.msg,{icon:1,time:1000});
        }else{
            layer.msg(json.msg,{icon:2,time:5000});
        }
    })
}

(function(){
    var oLanguage={
        "oAria": {
            "sSortAscending": ": 升序排列",
            "sSortDescending": ": 降序排列"
        },
        "oPaginate": {
            "sFirst": "首页",
            "sLast": "末页",
            "sNext": "下一页",
            "sPrevious": "上一页"
        },
        "sEmptyTable": "没有相关记录",
        "sInfo": "第 _START_ 到 _END_ 条记录，共 _TOTAL_ 条",
        "sInfoEmpty": "第 0 到 0 条记录，共 0 条",
        "sInfoFiltered": "(从 _MAX_ 条记录中检索)",
        "sInfoPostFix": "",
        "sDecimal": "",
        "sThousands": ",",
        "sLengthMenu": "每页显示条数: _MENU_",
        "sLoadingRecords": "正在载入...",
        "sProcessing": "正在载入...",
        "sSearch": "搜索:",
        "sSearchPlaceholder": "",
        "sUrl": "",
        "sZeroRecords": "没有相关记录"
    }
    $.fn.dataTable.defaults.oLanguage=oLanguage;
    //$.extend($.fn.dataTable.defaults.oLanguage,oLanguage)
})();
