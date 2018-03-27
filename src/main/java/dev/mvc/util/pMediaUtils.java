package dev.mvc.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class pMediaUtils {

	// 확장자를 가지고 이미지를 타입인지를 판단해 주는 역할. 브라우저에서 파일을 다운로드 할 것인지, 보여줄 것인지 결정
	private static Map<String, MediaType> mediaMap;
	
	static{
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG",	MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type){
		return mediaMap.get(type.toUpperCase());
	}
}
