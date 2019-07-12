<%@page import="jdk.internal.org.objectweb.asm.tree.analysis.Value"%>
<%@page import="com.bit.qna.model.QnADto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function(){
	$('button').hide().eq(0).show().click(function(){
		$('#content>h2').text("수정 페이지");
		$('button').show();
		$(this).hide();
		$('input[type=hidden]').each(function(idx,ele){
			if(idx>0){
				$(ele).attr('type','text');
				$('label+span').hide().first().show();
			}
		});
	}).next().next().click(function(){
		$('#content>h2').text("상세 페이지");
		$('button').hide().eq(0).show();
		$('input[type=text]').attr('type','hidden');
		$('label+span').show();
	});
});
</script>
</head>
<body>
<%
	String root = request.getContextPath();
	QnADto bean=(QnADto)request.getAttribute("bean");
			
%>

	<form action="" method="post">
				<h2><%=bean.getNum() %>번 게시글</h2>
				<input type="hidden" id="num" name="num" value="<%=bean.getNum() %>" readonly="readonly"/>
			
			<table>
				 
				<tr>
					<td><label for="name">작성자</label></td>
					<td><span><%=bean.getName() %></span></td>
					<td><label for="category">분류</label></td>
					<td><span><%=bean.getCategory() %></span></td>
				</tr>
				<tr>
					<td><label for="phone">연락처</label></td>
					<td><span><%=bean.getPhone() %></span></td>
					<td><label for="postdate">날짜</label></td>
					<td><span><%=bean.getPostdate()%></span></td>
				</tr>
				<tr>
					<td><label for="phone">제목</label></td>
					<td><span><%=bean.getSub() %></span></td>
					<td><label for="status">상태</label></td>
					<td><span><%=bean.getStatus() %></span><input type="hidden" name="status" id="status" value="<%=bean.getStatus() %>" /></td>
				</tr>
				<tr>
					<td colspan="4"><span><%=bean.getContent() %></span></td>
				</tr>
			</table>
			
				<div>
					<button type="button" name="Modified">수정</button>
					<button type="submit">입력</button>
					<button type="reset">취소</button>
				</div>
	</form>		
</body>
</html>