package com.spring.scheduler.upload.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.parser.MediaType;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.scheduler.upload.dto.ProfileImgDTO;

import net.coobird.thumbnailator.Thumbnailator;




@Controller
@RequestMapping("upload")
public class UploadController {
	//프로필 사진 삽입하기
	@RequestMapping(value= {"/insertProfileImg", "/insertthumbnail"}, method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ProfileImgDTO>> insertProfileImg(MultipartFile [] profileImg ,HttpServletRequest request) {
		
		
		List<ProfileImgDTO> list = new ArrayList<ProfileImgDTO>();
		//요청 url에 따라 썸네일인지 프로필로 폴더를 구성하여 저장 할지 정한다. 
		String rootUplaodPath = request.getRequestURI().contains("/insertProfileImg")? "C:\\upload\\profile" : "C:\\upload\\thumbnail";
		String uploadPath = getFolder();
		File realUploadPath  =  new File(rootUplaodPath, uploadPath);
		
		ProfileImgDTO dto = new ProfileImgDTO();
		
		if(!realUploadPath.exists()) {
			realUploadPath.mkdirs();
		}
		
		//다른 웹브라우저의 경우 name을 출력하면 경로까지 포함하여 나오니 파일분리자를 기준으로 잘라서 name을 출력한다 
		String fileName = profileImg[0].getOriginalFilename().substring(profileImg[0].getOriginalFilename().lastIndexOf("\\")+1);
		dto.setFilename(fileName);
		
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString()+"_"+fileName;
		File saveFile = new File(realUploadPath, fileName);
		
		
		//업로드된 정보를 다시 front에게 알려주기 위하여 담는 작업 수행 
		dto.setPath(rootUplaodPath.substring(rootUplaodPath.lastIndexOf("\\")+1)+"/"+uploadPath.replace(File.separator,"/"));
		
		dto.setUuid(uuid.toString());
		
		//파일을 업로드 폴더에 저장 하고 이미지의 경우 썸네일을 만든다 
		try {
			profileImg[0].transferTo(saveFile);
			
			//fileCheckType 가 true이면 이미지파일임으로 썸네일을 생성한다.
			if(fileCheckType(saveFile)) {
			InputStream in = profileImg[0].getInputStream();
			FileOutputStream out = new FileOutputStream(new File(realUploadPath,"s_"+fileName));
			Thumbnailator.createThumbnail(in,out,500,500);
			out.close();
			}
			
			//파일이 업로드 된 후 객체를 list에 담는다 
			list.add(dto);
				
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return new ResponseEntity(list, HttpStatus.OK);
	}
	
	
	//업로드 폴더 경로 만들기 
	public String getFolder() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date =new Date();
		String folder = format.format(date);
		return folder.replace("-",File.separator);
	}
	//첨부파일이 이미지 타입인지 확인
	public boolean fileCheckType(File saveFile) {
		
		try {
			//mimetype이 imgage이면 true를 리턴 
			String type = Files.probeContentType(saveFile.toPath());
			return type.startsWith("image");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	//
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String filename, HttpServletRequest requst) {
		
		File profileImg = new File("c:\\upload\\"+filename);
		System.out.println(profileImg.toPath());
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("content-Type", Files.probeContentType(profileImg.toPath()));
			return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(profileImg), headers, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
		
	}
	
	@RequestMapping(value= "/deletethumbnail" ,  method=RequestMethod.DELETE)
	@ResponseBody
	public  ResponseEntity<String> deletethumbnail(@RequestBody Map<String,String> map) {
		
		
		HttpHeaders resHeaders = new HttpHeaders();
		
		try {
			String filename = map.get("filename");
			
			//썸네일삭제 
			filename = URLDecoder.decode(filename,"UTF-8");
			File file = new File("c:\\upload\\"+filename);
			file.delete();
			
			//원본 이미지 삭제
			
			file = new File(file.getAbsolutePath().replace("s_",""));
			file.delete();
			
			
		    resHeaders.add("Content-Type", "application/json;charset=UTF-8");



			
			
			
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>("삭제완료",resHeaders,HttpStatus.OK);
	}
	
	

}


