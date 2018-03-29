package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.BookmarkVO;
import dev.mvc.domain.StudyVO;



@Repository
public class BookmarkDAOImpl implements BookmarkDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.BookmarkMapper";
	
	//북마크 등록
	@Override
	public void create(BookmarkVO vo) throws Exception {
		session.insert(namespace+".createBookmark", vo);
	}
	
	@Override
	public List<StudyVO> list(String writer) throws Exception {
		return session.selectList(namespace+".list", writer);
	}
	
	@Override
	public List<BookmarkVO> bolist(Map<String, Object> map) throws Exception {
		return session.selectList(namespace+".bolist", map);
	}
	
	
	//북마크 취소하기
	@Override
	public void delete(Integer bsBno, String userEmail) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bsBno", bsBno);
		map.put("userEmail", userEmail);
		
		session.insert(namespace+".deleteBookmark", map);
	}
	
}
