<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*,com.yxq.actionform.UserForm" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
  <head>
      <meta charset="utf-8">
    <title>�鿴����</title>
      <script>
          function up() {
              var h="needLogin/deleteRoot.do?method=mcon&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}";
              var con=document.getElementById("con").value;
              h+="&bbscon=";
              h = h+con;
              var tit=document.getElementById("tit").value;
              h+="&bbstit=";
              h = h+tit;
              document.getElementById("a").setAttribute("href",encodeURI(h));
          }
          function up1() {
              var h="needLogin/deleteRoot.do?method=mcon&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}";
              var con=document.getElementById("con").value;
              h+="&bbscon=";
              h = h+con;
              var tit=document.getElementById("tit").value;
              h+="&bbstit=";
              h = h+tit;
              document.getElementById("a").setAttribute("href",encodeURI(h));
          }
      </script>
  </head>
  <body>
    <center>
      <!-- ****************��ʾ������Ϣ**************** -->
      <html:link linkName="top"/>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/db_bbs?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8"
                           user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="result3">
            SELECT user_able FROM tb_user where user_name="${sessionScope.logoner.userName}";
        </sql:query>
        <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E0E0E0" bordercolordark="white" rules="all" style="margin-top:8px;word-break:break-all">
          <tr height="30"><td colspan="3" background="images/index/classT.jpg" style="text-indent:5px"><b><font color="white">�� ��ʾ���� &nbsp;�� ���ͻ��֣�<bean:write name="bbsRootSingle" property="bbsjf" filter="false"/></font></b></td></tr>
          <tr height="30" bgcolor="#F0F0F0">
              <td style="text-indent:5px" width="27%">�� ¥��</td>
              <c:forEach var="row" items="${result3.rows}">
                    <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row.user_able==2}">
                    <td colspan="2">�����⡿<textarea id="tit" rows="1" onchange="up1()">${sessionScope.bbsRootSingle.bbsTitle}</textarea></td>
<%--                <bean:write name="bbsRootSingle" property="bbsTitle" filter="false"/>--%>
                    </c:if>
                    <c:if test="${sessionScope.logoner.userName!=sessionScope.bbsRootSingle.bbsSender&&row.user_able!=2}">
                      <td colspan="2">�����⡿${sessionScope.bbsRootSingle.bbsTitle}</td>
                      <%--              <bean:write name="bbsRootSingle" property="bbsTitle" filter="false"/>--%>
                    </c:if>
              </c:forEach>

          </tr>
          <tr bgcolor="#F9F9F9">
	          <!-- ��������Ϣ -->
              <td rowspan="3" align="center" valign="top">
                  <table width="95%" height="180" border="0" cellspacing="0" cellpadding="0" style="margin-top:3px">
                      <tr height="35%">
                          <td align="center" width="30%"><img src="images/face/user/${askUser.userFace}" style="border:1px solid;border-color:#E3E3E3"></td>
                          <td style="text-indent:10px">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${sessionScope.bbsRootSingle.bbsSender}">
                                  <b><bean:write name="askUser" property="userName" filter="false"/></b>
                              </a>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">�Ա�</td>
                          <td style="text-indent:10px">
                              <bean:write name="askUser" property="userSex"/>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">���ԣ�</td>
                          <td style="text-indent:10px">
                              <bean:write name="askUser" property="subUserFrom[10]" filter="false"/>
                          </td>
                      </tr>
                      <!-- �����ء������� -->
                      <tr height="30"><td colspan="2" style="text-indent:70px"><a href="${sessionScope.servletPath}?method=${sessionScope.method}">[����]</a></td></tr>
                  </table>
              </td>
              <!-- ������Ϣ -->
              <td width="10%">�����顿<img src="images/face/bbs/${sessionScope.bbsRootSingle.bbsFace}"></td>
              <td height="30" align="right">����ʱ�䣺��<bean:write name="bbsRootSingle" property="bbsSendTime"/>��&nbsp;</td>
          </tr>
          <tr height="130">
              <td colspan="2" valign="top" style="padding:0px">
                  <c:forEach var="row" items="${result3.rows}">
                  <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row.user_able==2}">
                      <textarea rows="9" onchange="up()" style="width: 100%" id="con" name="c">${sessionScope.bbsRootSingle.bbsContent}</textarea>
                  </c:if>
                  <c:if test="${sessionScope.logoner.userName!=sessionScope.bbsRootSingle.bbsSender&&row.user_able!=2}">
                      ${sessionScope.bbsRootSingle.bbsContent}
                  </c:if>
                  </c:forEach>

              </td></tr>
