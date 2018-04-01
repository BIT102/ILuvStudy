package dev.mvc.persistence;

import dev.mvc.domain.MessageVO;

public interface MessageDAO {
	public void send(MessageVO vo) throws Exception;
}
