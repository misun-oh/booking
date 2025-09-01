package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.RoomDto;
import com.booking.boot.Dto.ReDataDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.BookingMapper;
import com.booking.boot.mapper.ReDataMapper;
import com.booking.boot.mapper.ViewMapper;


@Controller
public class LoginController {
	
	@Autowired
	BookingMapper bookingMapper;
	
	@GetMapping("/login")
	private String booking_login() {
		return "/booking/login";
	}
	
	@PostMapping("/main")
	private String booking_main() {
		
		return "/booking/main";
	}
	@GetMapping("/main")
	private String booking_mainget() {
		return "/booking/main";
	}
	
	@GetMapping("/list")
	private String booking_list(Model model, SearchDto searchDto) {
		model.addAttribute("pageDto", new PageDto(searchDto, 100));
		
		List<RoomDto> list = bookingMapper.list();
		model.addAttribute("list", list);
		return "/booking/list";
	}
	
	@Autowired
	ViewMapper mapper;
	
	@Autowired
	ReDataMapper redata01;
	
	@GetMapping("/view")
	private String booking_view(Model model, Integer room_no) {
		if(room_no == null) {
			return "/booking/view";
		}
		System.out.println("room_no : "+room_no);
		model.addAttribute("viewDto", mapper.getView(room_no));
		return "/booking/view";
		
	}

	@GetMapping("/view2")
	private String booking_view2(Model model) {
		
		return "/booking/view2";
	}

	@GetMapping("/view3")
	private String booking_view3(Model model) {
		
		return "/booking/view3";
	}

	@GetMapping("/view4")
	private String booking_view4(Model model) {
		
		return "/booking/view4";
	}
		
	@GetMapping("/qna")
	private String booking_view5(Model model) {
		
		return "/booking/qna";
	}
		
	@GetMapping("/view6")
	private String booking_view6(Model model) {
		
		return "/booking/view6";
	}
	
    // 예약 등록
    @PostMapping("/re_data")
    public String insertReData(ReDataDto redata) {
        // 필수값 체크
        if (redata.getName().isEmpty() || redata.getPhone().isEmpty() 
            || redata.getCheckin().isEmpty() || redata.getCheckout().isEmpty()) {
            throw new IllegalArgumentException("예약 정보가 완전하지 않습니다.");
        }

        redata01.insertReData(redata);

        // 등록 후 예약 번호로 조회 페이지로 이동
        return "redirect:/re_data?reid=" + redata.getReid();
    }
        
        // 예약 조회
    @GetMapping("/re_data")
    public String booking_re_data(Model model, ReDataDto redata) {
        ReDataDto result = null;
        System.out.println("받은 reid: " + redata.getReid());
        if (redata.getReid() != null) {
            result = redata01.findViewById(redata);
        }

        model.addAttribute("reservation", result);
        model.addAttribute("reid", redata.getReid());

        return "/booking/re_data";
    }

    
    @Autowired
    private ReDataMapper reDataMapper;

    @GetMapping("/re_data2")
    public String list(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 10; // 한 페이지에 보여줄 개수
        int start = (page - 1) * pageSize;
        int end = page * pageSize;

        List<ReDataDto> list = reDataMapper.getList(start, end);
        System.out.println(list); // 상세 출력
        // ✅ 리스트 사이즈 출력 (여기!)
        System.out.println("list size = " + list.size());
        for (ReDataDto dto : list) {
            System.out.println(dto); // 상세 출력
        }
        
        int totalCount = reDataMapper.getTotalCount();
        int totalPages = (int)Math.ceil((double)totalCount / pageSize);

        model.addAttribute("list", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "booking/re_data2"; // JSP
    }
	


	

	
	
	@GetMapping("/register")
	private String booking_register(Model model) {
		
		return "/booking/register";
	}
}
