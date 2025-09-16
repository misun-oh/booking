<%@ page import="java.io.*, java.sql.*, java.nio.file.*" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // 반드시 request 인코딩 설정 (post 방식일 때)
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String word = request.getParameter("word");


 
      // DB 연결 정보
    String dbUrl = "jdbc:mysql://localhost:3306/course_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234"; // 본인 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        String sql = "INSERT INTO instructor (name, word) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, word);

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
%>
            <script>
                alert('강사 등록 성공');
                location.href = 'register.jsp';
            </script>
<%
        } else {
%>
            <script>
                alert('강사 등록 실패');
                history.back();
            </script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert('오류 발생: <%= e.getMessage() %>');
            history.back();
        </script>
<%
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
