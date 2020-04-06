package com.spring.scheduler.auth;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.xml.ws.RequestWrapper;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/sc", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
				
		return "sc";
	}
	
	@RequestMapping(value = "/getdate", headers="Accept=*/*",  produces="application/json")
	@ResponseBody
	public JSONArray getdate() throws JsonParseException, JsonMappingException, IOException {
		
		
		
		
		  
		  
		  
		ClassPathResource resource = new ClassPathResource("data.json");
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> content = null;
		String json = "";

		try {

			Path path = Paths.get(resource.getURI());
			content = Files.readAllLines(path);
			for (int i = 0; i < content.size(); i++) {
				json += content.get(i);

			}
		} catch (IOException e) {

		}
		
		System.out.println(json);
		
		System.out.println("0번 문제 "+content.get(0));
		System.out.println("1번 문제 "+content.get(1));
		System.out.println("2번 문제 "+content.get(2));
		json = json.replace(" ", "");
		

		
		
		
		System.out.println(json);
		JSONParser parser = new JSONParser();
		Object obj = null;

		// 따옴표 변환 필요
		//jsonString = jsonString.replace("'", "\"");
		
		
		try {
			System.out.println("11");
		 obj = parser.parse(json);
		 System.out.println("22");
		 
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONArray jsonObj = (JSONArray) obj;
		
		 
		
		return jsonObj;
			
	}
	
	
}
