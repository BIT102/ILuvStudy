/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.24
 * Generated at: 2018-03-08 03:37:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.study;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1519538057135L));
    _jspx_dependants.put("jar:file:/C:/Users/504CLASS%2001/git/ILuvStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ILuvStudy_v1_0/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-1.7.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/resources/js/upload.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js\"></script>\r\n");
      out.write("<title>Document</title>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write(".fileDrop {\r\n");
      out.write("\twidth: 200px;\r\n");
      out.write("\theight: 200px;\r\n");
      out.write("\tborder: 1px dotted blue;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".small {\r\n");
      out.write("\tmargin-left: 3px;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tcolor: gray;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".small:hover {\r\n");
      out.write("\tbackground-color: black;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<!--스터디등록-->\r\n");
      out.write("\t<form id=\"registerForm\" role=\"form\" method=\"post\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!--첫번째 페이지-->\r\n");
      out.write("\t\t<div class=\"register1\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--제목입력-->\r\n");
      out.write("\t\t\t<div class=\"studytitle\">\r\n");
      out.write("\t\t\t\t<p>스터디명</p>\r\n");
      out.write("\t\t\t\t<input type=\"text\" placeholder=\"스터디명\" name=\"title\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--쓴사람//value값수정-->\r\n");
      out.write("\t\t\t<div class=\"studywriter\">\r\n");
      out.write("\t\t\t\t<p>쓴사람</p>\r\n");
      out.write("\t\t\t\t<input type=\"text\" placeholder=\"쓴사람\" name=\"writer\"\r\n");
      out.write("\t\t\t\t\tvalue=\"abc1@gmail.com\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--카테고리-->\r\n");
      out.write("\t\t\t<div class=\"stucycategory\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!--대분류-->\r\n");
      out.write("\t\t\t\t<div class=\"CD\">\r\n");
      out.write("\t\t\t\t\t<p>대분류</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"categoryD\" value=\"A\">외국어 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryD\" value=\"B\">IT <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryD\" value=\"C\">라이프스타일 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryD\" value=\"D\">취업\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!--소분류 외국어-->\r\n");
      out.write("\t\t\t\t<div class=\"CSA\">\r\n");
      out.write("\t\t\t\t\t<p>소분류</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"categoryS\" value=\"1\">토익 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"2\">토플 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"3\">텝스 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"4\">토스/오픽 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"5\">회화 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"6\">작문/독해 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"7\">중국어 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"8\">일본어 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"9\">기타\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!-- 소분류IT -->\r\n");
      out.write("\t\t\t\t<div class=\"CSB\">\r\n");
      out.write("\t\t\t\t\t<p>소분류</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"categoryS\" value=\"1\">컴퓨터언어 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"2\">웹프로그래밍 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"3\">모바일프로그래밍 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"4\">데이터베이스/서버 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"5\">게임프로그래밍 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"6\">문서작성 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"7\">자격증 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"8\">기타\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!-- 소분류라이프스타일 -->\r\n");
      out.write("\t\t\t\t<div class=\"CSC\">\r\n");
      out.write("\t\t\t\t\t<p>소분류</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"categoryS\" value=\"1\">미술/디자인 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"2\">뷰티/미용 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"3\">스포츠 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"4\">음악/공연 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"5\">게임 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"6\">기타\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!-- 소분류취업 -->\r\n");
      out.write("\t\t\t\t<div class=\"CSD\">\r\n");
      out.write("\t\t\t\t\t<p>소분류</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"categoryS\" value=\"1\">면접 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"2\">자소서 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"3\">고시 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"4\">기술 <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"checkbox\" name=\"categoryS\" value=\"5\">기타\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!--두번째 페이지-->\r\n");
      out.write("\t\t<div class=\"register2\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--최대인원-->\r\n");
      out.write("\t\t\t<div class=\"studymax\">\r\n");
      out.write("\t\t\t\t<p>최대인원</p>\r\n");
      out.write("\t\t\t\t<input type=\"number\" name=\"max\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--지역분류-->\r\n");
      out.write("\t\t\t<div class=\"studyRegion\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!--대분류-->\r\n");
      out.write("\t\t\t\t<div class=\"RD\">\r\n");
      out.write("\t\t\t\t\t<p>지역대분류</p>\r\n");
      out.write("\t\t\t\t\t<select class=\"rDId\" name=\"rDId\">\r\n");
      out.write("\t\t\t\t\t\t<option selected>--</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"A\">서울</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"B\">경기도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"C\">인천광역시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"D\">세종틀별자치시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"E\">강원도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"F\">충청북도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"G\">충청남도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"H\">대전광역시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"I\">대구광역시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"J\">경상북도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"K\">경상남도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"L\">전라북도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"M\">전라남도</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"N\">광주광역시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"O\">부산광역시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"P\">울산광역시</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Q\">제주특별시</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!--소분류//나중에추가하기-->\r\n");
      out.write("\t\t\t\t<div class=\"RSP\">\r\n");
      out.write("\t\t\t\t\t<p>지역소분류</p>\r\n");
      out.write("\t\t\t\t\t<select class=\"rSId\" name=\"rSId\">\r\n");
      out.write("\t\t\t\t\t\t<option selected>--</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"1\">남구</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"2\">동구</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"3\">북구</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"4\">울주군</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"5\">중구</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--연령-->\r\n");
      out.write("\t\t\t<div class=\"studyage\">\r\n");
      out.write("\t\t\t\t<p>연령</p>\r\n");
      out.write("\t\t\t\t<input type=\"checkbox\" name=\"age\" value=\"10대\">10대 <input\r\n");
      out.write("\t\t\t\t\ttype=\"checkbox\" name=\"age\" value=\"20대\">20대 <input\r\n");
      out.write("\t\t\t\t\ttype=\"checkbox\" name=\"age\" value=\"30대\">30대 <input\r\n");
      out.write("\t\t\t\t\ttype=\"checkbox\" name=\"age\" value=\"40대\">40대 <input\r\n");
      out.write("\t\t\t\t\ttype=\"checkbox\" name=\"age\" value=\"50대\">50대 <input\r\n");
      out.write("\t\t\t\t\ttype=\"checkbox\" name=\"age\" value=\"무관\">무관\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--요일별-->\r\n");
      out.write("\t\t\t<div class=\"studysc\">\r\n");
      out.write("\t\t\t\t<p>요일</p>\r\n");
      out.write("\t\t\t\t<select class=\"sc\" name=\"sc\">\r\n");
      out.write("\t\t\t\t\t<option selected>--</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"월요일\">월요일</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"화요일\">화요일</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"수요일\">수요일</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"목요일\">목요일</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"금요일\">금요일</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"토요일\">토요일</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"일요일\">일요일</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!-- 시작날짜 -->\r\n");
      out.write("\t\t\t<div class=\"studysd\">\r\n");
      out.write("\t\t\t\t<p>시작날짜</p>\r\n");
      out.write("\t\t\t\t<input type=\"date\" name=\"sd\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--시작시간//나중에추가하기-->\r\n");
      out.write("\t\t\t<div class=\"studyst\">\r\n");
      out.write("\t\t\t\t<p>시작시간</p>\r\n");
      out.write("\t\t\t\t<select class=\"st\" name=\"st\">\r\n");
      out.write("\t\t\t\t\t<option selected>--</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"1시\">1시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"2시\">2시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"3시\">3시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"4시\">4시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"5시\">5시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"6시\">6시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"7시\">7시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"8시\">8시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"9시\">9시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"10시\">10시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"11시\">11시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"12시\">12시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"13시\">13시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"14시\">14시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"15시\">15시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"16시\">16시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"17시\">17시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"18시\">18시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"19시\">19시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"20시\">20시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"21시\">21시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"22시\">22시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"23시\">23시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"24시\">24시</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!--끝나는시간//나중에추가하기-->\r\n");
      out.write("\t\t\t<div class=\"studyet\">\r\n");
      out.write("\t\t\t\t<p>끝나는시간</p>\r\n");
      out.write("\t\t\t\t<select class=\"et\" name=\"et\">\r\n");
      out.write("\t\t\t\t\t<option selected>--</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"1시\">1시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"2시\">2시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"3시\">3시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"4시\">4시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"5시\">5시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"6시\">6시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"7시\">7시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"8시\">8시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"9시\">9시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"10시\">10시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"11시\">11시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"12시\">12시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"13시\">13시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"14시\">14시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"15시\">15시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"16시\">16시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"17시\">17시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"18시\">18시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"19시\">19시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"20시\">20시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"21시\">21시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"22시\">22시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"23시\">23시</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"24시\">24시</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!--3번째 페이지-->\r\n");
      out.write("\t\t<div class=\"register3\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<!--내용-->\r\n");
      out.write("\t\t\t<div class=studycontent>\r\n");
      out.write("\t\t\t\t<p>추가글</p>\r\n");
      out.write("\t\t\t\t<textarea name=\"content\" row=\"10\"></textarea>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!-- 파일업로드부분 -->\r\n");
      out.write("\t\t\t<div class=\"studyfile\">\r\n");
      out.write("\t\t\t\t<P>파일업로드</P>\r\n");
      out.write("\t\t\t\t<input type=\"file\" name=\"file\">파일을 골라주세용\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<h3>Ajax File upload</h3>\r\n");
      out.write("\t\t\t\t<div class='fileDrop'></div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class='uploadedList'></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<button type=\"submit\">종료</button>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\t<iframe name=\"zeroFrame\"></iframe>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- 일등록 핸들러 -->\r\n");
      out.write("\t<script id=\"template\" type=\"text/x-handlebars-template\">\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"mailbox-attachment-info\">\r\n");
      out.write("\r\n");
      out.write("\t\t<span class=\"mailbox-attachment-icon has-img\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<img src=\"{{imgsrc}}\" alt=\"Attachment\">\r\n");
      out.write("\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\r\n");
      out.write("\t\t<a href=\"{{getLink}}\" class=\"mailbox-attachment-name\">{{fileName}}</a>\r\n");
      out.write("\r\n");
      out.write("\t\t<small class = \"small\" value = \"{{name}}\" data-src=data style=\"cursor:pointer\">X</small>\r\n");
      out.write("\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\r\n");
      out.write("\t\tvar template = Handlebars.compile($(\"#template\").html());\r\n");
      out.write("\r\n");
      out.write("\t\t$(\".fileDrop\").on(\"dragenter dragover\", function(event){\r\n");
      out.write("\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t//파일을 떨구는 장소\t\r\n");
      out.write("\r\n");
      out.write("\t\t$(\".fileDrop\").on(\"drop\", function(event){\r\n");
      out.write("\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar files = event.originalEvent.dataTransfer.files;\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar file = files[0];\r\n");
      out.write("\r\n");
      out.write("\t\t\tconsole.log(file);\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar formData = new FormData();\r\n");
      out.write("\r\n");
      out.write("\t\t\tformData.append(\"file\", file);\r\n");
      out.write("\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\r\n");
      out.write("\t\t\t\turl: '/study/uploadAjax',\r\n");
      out.write("\t\t\t\tdata: formData,\r\n");
      out.write("\t\t\t\tdataType: 'text',\r\n");
      out.write("\t\t\t\tprocessData: false,\r\n");
      out.write("\t\t\t\tcontentType: false,\r\n");
      out.write("\t\t\t\ttype: 'POST',\r\n");
      out.write("\t\t\t\t//파일을 드롭했을때 성공시\r\n");
      out.write("\t\t\t\tsuccess: function(data){\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tvar fileInfo = getFileInfo(data);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\tvar html = template(fileInfo);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t$(\".uploadedList\").append(html);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t//취소버튼\r\n");
      out.write("\t\t$(\".uploadedList\").on(\"click\", \"small\", function(event){\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar that = $(this);\r\n");
      out.write("\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl:\"deleteFile\",\r\n");
      out.write("\t\t\t\ttype:\"post\",\r\n");
      out.write("\t\t\t\tdata:{fileName:$(this).attr(\"data-src\")},\r\n");
      out.write("\t\t\t\tdataType:\"text\",\r\n");
      out.write("\t\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\t\tif(result == 'deleted') {\r\n");
      out.write("\t\t\t\t\t\talert(\"deleted\");\r\n");
      out.write("\t\t\t\t\t\tthat.parent(\"div\").remove();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t//스터디 보드 등록후 이미지 등록을 위해서\r\n");
      out.write("\t\t$(\"#registerForm\").submit(function(event){\r\n");
      out.write("\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar that = $(this);\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar str = \"\";\r\n");
      out.write("\r\n");
      out.write("\t\t\t$(\".uploadedList .small\").each(function(index){\r\n");
      out.write("\t\t\t\tstr += \"<input type='hidden' name='files[\"+index+\"]' value='\"+$(this).attr(\"value\")+\"'>\";\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\tthat.append(str);\r\n");
      out.write("\r\n");
      out.write("\t\t\tthat.get(0).submit();\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
