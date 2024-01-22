package pict_admin.web;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class apiController {
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
//	@GetMapping("api/lecture_attendance.do")
//	@ResponseBody
//	public void lecture_attendance(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setHeader("Access-Control-Allow-Origin", "*");
//		response.setHeader("Content-Type", "application/xml");
//		response.setContentType("text/xml;charset=UTF-8");
//		response.setCharacterEncoding("utf-8");
//		response.setHeader("Access-Control-Allow-Methods", "GET");
//		
//		String idx = request.getParameter("idx");
//		pictVO.setIdx(Integer.parseInt(idx));
//		List<PictVO> attendance_list = pictService.lecture_attendance_api(pictVO);
//		
//		ArrayList<Map<String, Object>> list = new ArrayList();
//		for(PictVO a : attendance_list){
//			Map<String, Object> map = new HashMap<>();
//			map.put("idx" , a.getIdx()); 
//			map.put("title" , a.getTitle());
//			map.put("professor" , a.getProfessor());
//			map.put("name" , a.getName());
//			map.put("in_date" , a.getIn_date());
//			map.put("out_date" , a.getOut_date());
//			map.put("std_num" , a.getStd_num());
//			map.put("timediff" , a.getTimediff());
//			map.put("category_cnt" , a.getCategory_cnt());
//			map.put("whole_timediff" , a.getWhole_timediff());
//			
//			list.add(map);
//		}
//		
//		PrintWriter out = response.getWriter();
//		JSONArray js = JSONArray.fromObject(list);
//		out.print(js);
//		out.flush();
//	
//	}

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

	
	/*
	 * //qr코드
	 * 
	 * @PostMapping("api/qrcode.do") public void barcode(@RequestParam("id") String
	 * id) throws Exception{ System.out.println("카카카카카"); String ccc = "1"; String
	 * c_id = encryptPassword("pict", ccc); String data =
	 * "http://192.168.1.22:8080/apicoupon.do?id=" + c_id; String path =
	 * "C:\\Users\\82105\\Desktop\\bc.png";
	 * 
	 * String charset = "UTF-8";
	 * 
	 * Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new
	 * HashMap<EncodeHintType,ErrorCorrectionLevel>();
	 * 
	 * hashMap.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.L);
	 * 
	 * createQR(data, path, charset, hashMap, 200, 200);
	 * System.out.println("QR Code Generated!!! "); }
	 * 
	 * @RequestMapping(value = "/apicoupon.do") public void
	 * zzzzz(@RequestParam("id") String id) throws Exception {
	 * System.out.println("드오나!"); }
	 * 
	 * public static void createQR(String data, String path, String charset, Map
	 * hashMap, int height, int width) throws WriterException, IOException{
	 * BitMatrix matrix = new MultiFormatWriter().encode(new
	 * String(data.getBytes(charset), charset), BarcodeFormat.QR_CODE, width,
	 * height); MatrixToImageWriter.writeToFile(matrix,
	 * path.substring(path.lastIndexOf('.') + 1), new File(path)); }
	 */
}