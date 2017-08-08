<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别管理</title>
<link rel="stylesheet" type="text/css" href="images/Style.css">
</head>
<body>

<jsp:include page="top.jsp"/>
<br />
<table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
  <tbody>
    <tr>
      <td style="PADDING-LEFT: 2px; HEIGHT: 22px" background="images/tab_top_bg.gif">
      <table cellspacing="0" cellpadding="0" width="477" border="0">
        <tbody>
          <tr>
            <td width="147"><table height="22" cellspacing="0" cellpadding="0" border="0">
              <tbody>
                <tr>
                  <td width="3"><img id="tabImgLeft__0" height="22" src="images/tab_active_left.gif" width="3" /></td>
                  <td class="mtitle" background="images/tab_active_bg.gif">分类管理</td>
                  <td width="3"><img id="tabImgRight__0" height="22" src="images/tab_active_right.gif" width="3" /></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td bgcolor="#ffffff"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="1" background="images/tab_bg.gif"><img height="1" src="images/tab_bg.gif" width="1" /></td>
            <td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" valign="top">
            <div id="tabContent__0" style="DISPLAY: block; VISIBILITY: visible">
              <table cellspacing="1" cellpadding="1" width="100%" align="center" bgcolor="#8ccebd" border="0">
                <tbody>
                  <tr>
                    <td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" valign="top" bgcolor="#fffcf7">当前位置：
                 <s:forEach items="${path}" var="p">
    				 &gt;&gt; <a href="${p.value}">${p.key}</a>    		
    			</s:forEach>
                <br /><br />
                <table border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC" width="100%">
                      <sf:form modelAttribute="clazz" action="saveOrUpdateClass.mvc" method="post" onsubmit="return chkform(this);">
                        <tr bgcolor="#FFFFFF">
                          <td colspan="7" bgcolor="#FFFFFF">
		                                	类别名称：<sf:input path="sortName" id="SortName" size="25" />
		                                	排序：<sf:input path="orderID" id="OrderID" value="0" size="4" maxlength="4"/>
		                                  	启用：<sf:checkbox path="isOpen"/>
		                     				<input name="Submit3" type="submit" class="bntStyle" value="添 加" 
		                      				${id==0?"disabled=disabled":""}/>
                          					<sf:hidden path="parent.id" value="${param.id}" />
                         
							</td>
                        </tr>
                      </sf:form>
                      <tr>  
               
                		<sf:errors path="orderID" style="color:red" />
              		  </tr>
                      <tr bgcolor="#EBEBEB">
                        <td align="center">所属分类</td>
                        <td align="center">分类ID</td>
                        <td align="center">栏目名称</td>
                        <td align="center">排序</td>
                        <td align="center">启用</td>
                        <td align="center">子栏目管理</td>
                        <td align="center">操作</td>
                      </tr>
                     <s:forEach items="${list}" var="c">
                      <sf:form modelAttribute="clazz"  action="saveOrUpdateClass.mvc" method="post" onsubmit="return chkform(this);">
                        <tr bgcolor="#FFFFFF">
                        
                          <td align="center">
                          ${c.parent.id==0?"顶级类别": c.parent.sortName}
                         </td>
                          <td align="center">
                          <sf:input path="id" value="${c.id}" size="8"  readonly="readonly" />
                          </td>
                          <td align="center">
                          <sf:input  path="sortName" value="${c.sortName}" size="25"/>
                          </td>
                           <td align="center">
                          <sf:input path="orderID" value="${c.orderID}" size="4"/>
                          </td>
                           <td align="center">
                          <sf:checkbox path="isOpen" value="${c.isOpen}"/>
                          </td>
                          <td align="center">
                          <s:url value="listClass.mvc" var="listChild">
                          	<s:param name="id" value="${c.id}"/>
                          </s:url>
                          <a href="${listChild}">&gt;&gt;&gt;</a>
                          <sf:hidden path="parent.id" value="${c.parent.id}"/>
                          </td>
                          <td align="center">
                          	  <input name="Submit" type="submit" class="bntStyle" value="修 改" />
                              <input <s:if test="${c.parent.id==0}">disabled="disabled"</s:if> 
                              name="Submit2" type="submit" class="bntStyle" value="删 除" 
                              onclick="if(confirm('真的要删除吗？')){this.form.action='delClass.mvc';}else{return false;}"/>
                          		
                         </td>
                        </tr>
                      </sf:form>
                     </s:forEach>
          
                      <s:if test="${empty list}">
                      <tr bgcolor="#FFFFFF">
                        <td colspan="7" align="center">暂无栏目，请先添加</td>
                      </tr>
                      </s:if>
                    </table></td>
                  </tr>
                </tbody>
              </table>
            </div></td>
            <td width="1" background="images/tab_bg.gif"><img height="1" src="images/tab_bg.gif" width="1" /></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td background="images/tab_bg.gif" bgcolor="#ffffff"><img height="1" src="images/tab_bg.gif" width="1" /></td>
    </tr>
  </tbody>
</table>
<script language="javascript">
function chkform(frm)
{
	if(frm.SortName.value=="")
	{
		alert("请输入分类名称")
		frm.SortName.focus();
		return false;
	}
}
</script>

</html>