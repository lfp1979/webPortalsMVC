<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑文章</title>
<link rel="stylesheet" type="text/css" href="images/Style.css">
<script src="ckeditor/ckeditor.js"></script>
</head>
<body>
	
	<jsp:include page="top.jsp" />
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
												<td width="3"><img id="tabImgLeft__0" height="22" src=images/tab_active_left.gif" width="3" /></td>
												<td background=images/tab_active_bg.gif class="tab"><strong class="mtitle">文章编辑</strong></td>
												<td width="3"><img id="tabImgRight__0" height="22" src=images/tab_active_right.gif width="3" /></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
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
													<td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" valign="top" bgcolor="#fffcf7">
														<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#EBEBEB">
															<sf:form  method="post" modelAttribute="article" action="saveOrUpdateArticle.mvc">
																<sf:hidden  path="id" />
																<sf:hidden path="sortPath" />
																<tr bgcolor="#FFFFFF">
																	<td align="right">标题 <span class="red">*</span>
																	</td>
																	<td colspan="3"><sf:input path="title" size="50" maxlength="225" /> 
																	<sf:errors path="title" style="color:red" /></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">分类 <span class="red">*</span>
																	</td>
																	<td colspan="3"><sf:select items="${sorts}" path="clazz.id" itemValue="id" itemLabel="sortName" /></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">内容 <span class="red">*</span> <br> <sf:errors path="content" style="color:red" />
																	</td>
																	<td colspan="3"><sf:textarea path="content" id="content" /> <script>
																		CKEDITOR.replace('content');
																	</script></td>
																</tr>

																<tr bgcolor="#FFFFFF">
																	<td align="right">文章属性</td>
																	<td colspan="3"><sf:checkbox path="isPass" label="通过审核" /> 
																					<sf:checkbox id="IsPic" path="isPic" label=" 图片" onClick="javascript:ChkIsPic();" /> 
																					<sf:checkbox path="isMove" label=" 滚动" /> 
																					<sf:checkbox path="isPlay" label=" 首页轮播" /> 
																					<sf:checkbox path="isCommend" label=" 推荐" /> 
																					<sf:checkbox path="isTop" label=" 置顶" />
																	</td>
																</tr>
																<tr style="display: none;" id="DisIsPic" bgcolor="#FFFFFF">
																	<td align="right">&nbsp;图片地址<span class="red">*</span></td>
																	<td colspan="3"><sf:input path="picFile" size="50" maxlength="225" /></td>
																</tr>

																<tr bgcolor="#FFFFFF">

																	<td align="right">来源</td>
																	<td><sf:input path="comeFrom" size="50" maxlength="225" /></td>
																	<td align="right">作者</td>
																	<td><sf:input path="author" size="50" maxlength="225" /></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">添加时间</td>
																	<td><sf:input readonly="readonly" type="text" size="50" maxlength="225" path="addTime"/></td>
																	<td align="right">查看数</td>
																	<td><sf:input path="hits" size="50" maxlength="225" /><sf:errors path="hits"/></td>
																</tr>

																<tr bgcolor="#FFFFFF">
																	<td align="right">&nbsp;</td>
																	<td colspan="3"><input type="submit" name="Submit2" value="保 存" /> 
																	<input type="button" name="Submit" value="取 消" onclick="javascript:document.URL='Article_List.asp';" /></td>
																</tr>
															</sf:form>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
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
	<script language="JavaScript" type="text/javascript">
		function ChkIsPic() {
			obj = document.getElementById("DisIsPic");
			obj.style.display = obj.style.display == "none" ? "" : "none";
		}

		if (document.getElementById("IsPic").checked)
			document.getElementById("DisIsPic").style.display = "";
	</script>
</body>
</html>