package com.booking.boot.config;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.booking.boot.Dto.CategoryDto;
import com.booking.boot.mapper.CategoryMapper;

import java.io.IOException;
import java.util.List;

@Component
public class CategoryFilter implements Filter {
	
	@Autowired
	public CategoryMapper cM;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        List<CategoryDto> list = cM.getCategoryList();
        req.setAttribute("categoryList", list);  // ★ JSP에서 사용할 수 있도록 전달
        //System.out.println(list);

        // 다음 필터 또는 컨트롤러 호출
        chain.doFilter(request, response);


    }
}
