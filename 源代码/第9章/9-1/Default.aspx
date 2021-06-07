<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>使用uploadify插件实现多文件上传</title>
        <link href="css/default.css" rel="stylesheet" type="text/css" />
<link href="css/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="scripts/swfobject.js"></script>
<script type="text/javascript" src="scripts/jquery.uploadify.v2.0.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#uploadify").uploadify({
            'uploader': 'scripts/uploadify.swf', //上传所需的flash文件
            'script': 'scripts/upload.ashx', //后台处理文件
            'cancelImg': 'cancel.png', //取消按钮的图片
            'buttonImg': 'images/select.gif',//按钮图片
            'folder': '/uploads', //上传文件夹
            'queueID': 'fileQueue',
            'queueSizeLimit': 4, //限制每次选择文件的个数
            'auto': false, //是否自动上传
            'multi': true, //是否多选
            'sizeLimit': 6291456, //上传文件限制的最大值
            'simUploadLimit': 1, //同时上传的文件个数
            'fileDesc': '图片文件', //文件类型的描述信息
            'fileExt': '*.jpg;*.png;*.bmp;*.gif', //设置文件类型
            'onQueueFull': function(event, queueSizeLimit) { alert("只允许上传" + queueSizeLimit + "个文件"); event.data.action(event, queueSizeLimit) = false; },
            'width':77,//按钮宽度
            'height':23,//按钮高度
            'wmode':'transparent'//设置按钮背景透明
        });
    });
    
    function checkDir() {
        var obj = document.getElementById("ddlDir");
        var selectStr = obj.options[obj.selectedIndex].value;
        if (selectStr == "无") {
            alert("请创建相册");
        }
        else {
            jQuery('#uploadify').uploadifySettings('folder', '/uploads/' + document.getElementById("ddlDir").options[document.getElementById("ddlDir").selectedIndex].value);
            jQuery('#uploadify').uploadifyUpload();
        }
    }
    function MM_preloadImages() { //v3.0
      var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
        var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
        if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
    }

    function MM_swapImgRestore() { //v3.0
      var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
    }

    function MM_findObj(n, d) { //v4.01
      var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
        d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
      if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
      for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
      if(!x && d.getElementById) x=d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
      var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
       if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
    }

</script>
    <style type="text/css">
        .style1
        {
            width: 95%;
            height: 27px;
        }
        .style12
        {}
        .style13
        {
            width: 74px;
        }
        .style14
        {
            width: 110px;
        }
        #uploadify
        {
            width: 81px;
        }
        .style15
        {
            width: 163px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
    <table width="704" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr> 
		<td colspan="5">
			<img id="_____01" src="images/图片上传_01.gif" width="704" height="113" alt="" /></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4">
			<img id="_____02" src="images/图片上传_02.gif" width="99" height="269" alt="" /></td>
		<td height="45" colspan="2" background="images/图片上传_03.gif">   
		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate> 
		<table width="541" height="30" border="0">
          <tr>
            <td class="style13">请选择相册：</td>
            <td class="style14">
                <asp:DropDownList ID="ddlDir" runat="server" Height="16px" 
                                Width="96px" class="文本域" >
                            </asp:DropDownList>
                            &nbsp;&nbsp; </td>
            <td class="style15"><asp:ImageButton ID="ImageButton3" 
                    runat="server" ImageUrl="images/llxc.gif" width="78" height="26" border="0" onmouseover="MM_swapImage('ImageButton3','','images/llxc01.gif',1)" onmouseout="MM_swapImgRestore()" onclick="ImageButton3_Click" />
                    &nbsp;
              </td>
              <td class="style12">
                  &nbsp;</td>
          </tr>
        </table>      </ContentTemplate>
            </asp:UpdatePanel>               </td>
		<td rowspan="6">
			<img id="_____04" src="images/图片上传_04.gif" width="64" height="409" alt="" /></td>
	</tr>
	<tr>
		<td height="33" valign="top" background="images/图片上传_05.gif">
                            <table cellpadding="0" cellspacing="0" class="style1" align="left">
                                <tr>
                                    <td class="style13" valign="bottom">
                                    <div  id="abc">
                            <input id="uploadify" name="uploadify" type="file" /></div></td>
                                    <td valign="bottom">
                                        <img src="images/开始上传.gif" width="77" height="23" onclick="checkDir()" style="cursor: hand"
 /><img src="images/取消上传.gif" width="77" height="23"  onclick="javascript:jQuery('#uploadify').uploadifyClearQueue()" style="cursor: hand"
/></td>
                                </tr>
                            </table>
        </td>
		<td rowspan="3">
			<img id="_____06" src="images/图片上传_06.gif" width="146" height="224" alt="" /></td>
	</tr>
	<tr>
		<td height="178" background="images/图片上传_07.gif" align="center" valign="middle">
                <table cellpadding="0" cellspacing="0" class="style1" align="center" 
                    valign="middle">
                    <tr>
                        <td align="left" valign="middle">
                <div id="fileQueue">
                </div>
                        </td>
                    </tr>
                </table>
            </td>
	</tr>
	<tr>
		<td>
			<img id="_____08" src="images/图片上传_08.gif" width="395" height="13" alt="" /></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img id="_____09" src="images/图片上传_09.gif" width="62" height="140" alt="" /></td>
		<td height="90" colspan="3" background="images/图片上传_10.gif">    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate><table width="578" height="90" border="0">
          <tr>
            <td width="40" align="left">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/lift.gif" width="27" height="38" border="0"  onmouseover="MM_swapImage('ImageButton2','','images/lift01.gif',1)" onmouseout="MM_swapImgRestore()"
                    onclick="ImageButton2_Click" Visible="False" />
              </td>
            <td>
                            <asp:DataList ID="DataList1" runat="server" Height="80px" 
                                HorizontalAlign="Center" RepeatDirection="Horizontal" RepeatLayout="Flow" 
                                ShowFooter="False" ShowHeader="False" style="margin-left: 0px" Width="501px">
                                <ItemTemplate>
                                    <a href='<%#DataBinder.Eval(Container.DataItem,"source")%>' target="_blank">
                                    <img alt="图片缩略图" border="0" height="80" 
                                        src='<%#DataBinder.Eval(Container.DataItem,"images")%>' width="80" /></a>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
            <td width="40" align="right">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/right.gif" width="28" height="38" border="0"  onmouseover="MM_swapImage('ImageButton1','','images/right01.gif',1)" onmouseout="MM_swapImgRestore()" 
                    onclick="ImageButton1_Click" Visible="False" />
              </td>
          </tr>
        </table></ContentTemplate>
    </asp:UpdatePanel></td>
	</tr>
	<tr>
		<td colspan="3">
			<img id="_____11" src="images/图片上传_11.gif" width="578" height="50" alt="" /></td>
	</tr>
	<tr>
		<td>
			<img src="images/分隔符.gif" width="62" height="1" alt="" /></td>
		<td>
			<img src="images/分隔符.gif" width="37" height="1" alt="" /></td>
		<td>
			<img src="images/分隔符.gif" width="395" height="1" alt="" /></td>
		<td>
			<img src="images/分隔符.gif" width="146" height="1" alt="" /></td>
		<td>
			<img src="images/分隔符.gif" width="64" height="1" alt="" /></td>
	</tr>
</table>


&nbsp;</form>
</body>
</html>
