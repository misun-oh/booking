<%@ page import="java.io.*, java.sql.*, java.nio.file.*" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // 반드시 request 인코딩 설정 (post 방식일 때)
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String word = request.getParameter("word");

    // Multipart 요청에서 파일 추출
    Part filePart = request.getPart("img"); // name="img"와 일치해야 함

    if(filePart == null || filePart.getSize() == 0) {
%>
        <script>
            alert('이미지 파일이 전송되지 않았습니다.');
            history.back();
        </script>
<%
        return;
    }

    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

    // 저장 폴더 (웹루트/upload)
    String uploadDir = application.getRealPath("/") + "uploads";
    File uploadFolder = new File(uploadDir);
    if (!uploadFolder.exists()) uploadFolder.mkdirs();

    // 중복 방지용 이름
    String savedFileName = System.currentTimeMillis() + "_" + fileName;
    String uploadPath = uploadDir + File.separator + savedFileName;

    // 파일 저장
    filePart.write(uploadPath);

    String imagePath = "uploads/" + savedFileName;

    // DB 연결 정보
    String dbUrl = "jdbc:mysql://localhost:3306/course_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234"; // 본인 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        String sql = "INSERT INTO instructor (name, word, img) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, word);
        pstmt.setString(3, imagePath);

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
