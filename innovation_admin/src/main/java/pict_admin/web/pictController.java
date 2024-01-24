package pict_admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.PasswordAuthentication;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;
import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.codec.binary.Base64;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;


//import io.socket.emitter.Emitter;
//import io.socket.emitter.Emitter.Listener;
//import io.socket.client.IO;
//import io.socket.client.Socket;

import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.net.HttpURLConnection;

@Controller
public class pictController {
	PasswordAuthentication pa;
	
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	
	
	@RequestMapping(value = "/pict_login.do")
	public String login_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {
		String userAgent = request.getHeader("user-agent");
		String sessions = (String)request.getSession().getAttribute("id");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			System.out.println("피씨");
			model.addAttribute("message", "PC에서만 사용이 가능합니다.");
			model.addAttribute("retType", ":exit");
			return "pict/main/message";
		}
		
		
		System.out.println(sessions);
		if(sessions == null || sessions == "null") {
			return "pict/main/login";
		}
		else {
			//나중에 여기 계정별로 리다이렉트 분기처리
			return "redirect:/board/board_list.do";
			
		}
	}
	@RequestMapping(value = "/pict_main.do")
	public String main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		System.out.println(sessions);
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		else {
			String user_id = (String)request.getSession().getAttribute("id");
			if(request.getSession().getAttribute("id") != null) {
				adminVO.setAdminId((String)request.getSession().getAttribute("id"));
				adminVO = adminService.get_user_info(adminVO);
				model.addAttribute("adminVO", adminVO);
			}
		
			//나중에 여기 계정별로 리다이렉트 분기처리
			return "redirect:/board/board_list.do";
		}
	}
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("adminVO") AdminVO adminVO, HttpServletRequest request,  ModelMap model) throws Exception {
		//처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = adminVO.getAdminId();
		String inputPw = adminVO.getAdminPw();
		
		adminVO = adminService.get_user_info(adminVO);

		if (adminVO != null && adminVO.getId() != null && !adminVO.getId().equals("")) {
			String user_id = adminVO.getId();
			String enpassword = encryptPassword(inputPw, inpuId);	//입력비밀번호
			
			if(enpassword.equals(adminVO.getPassword())) {
				request.getSession().setAttribute("id", adminVO.getId());
				request.getSession().setAttribute("name", adminVO.getName());
				request.getSession().setAttribute("depart", adminVO.getDepart());

				String ip = request.getRemoteAddr();
			    DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			    String now = format2.format(Calendar.getInstance().getTime());
			    
			    adminVO.setLast_login_ip(ip);
			    adminVO.setLast_login_date(now);
			    adminService.insert_login_info(adminVO);
			    
			    adminVO.setAdminId(user_id);
			    adminVO = adminService.get_user_info(adminVO);
			    
				return "redirect:/pict_main.do";
				
			}
			else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/pict_login.do");
				return "pict/main/message";
			}
		}
		else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/pict_login.do");
			return "pict/main/message";
		}
	}
	@RequestMapping(value = "/sso.do")
	public String sso(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String pni_token = request.getQueryString().split("pni_token")[1];
		//위 토큰으로 getUserInfo 태워서 통과 나오면 세션 넣어주고 메인으로 이동
		System.out.println(pni_token);
		return "pict/main/sso";
	}
	@RequestMapping(value = "/user_list.do")
	public String user_list(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		model.addAttribute("search_text",adminVO.getSearch_text());
		
		
		List<?> userList = adminService.user_list(adminVO);
		model.addAttribute("resultList", userList);
		return "pict/main/user_list";
	}
	@RequestMapping(value = "/user_register.do")
	public String user_register(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(adminVO.getId() != null && !adminVO.equals("")) {
			//수정
			adminVO = adminService.user_select_one(adminVO);
			adminVO.setSaveType("update");
			
		}
		else {
			adminVO.setSaveType("insert");
		}
		
		model.addAttribute("adminVO", adminVO);
		return "pict/main/user_register";
	}
	@RequestMapping(value = "/user_reset.do")
	public String user_reset(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		String enpassword = encryptPassword(adminVO.getId()+"1!", adminVO.getId());	//입력비밀번호
		adminVO.setPassword(enpassword);
		adminService.user_reset(adminVO);
		
		model.addAttribute("message", "비밀번호가 초기화 되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/user_list.do");
		return "pict/main/message";
	}
	@RequestMapping(value = "/user_delete.do")
	public String user_delete(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		System.out.println(adminVO.getId());
		adminService.user_delete(adminVO);
		
		model.addAttribute("message", "삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/user_list.do");
		return "pict/main/message";
	}
	@RequestMapping(value = "/user_save.do")
	public String user_save(@ModelAttribute("searchVO") PictVO pictVO, @ModelAttribute("adminVO") AdminVO adminVO,ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		System.out.println("::::::::::::::"+adminVO.getPassword());
		String enpassword = encryptPassword(adminVO.getPassword(), adminVO.getId());	//입력비밀번호
		
		adminVO.setPassword(enpassword);
		String user_id = adminVO.getId();
		
		
		//중복 계정조회
		AdminVO vo = adminVO;
		vo.setAdminId(user_id);
		vo = adminService.get_user_info(vo);
		
		if(adminVO.getSaveType() != null && adminVO.getSaveType().equals("update")) {
			System.out.println("업데이트::::::::::::::::::::::");
			System.out.println(adminVO.toString());
			adminService.update_user(adminVO);	//user 정보 인설트
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user_list.do");
			return "pict/main/message";
		}
		
		else {
	        if(vo != null) {
	        	model.addAttribute("message", "동일한 아이디가 존재합니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user_register.do");
				return "pict/main/message";
	        }
	        System.out.println("인설트::::::::::::::::::::::");
	 
	        adminService.insert_user(adminVO);	//user 정보 인설트
            model.addAttribute("message", "계정발급이 완료되었습니다.");
    		model.addAttribute("retType", ":location");
    		model.addAttribute("retUrl", "/user_list.do");
    		return "pict/main/message";
		}
	}
	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request,  ModelMap model) throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);
		
		return "redirect:/pict_login.do";
		
	}
	
	

	//사용자관리
    @RequestMapping(value = "/user/user_list.do")
	public String user_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.user_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/user/user_list";
	}
	@RequestMapping(value = "/user/user_register.do")
	public String user_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.user_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/user/user_register";
	}
	@RequestMapping(value = "/user/user_save.do", method = RequestMethod.POST)
	public String user_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		String enpassword = encryptPassword(pictVO.getId() + "1!", pictVO.getId());	//입력비밀번호
		pictVO.setPassword(enpassword);

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.user_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user/user_list.do");
			return "pict/main/message";
		}
		else {
			pictService.user_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user/user_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/user/user_delete.do")
	public String user_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.user_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/user/user_list.do");
		return "pict/main/message";
		
	}


    //게시물관리
    @RequestMapping(value = "/board/board_list.do")
	public String reference_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/board/board_list";
	}
	@RequestMapping(value = "/board/board_register.do")
	public String reference_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.board_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/board/board_register";
	}
	@RequestMapping(value = "/board/board_save.do", method = RequestMethod.POST)
	public String reference_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file,
			@RequestParam("attach_file1") MultipartFile attach_file1,
			@RequestParam("attach_file2") MultipartFile attach_file2,
			@RequestParam("attach_file3") MultipartFile attach_file3,
			@RequestParam("attach_file4") MultipartFile attach_file4) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(attach_file.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url1(filepath+filename);
		}
		if(attach_file1.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file1, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url2(filepath+filename);
		}
		if(attach_file2.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file2, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url3(filepath+filename);
		}
		if(attach_file3.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file3, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url4(filepath+filename);
		}
		if(attach_file4.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file4, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url5(filepath+filename);
		}
		 

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.board_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";
		}
		else {
			pictService.board_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/board/board_delete.do")
	public String board_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.board_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_list.do");
		return "pict/main/message";
		
	}
	@RequestMapping(value = "/board/board_file_delete.do")
	public String board_file_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictService.board_file_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_register.do?idx=" + pictVO.getIdx());
		return "pict/main/message";
		
	}

    //팝업존관리
    @RequestMapping(value = "/popup/popup_list.do")
	public String popup_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.popup_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/popup/popup_list";
	}
	@RequestMapping(value = "/popup/popup_register.do")
	public String popup_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.popup_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/popup/popup_register";
	}
	@RequestMapping(value = "/popup/popup_save.do", method = RequestMethod.POST)
	public String reference_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(attach_file.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setImg_url(filepath+filename);
		}

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.popup_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/popup/popup_list.do");
			return "pict/main/message";
		}
		else {
			pictService.popup_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/popup/popup_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/popup/popup_delete.do")
	public String popup_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.popup_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/popup/popup_list.do");
		return "pict/main/message";
		
	}

	
    //프로그램관리
    @RequestMapping(value = "/program/program_list.do")
	public String program_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.program_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/program/program_list";
	}
	@RequestMapping(value = "/program/program_register.do")
	public String program_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.program_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/program/program_register";
	}
	@RequestMapping(value = "/program/program_save.do", method = RequestMethod.POST)
	public String program_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(attach_file.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setImg_url(filepath+filename);
		}

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.program_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/program/program_list.do");
			return "pict/main/message";
		}
		else {
			pictService.program_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/program/program_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/program/program_delete.do")
	public String program_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.program_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/program/program_list.do");
		return "pict/main/message";
		
	}

    //행사장관리
    @RequestMapping(value = "/event/event_list.do")
	public String event_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.event_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/event/event_list";
	}
	@RequestMapping(value = "/event/event_register.do")
	public String event_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.event_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		List<?> reference_list = pictService.user_list(pictVO);
		model.addAttribute("resultList", reference_list);
		
		model.addAttribute("pictVO", pictVO);
		return "pict/event/event_register";
	}
	@RequestMapping(value = "/event/event_save.do", method = RequestMethod.POST)
	public String event_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(attach_file.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setImg_url(filepath+filename);
		}

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.event_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/event/event_list.do");
			return "pict/main/message";
		}
		else {
			//여기서 QR코드 발급하고 넣어야함
			
			String content = (String) "https://www.thepict.co.kr";	//행사장URL 뒤에 행사장 idx로 발급해야함
	        String fileName = "";
	        String savePath = "D:\\innovation_admin";	//경로는 서버 경로로 server 하위에 uploadfile 맞춰서

	        //한글 데이터 처리
	        QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, 200, 200);
            BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix);

            //yyyyMMddHHmmss 형식의 날짜 및 시간 정보 파일명에 추가
            
            fileName = pictVO.getTitle() + "qr";
            //파일 생성
            File temp = new File(savePath + "/" + fileName + ".png");

            //ImageIO를 사용하여 파일쓰기
            ImageIO.write(bufferedImage, "png", temp);
            
			pictVO.setQr_img(temp.toString());
			pictService.event_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/event/event_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/event/event_delete.do")
	public String event_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.event_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/event/event_list.do");
		return "pict/main/message";
		
	}

	
	//데이터 타입 관리
    @RequestMapping(value = "/data/data_type_list.do")
	public String data_type_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.data_type_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/data/data_type_list";
	}
	@RequestMapping(value = "/data/data_type_register.do")
	public String data_type_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.data_type_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/data/data_type_register";
	}
	@RequestMapping(value = "/data/data_type_save.do", method = RequestMethod.POST)
	public String data_type_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.data_type_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/data/data_type_list.do");
			return "pict/main/message";
		}
		else {
			pictService.data_type_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/data/data_type_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/data/data_type_delete.do")
	public String data_type_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.data_type_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/data/data_type_list.do");
		return "pict/main/message";
		
	}
	
    //데이터셋 관리
    @RequestMapping(value = "/data/data_list.do")
	public String data_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.data_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/data/data_list";
	}
	@RequestMapping(value = "/data/data_register.do")
	public String data_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.data_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		List<?> resultList = pictService.data_type_list(pictVO);
		model.addAttribute("resultList", resultList);
		model.addAttribute("pictVO", pictVO);
		return "pict/data/data_register";
	}
	@RequestMapping(value = "/data/data_save.do", method = RequestMethod.POST)
	public String data_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(attach_file.getSize() != 0) {
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"));
			String filepath = "https://kdpapi.kangwon.ac.kr/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url(filepath+filename);
		}

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.data_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/data/data_list.do");
			return "pict/main/message";
		}
		else {
			pictService.data_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/data/data_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/data/data_delete.do")
	public String data_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.data_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/data/data_list.do");
		return "pict/main/message";
		
	}
	@RequestMapping(value = "/data/data_file_delete.do")
	public String data_file_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.data_file_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/data/data_register.do?idx=" + pictVO.getIdx());
		return "pict/main/message";
		
	}

	//통계관리
	@RequestMapping(value = "/status/status_list.do")
	public String status_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.status_list(pictVO);
		model.addAttribute("resultList", reference_list);		
		model.addAttribute("pictVO", pictVO);
		
		return "pict/status/status_list";
	}
	@RequestMapping(value = "/status/status_user_list.do")
	public String status_user_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.status_user_list(pictVO);
		model.addAttribute("resultList", reference_list);
		
		pictVO = pictService.data_list_one(pictVO);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/status/status_user_list";
	}
	
	//메소드
	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null) return "";
		if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }
	public String fileUpload_board(MultipartHttpServletRequest request, MultipartFile uploadFile, String target) {
    	String path = "";
    	String fileName = "";
    	OutputStream out = null;
    	PrintWriter printWriter = null;
    	long fileSize = uploadFile.getSize();
    	try {
    		fileName = uploadFile.getOriginalFilename();
    		byte[] bytes = uploadFile.getBytes();
    		
			path = getSaveLocation(request, uploadFile);
	
    		
    		File file = new File(path);
    		if(fileName != null && !fileName.equals("")) {
    			if(file.exists()) {
    				file = new File(path + fileName);
    			}
    		}
    		out = new FileOutputStream(file);
    		out.write(bytes);
    		
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return path + "#####" + fileName;
    }
    
    private String getSaveLocation(MultipartHttpServletRequest request, MultipartFile uploadFile) {
    	String uploadPath = "/home/KDigital/server/upload_file/";
    	return uploadPath;
    }

    private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
    
    
    
}
