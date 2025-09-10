package com.booking.boot.Servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

import com.booking.boot.Util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1, //1MB
	maxFileSize = 1024 * 1024 * 20, 	//20MB
	maxRequestSize = 1024 * 1024 * 25	//25MB
)
public class VideoUploadServlet extends HttpServlet {
	private static final String UPLOAD_DIR = "uploads"; //저장 폴더
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//업로드 폴더 실제 경로
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		
		//파라미터 읽기 
		String userId = "admin"; //실제 로그인 사용자로 대체가능
		Part filePart = request.getPart("video");
		
		if(filePart != null && filePart.getSize() > 0) {
			
			String origName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String storedName = UUID.randomUUID().toString() + "_" + origName;
			String relPath = UPLOAD_DIR + "/" + storedName;
			String contentType = filePart.getContentType();
			long fileSize = filePart.getSize();
			
			//저장할 경로
			String filePath = uploadPath + File.separator + storedName;
			filePart.write(filePath);
			
			//DB 저장
			try (Connection conn = DBUtil.getConnection()) {
				String sql = "INSERT INTO upload_file (attach_idx, orig_name, stored_name, rel_path, content_type, file_size, user_id)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
				try(PreparedStatement stmt = conn.prepareStatement(sql)) {
					stmt.setInt(1, 0); //attach_idx : 기본값 0 (필요 시  조정)
					stmt.setString(2, origName);
					stmt.setString(3, storedName);
					stmt.setString(4, relPath);
					stmt.setString(5, contentType);
					stmt.setLong(6, fileSize);
					stmt.setString(7, userId);
					
					stmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("Lecturelist.jsp");
		
	}

}
