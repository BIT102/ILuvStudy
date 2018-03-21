package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.BookmarkVO;

@Repository
public class BookmarkDAOImpl implements BookmarkDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.BookmarkMapper";
	
	//�ϸ�ũ ���
	@Override
	public void create(BookmarkVO vo) throws Exception {
		session.insert(namespace+".createBookmark", vo);
	}
	
	//�ϸ�ũ �ҷ�����
	public List<BookmarkVO> list(Integer bsBno) throws Exception {
		return session.selectList(namespace+".list");
	}
	//�ϸ�ũ ����ϱ�
	@Override
	public void delete(Integer bsBno, String userEmail) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bsBno", bsBno);
		map.put("userEmail", userEmail);
		
		session.insert(namespace+".deleteBookmark", map);
	}
	
}