<%@page import="com.bit.accountmng.model.AccountDto" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/frame.css"/>
<style type="text/css">
    h1{
            width:800px;
            height:50px;
            text-align: center;
            color:rgb(3,73,120);
            font-weight: bolder;
            margin: auto;
            font-size:40px;
            padding-bottom: 30px;
        }
    
    hr{
            border:1px solid lightgray;
            width:800px;
            margin-bottom:20px;
        }
    
	table{
        width:800px;
        margin:0px auto;
		border-collapse: collapse;
        margin-bottom: 30px;
	}
	table>thead>tr>th{
		border:1px solid;
        background-color: rgb(3,73,120);
            font-size:25px;
            color:white;
	}
	table>tbody>tr>td{
		border:1px solid;
	}
    tbody tr:nth-child(2n+1) {
            background-color: beige;
        }
    #edit{
    	text-align:center;
    }
    #edit>input{
        width:90px;
        height:40px;
        background-color:rgb(3,73,120);
        color:white;
        font-size:20px;
        font-weight: bold;
        border:1px solid white;
    }
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
function editForm(){
	location.href="<%=request.getContextPath()%>/account/accountedit";
}
</script>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>

    <h1>계정 관리</h1>
    <hr>
	<form> <!-- action="accountedit.bit" method="post"> --><!--버튼 눌렀을 때 액션 동작, 이동하면서 텍스트필드의 값을 함께 가져간다. -->
	
	<!-- 계정관리 목록 부분 -->
	<div id="account">
		<table id="gra_account">
			<thead>
				<tr>
					<th>계정 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>계정타입</th>
					<th>과정코드</th>
					
				</tr>
			</thead>
			
			
			
			<tbody>
				<%
					ArrayList<AccountDto> list=(ArrayList<AccountDto>)request.getAttribute("list");
					if(list!=null){
						for(AccountDto bean:list){
					
				%>
					<tr>
						<td><%=bean.getAccountNum() %></td>
						<td><%=bean.getId() %></td>
						<td><%=bean.getName() %></td>
						<td><%=bean.getBday() %></td>
						<td><%=bean.getPhone() %></td>
						<td><%=bean.getEmail() %></td>
						
						<td><%=bean.getAccountType() %></td> 
						
						
						<td><%=bean.getCourseCode() %></td>
					</tr>
					
				<%
						}
					}
				%>
			</tbody>
		</table>
		<hr>
	</div>
	<div id="edit">
			<input type="button" value="수 정" onclick="editForm()">
	</div>	
	</form>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>