<%--          <bean:write name="bbsRootSingle" property="bbsContent" scope="session" filter="false"/>--%>
          <!-- ʵ�ֶԸ������в����ĳ����� -->
          <tr height="30" bgcolor="#F9F9F9">
              <td align="right" colspan="2">
                  <c:forEach var="row" items="${result3.rows}">
                  <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row.user_able==2}">
                      ��<a href="needLogin/firstBbs.do?method=mcon&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}&bbscon=${sessionScope.bbsRootSingle.bbsContent}&bbstit=${sessionScope.bbsRootSingle.bbsTitle}" title="����������/¥��/����Ա����" id="a">�޸�����</a>
                  </c:if>
                  </c:forEach>
<%--                  ��<a href="needLogin/deleteRoot.do?method=mcon&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}&bbscon=${sessionScope.bbsRootSingle.bbsContent}&bbstit=${sessionScope.bbsRootSingle.bbsTitle}" >�޸�����</a>--%>
                  ��<html:link href="view/indexTemp.jsp" anchor="answer">�ظ�����&nbsp;</html:link>
                  
                  <!-- ����������Ǿ������ӣ����Ҳ����ö�����(ʵ���Ͼ�����ͨ����) -->
                  <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsGood" scope="session">
                      <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsTop">
                          <!-- ��ʾ����������ǰ�������� -->
                          <c:forEach var="row" items="${result3.rows}">
                                  <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row.user_able==2}">
                                      ��<a href="needLogin/firstBbs.do?method=toFirstBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}" title="����������/¥��/����Ա����">��������ǰ</a>&nbsp;
                                  </c:if>
                          </c:forEach>
                      </logic:notEqual>
                  </logic:notEqual>
                  
                  <!-- ������������ö����� -->
                  <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsTop">
					  <!-- ��ʾ���ö����ӡ������� -->
                      <c:forEach var="row" items="${result3.rows}">
                          <c:if test="${row.user_able==2}">
                              ��<a href="needLogin/admin/doTopGood.do?method=setTopBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}" title="����Ա����">�ö�����</a>&nbsp;
                          </c:if>
                      </c:forEach>
                  </logic:notEqual>
                  
                  <!-- ����������Ǿ������� -->
                  <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsGood">
                      <!-- ��ʾ����Ϊ�������������� -->
                      <c:forEach var="row" items="${result3.rows}">
                          <c:if test="${row.user_able==2}">
                              ��<a href="needLogin/admin/doTopGood.do?method=setGoodBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}" title="����Ա����">��Ϊ������</a>&nbsp;
                          </c:if>
                      </c:forEach>
                  </logic:notEqual>
                                   
                   <!-- ��ʾ��ɾ�����ӡ������� -->
                  <c:forEach var="row" items="${result3.rows}">
                      <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row.user_able==2}">
                          ��<a href="needLogin/deleteRoot.do?method=deleteRootBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}" title="����������/¥��/����Ա����">ɾ������</a>&nbsp;
                      </c:if>
                  </c:forEach>
                  </td>
          </tr>
      </table>

      <!-- ****************��ҳ����**************** -->
      <table  border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white">
          <tr height="30">
              <td align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/openShow.do?method=openShow"/>
                  </jsp:include>
              </td>
          </tr>
      </table>
      
      <!-- ****************��ʾ�ظ�����**************** -->

        <!--��ȡ�Ƿ񱻲���-->
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" style="margin-top:2px;word-break:break-all">
          <tr height="30"><td background="images/index/classT.jpg" style="text-indent:5px"><b><font color="white">�� ��ʾ�ظ�����</font></b></td></tr>
      </table>
      <!-- �����ڻظ������б� -->
      <logic:notPresent name="answerbbslist" scope="session">
          <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all">
              <tr height="70" bgcolor="#F9F9F9"><td align="center"><li>��ʱû�лظ�����</li></td></tr>
          </table>
      </logic:notPresent>      
      <!-- ���ڻظ������б� -->
      <logic:present name="answerbbslist" scope="session">
      	  <!-- �ظ������б�Ϊ�� -->
          <logic:empty name="answerbbslist" scope="session">
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all">
                  <tr height="70" bgcolor="#F9F9F9"><td align="center"><li>��ʱû�лظ�����</li></td></tr>
              </table>                        
          </logic:empty>
          <!-- �ظ������б�Ϊ�� -->
          <logic:notEmpty name="answerbbslist" scope="session">
              <!-- �����ظ������б� -->
              <logic:iterate id="answerbbsSingle" name="answerbbslist" indexId="idind">
              <bean:define id="answererName" name="answerbbsSingle" property="bbsAnswerSender"/>
                  <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                     url="jdbc:mysql://localhost:3306/db_bbs?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8"
                                     user="root"  password="root"/>
                  <sql:query dataSource="${snapshot}" var="result">
                      SELECT is_cn from tb_bbsanswer where bbsAnswer_id="${answerbbsSingle.bbsAnswerId}";
                  </sql:query>
                  <sql:query dataSource="${snapshot}" var="result1">
                  SELECT bbs_jf from tb_bbs where bbs_id="${answerbbsSingle.bbsAnswerRootID}";
                  </sql:query>
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all" style="word-break:break-all">
                  <tr height="25" bgcolor="#F0F0F0">
                      <td style="text-indent:5px" width="27%">��${(page.currentP-1)*page.perR+(idind+1)} ¥</td>
                      <td colspan="2">���ظ����⡿<bean:write name="answerbbsSingle" property="bbsAnswerTitle" filter="false"/></td>              
                  </tr>                  
                  <tr bgcolor="#F9F9F9">
	                  <!-- �ظ�����Ϣ -->	                  
	                  
	                  <logic:iterate id="singleMap" name="answerMap">
	                      <logic:equal value="${answererName}" name="singleMap" property="key">
                              <bean:define id="answerSingle" name="singleMap" property="value"/>
	                      </logic:equal>
	                  </logic:iterate>
                      
                      <td rowspan="3" align="center" valign="top">
                          <table width="95%" height="150" border="0" cellspacing="0" cellpadding="0" style="margin-top:3px">
                              <tr height="35%">
                                  <td align="center" width="30%"><img src="images/face/user/${answerSingle.userFace}" style="border:1px solid;border-color:#E0E0E0"></td>
                                  <td style="text-indent:10px">
                                      <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${answererName}">
                                          <b>${answerMap[answererName].userName}</b>
                                      </a>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">�Ա�</td>
                                  <td style="text-indent:10px">
                                      ${answerMap[answererName].userSex}
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">���ԣ�</td>
                                  <td style="text-indent:10px">
                                      ${answerMap[answererName].userFrom}
                                  </td>
                              </tr>                              
                          </table>
                      </td>
                      <!-- �ظ�������Ϣ -->
                      <td width="10%">�����顿<img src="images/face/bbs/${answerbbsSingle.bbsFace}"></td>
                      <td align="right" height="30">�ظ�ʱ�䣺��<bean:write name="answerbbsSingle" property="bbsAnswerSendTime"/>��&nbsp;</td>
                  </tr>
                  <tr height="130"><td colspan="2" valign="top" style="padding-top:6px;padding-left:6px;padding-right:6px;padding-bottom:6px"><bean:write name="answerbbsSingle" property="bbsAnswerContent" filter="false"/></td></tr>
                  <!-- ɾ���ظ����ӳ����� -->
                  <tr height="30" bgcolor="#F9F9F9">
                      <td align="right" colspan="2">
                          <c:forEach var="row" items="${result.rows}">
                              <c:forEach var="val" items="${row}">
                              <c:if test="${val.value=='0'}">
                                  <c:forEach var="row1" items="${result1.rows}">
                                  <c:forEach var="val1" items="${row1}">
                                      <c:forEach var="row3" items="${result3.rows}">
                                          <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row3.user_able==2}">
                                              ��<a href="needLogin/deleteRoot.do?method=adjf&bbsId=${answerMap[answererName].id}&bbsAnswerId=${answerbbsSingle.bbsAnswerId}&addjf=${val1.value}">���ɻظ�</a>&nbsp;
                                          </c:if>
                                      </c:forEach>
                                  </c:forEach>
                                  </c:forEach>
                                  </c:if>
                                  <c:if test="${val.value=='1'}">
                                      ��<a style="color: #ff0000">�Ѳ��ɻظ�</a>&nbsp;
                                  </c:if>
                              </c:forEach>
                          </c:forEach>
                          <c:forEach var="row" items="${result3.rows}">
                              <c:if test="${sessionScope.logoner.userName==sessionScope.bbsRootSingle.bbsSender||row.user_able==2}">
                                  ��<a href="needLogin/admin/deleteAnswer.do?method=deleteAnswerBbs&bbsId=${bbsRootSingle.bbsId}&delbbsAnswerId=${answerbbsSingle.bbsAnswerId}">ɾ���ظ�</a>&nbsp;
                              </c:if>
                          </c:forEach>
                           ��<html:link href="view/indexTemp.jsp" anchor="top">�鿴����</html:link>&nbsp;
                      </td>            
                  </tr>        
              </table>
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white">
                  <tr height="15"><td background="images/index/boardE.jpg"></td></tr>
              </table>
              </logic:iterate>          
          </logic:notEmpty>
      </logic:present>
      
      <!-- ****************��ҳ����**************** -->
      <table  border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white">
          <tr height="30">
              <td align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/openShow.do?method=openShow"/>
                  </jsp:include>
              </td>
          </tr>
      </table>
      
      <!-- ****************�ظ�����**************** -->
      <html:link linkName="answer"/>
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all">
      <html:form action="needLogin/answerBbs.do">
          <input type="hidden" name="method" value="answerBbs">
		  <tr bgcolor="#F0F0F0" height="30"><td colspan="2" style="text-indent:5px" background="images/index/classT.jpg"><b><font color="white">�� �ظ���<bean:write name="bbsRootSingle" property="bbsTitle" filter="false"/>������</font></b></td></tr>
          <tr>
              <td width="27%" bgcolor="#F9F9F9" align="center" valign="top">
                  <table border="0" width="90%" height="100%">
                      <tr height="30%">
                          <td valign="top">
                              <table border="0" style="margin-top:10px">
                                  <tr>
			                          <td><html:errors property="bbsAnswerTitle"/></td>
            			          </tr>
			                      <tr>
            			              <td><html:errors property="bbsAnswerContent"/></td>
			                      </tr>
                              </table>
                          </td>
                      </tr>
                      <tr>
                      	  <td valign="top">
                      	      <table border="0" width="90%" style="margin-top:10px">
                      	          <tr><td>�������</td></tr>
                      	      </table>
                      	  </td>
                      </tr>
                  </table>
              </td>
              <td>
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
                      <tr height="30">
                          <td width="15%" align="center">�����⡿</td>
                          <td align="center"><html:text property="bbsAnswerTitle" size="77" maxlength="35"/></td>
                      </tr>
                      <tr bgcolor="#F9F9F9">
                          <td align="center">�����顿</td>
                          <td><%@ include file="/pages/add/face.jsp" %></td>
                      </tr>
                      <tr height="30">
                          <td align="center">�����ݡ�</td>
                          <td align="center"><%@ include file="/pages/add/font.jsp"%></td>
                      </tr>
                      <tr height="30" bgcolor="#F9F9F9">
                          <td colspan="2" align="right"><%@ include file="/pages/add/count.jsp" %></td>
                      </tr>
                      <tr><td colspan="2" align="center"><html:textarea property="bbsAnswerContent" rows="15" cols="79" styleId="content" onkeydown="check(content,ContentUse,ContentRem,1000)" onkeyup="check(content,ContentUse,ContentRem,1000)" onchange="check(content,ContentUse,ContentRem,1000)"/></td></tr>
                      <tr height="30" align="center">
                          <td colspan="2">
                              <html:submit value="�ظ�����"/>
                              <html:reset value="������д"/>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
      </html:form>
      </table>
    </center>
  </body>
</html>