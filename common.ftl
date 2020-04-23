<#compress>
    <#setting number_format="#.###">
    <#--<#assign ctx = pageContext.request.contextPath>-->
    <#assign js_version = "1.0">
    <link href="${ctx}/static/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/static/third-party/webuploader/webuploader.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/common/css/style.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/common/css/correct.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/common/css/correct-wdd.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/layui/css/layui.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/approval.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/component.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/main.src.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/reset.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/iconfont.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/report.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/xy_css/page.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/layui/css/layui.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/common/css/select2.css"  >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/fselect.css"  />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/common/css/datepicker.min.css" >
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/common/css/fixed-table.css" >
    <script type="text/javascript" src="${ctx}/static/assets/global/plugins/jquery.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="${ctx}/static/assets/layui/layui.js" ></script>
<#--    <script type="text/javascript" src="${ctx}/static/assets/layui/layui.all.js" ></script>-->
    <script type="text/javascript" src="${ctx}/static/assets/common/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/common.js?v=2121111"></script>

    <script type="text/javascript" src="${ctx}/static/assets/common/validate.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/fselect.js?v=1"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/select2.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/select2.me.js?v=1333222"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/language/zh-cn.js"></script>
    <script type="text/javascript" src="${ctx}/static/third-party/webuploader/webuploader.js"></script>
    <#--JS JavaScript 日期处理类库-->
    <script type="text/javascript" src="${ctx}/static/resource/lib/moment.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/base64.js?v=11"></script>

    <script type="text/javascript" src="${ctx}/static/assets/common/fixed-table.js"></script>
    <script type="text/javascript" src="${ctx}/static/assets/common/main.js?v=121"></script>
    <#--<script type="text/javascript" src="${ctx}/static/assets/common/jquery.form.js?v=11"></script>-->
    <script type="text/javascript" src="${ctx}/static/assets/common/jquery.form.min.js?v=11"></script>

<#--    <script src="js/datepicker.js"></script>-->
<#--    <script src="js/datepicker.js"></script>-->
<#--    <script src="js/datepicker.en.js"></script>-->

    <script>
    // var ss= "\u5927\u58F0\u9053";
    // alert(decodeUnicode(ss))
    var gl_language="en";
    var gl_userid = "";
    var gl_username = "";
    var gl_supplier_id='';
    var gl_common_pageii=100001;
    var gl_js_version="1.0";
    var gl_po_price_yes_or_no = true; //采购订单价格是否显示标准
    var gl_preview_pdf_url = "/files/download_pdf?id=11266&fileName=2018012500001.pdf";

    var gl_userMenuButton=[];
    getUserMenuButton();
    //获得当前用户菜单使用的按钮
    function getUserMenuButton() {
        $.ajax({
            type:"POST", //请求方式
            url:"/task/getUserMenuButton", //请求路径
            success:function(data){
                gl_userMenuButton = data;
            }
        });
    }

    $.ajax({
        type:"get", //请求方式
        async:true,
        url:"/getJtSrmLanguage", //请求路径
        success:function(data) {
            if (data==2||data=='2'){
                gl_language = 'en';
                $.getScript("${ctx}/static/assets/easyui/locale/easyui-lang-en.js");
                <#--loadJs("yy","${ctx}/static/assets/easyui/locale/easyui-lang-en.js",null);-->
            }else{
                gl_language = 'en'
                $.getScript("${ctx}/static/assets/easyui/locale/easyui-lang-en.js");
                <#--loadJs("yy","${ctx}/static/assets/easyui/locale/easyui-lang-zh_CN.js",null);-->
            }
        }
    });

    function loadJs(sid,jsurl,callback) {
        var nodeHead = document.getElementsByTagName('head')[0];
        var nodeScript = null;
        if (document.getElementById(sid) == null) {
            nodeScript = document.createElement('script');
            nodeScript.setAttribute('type', 'text/javascript');
            nodeScript.setAttribute('src', jsurl);
            nodeScript.setAttribute('id', sid);
            if (callback != null) {
                nodeScript.onload = nodeScript.onreadystatechange = function () {
                    if (nodeScript.ready) {
                        return false;
                    }
                    if (!nodeScript.readyState || nodeScript.readyState == "loaded" || nodeScript.readyState == 'complete') {
                        nodeScript.ready = true;
                        callback();
                    }
                };
            }
            nodeHead.appendChild(nodeScript);
        } else {
            if (callback != null) {
                callback();
            }
        }
    }
    $(document).keyup(function(event){
        if(event.keyCode ==13){

            $(".input-group-btn a").click();
            $("#search").click();
        }
    });


    function init_dataGride(tb_obj, options) {
        var defaults  = {
            title: '',

            iconCls: 'icon-list',
            fit:true,
            fitColumns: false,
            // url: '',
            method:'get',
            singleSelect: true,
            pagination: true,
            idField: 'id',
            autoHeight: true,
            loadMsg: "数据加载中......",
            rownumbers: true,
            nowrap: true,
            remoteSort: true,
            striped: true,
            page: 1,
            pageSize: 10,
            queryParams: {
                page: 1,
                rows: 10
            }
        };

        var settings = jQuery.extend(true, {}, defaults, options);

        $(tb_obj).datagrid(settings);
    }

</script>


</#compress>