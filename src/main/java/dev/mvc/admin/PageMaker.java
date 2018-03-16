package dev.mvc.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	private Criteria cri;
	
	//admin관리 페이지 검색
	public String adminSearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("statusType", cri.getStatusType()) //검색 처리
					.queryParam("idKeyword", encoding(cri.getIdKeyword()))  
					.queryParam("nameKeyword",encoding(cri.getNameKeyword()))
					.build();
		return uriComponents.toUriString();
	}
	
	//회원관리 > 회원조회 페이지 검색
	public String userSearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("isDelType", cri.getIsDelType())  //검색 처리
					.queryParam("emailKeyword",encoding(cri.getEmailKeyword()))
					.queryParam("nickNameKeyword",encoding(cri.getNickNameKeyword()))
					.build();
		return uriComponents.toUriString();
	}
	
	//스터디 관리 > 스터디목록 페이지 검색
	public String studySearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("stStatusType", cri.getStStatusType())  //검색 처리
					.queryParam("titleKeyword",encoding(cri.getTitleKeyword()))
					.queryParam("writerKeyword",encoding(cri.getWriterKeyword()))
					.build();
		return uriComponents.toUriString();
	}
	
	//댓글관리 페이지 검색
	public String replySearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("bsBnoKeyword",encoding(cri.getBsBnoKeyword()))   //검색 처리
					.queryParam("writerKeyword",encoding(cri.getWriterKeyword()))
					.build();
		return uriComponents.toUriString();
	}
	
	//qna관리 페이지 검색
	public String qnaSearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("faqType", cri.getFaqType())   //검색 처리
				.queryParam("emailKeyword",encoding(cri.getEmailKeyword()))
				.build();
		return uriComponents.toUriString();
	}
	
	//공지사항 페이지 검색
	public String noticeSearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("titleKeyword",encoding(cri.getTitleKeyword()))//검색 처리
				.queryParam("idKeyword",encoding(cri.getIdKeyword()))
				.build();
		return uriComponents.toUriString();
	}
		
	//페이지 정보 저장
	public String makeQuery(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.build();
		return uriComponents.toUriString();
	}
	
	//검색 처리
	private String encoding(String keyword){
		if(keyword == null || keyword.trim().length() == 0){
			return "";
		}
		try{
			return URLEncoder.encode(keyword, "UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";
		}
	}
	
	public void setCri(Criteria cri){
		this.cri = cri;
	}
	public void setTotalCount(int totalCount){
		this.totalCount = totalCount;
		
		calcData();
	}
	private void calcData(){
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		if(endPage > tempEndPage){
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public Criteria getCri() {
		return cri;
	}
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
}
