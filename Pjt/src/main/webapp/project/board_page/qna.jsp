<%@page import="project.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="community.css">
<script type="text/javascript" src="community.js"></script>
</head>
<body>
	<%
    BoardDao dao = new BoardDao();
	ArrayList<BoardDto> dtos = dao.Qa_list();
	
	%>
    <header>
        <img src="../images/title.png" onclick="moveMain()" alt="타이틀">
        <nav>
            <span onclick="moveCommunity()" class="w-btn">커뮤니티</span>
            <span onclick="location.href='<%=request.getContextPath()%>/project/board_page/knowledge.jsp'" class="w-btn">지식</span>
			<span onclick="location.href='<%=request.getContextPath()%>/project/board_page/qna.jsp'" class="w-btn">질문과 답변</span>

        </nav>
        <div>
          <%  
           if (session.getAttribute("user") == null) {
           
         %>
             <button onclick="moveLogin()" class="w-btn w-btn-indigo" type="button">
                로그인
            </button>
            <button onclick="moveSignup()" class="w-btn w-btn-indigo" type="button">
                회원가입
            </button>
        <%
        }else{
            %><button onclick="moveLogout()" class="w-btn w-btn-indigo" type="button">
               로그아웃
            </button>
        <%   }%>
        </div>
    </header>
     <div class="page-title">
        <h2>질문과 답변</h2>
        <small>여러분들의 질문과 답변을 위한 공간입니다.</small>
    </div>
    <div class="write">
        <button onclick="moveWrite()" class="w-btn" type="button">작성하기</button>
    </div>
    <%
    for (BoardDto dto : dtos){ 
    %> 
    <div class="container">
        <section class="post-list">
            <article class="post">
              <%
				if (session.getAttribute("user") == null) {
				%>
					<h2 class="post-title" onclick="showAlert()"><%=dto.getTitle() %></h2>
				<% 
				} else {
					%>
					<h2 class="post-title"> <a href = "community_page.jsp?number=<%=dto.getNumber()%>"> <%=dto.getTitle() %></a> </h2>
				<%} %>
                <div class="post-meta">
                    <div id="left">
                         <p>작성자 : <%=dto.getWriter() %></p>
                        <p>작성일 : <%=dto.getRegdate() %></p>
                    </div>
                    <div id="right">
                        <img src="../images/icon_view.png" alt="<%= dto.getView_cnt()%>">
                        <small><%= dto.getView_cnt()%></small>
                        <img src="../images/icon_chat.png" alt="<%= dto.getReply_cnt()%>">
                        <small><%= dto.getReply_cnt()%></small>
                        <img src="../images/icon_heart.png" alt="<%=dto.getLike() %>">
                        <small><%= dto.getLike()%></small>
                    </div>
                </div>
            </article>

        </section>
    </div>
    <%} %>
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>
</html>