package com.booking.boot.controller;


import java.io.*;
import java.nio.file.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/register_action")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 5 * 1024 * 1024,
                 maxRequestSize = 10 * 1024 * 1024)
public class RegisterActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String word = request.getParameter("word");

        Part filePart = request.getPart("img");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadDir = request.getServletContext().getRealPath("/") + "uploads";
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) uploadFolder.mkdirs();

        String savedFileName = System.currentTimeMillis() + "_" + fileName;
        String uploadPath = uploadDir + File.separator + savedFileName;
        filePart.write(uploadPath);

        String imagePath = "uploads/" + savedFileName;

        String dbUrl = "jdbc:mysql://localhost:3306/course_db?useUnicode=true&characterEncoding=UTF-8";
        String dbUser = "root";
        String dbPass = "1234";

        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "INSERT INTO instructor (name, word, img) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, word);
            pstmt.setString(3, imagePath);
            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("register.jsp?success=true");
            } else {
                response.sendRedirect("register.jsp?error=insertfail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=exception");
        }
    }
}
