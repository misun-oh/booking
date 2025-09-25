package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.booking.boot.Dto.NoticeDto;
import com.booking.boot.Dto.ReDataDto;
import com.booking.boot.mapper.NoticeMapper;


@Controller

public class NoticeController {
	
	@Autowired
	NoticeMapper notice;
	
	@PostMapping("/notice")
	public String postMethodName(Model model, @RequestBody String entity, String title) {
		System.out.println("title .."+ title);
		// notice.insert();		
		model.addAttribute("msg", "등록되었습니다.");
		return "/common/msgbox";
	}

	@PostMapping("/edu/wr_notice")
	public String postMethodName1(Model model, @RequestBody String entity, String title, String content) {
		System.out.println("title .."+ title);
		System.out.println("content .." + content);
		System.out.println("Notice");
		notice.insert(title, content);
		model.addAttribute("msg", "등록되었습니다.");
		model.addAttribute("url", "/notice_list");
		return "/common/msgbox";
	}
	
	@GetMapping("/notice_list")
    public String list(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 10; // 한 페이지에 보여줄 개수
        int start = (page - 1) * pageSize;
        int end = page * pageSize;

        List<NoticeDto> list = notice.getList(start, end);
        System.out.println(list); // 상세 출력
        // ✅ 리스트 사이즈 출력 (여기!)
        System.out.println("list size = " + list.size());
        for (NoticeDto dto : list) {
            System.out.println(dto); // 상세 출력
        }
        
        int totalCount = notice.getTotalCount();
        int totalPages = (int)Math.ceil((double)totalCount / pageSize);

        model.addAttribute("list", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "edu/notice_list"; // JSP
    }
	
}
