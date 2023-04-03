//package com.jangbogo.mall.service;
//
//import com.jangbogo.mall.dao.FindUserDao;
//import com.jangbogo.mall.domain.User;
//import org.apache.commons.mail.HtmlEmail;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//
//
//@Service
//public class UserServiceImpl {
//
//    @Autowired
//    FindUserDao dao;
//
//    @Autowired
//    BCryptPasswordEncoder passwordEncoder;
//
//    @Bean
//    BCryptPasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    public void sendEmail(String tempPwd, String toEmail) throws Exception {
//
//        // Mail Server 설정
//        String charSet = "utf-8";
//        String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
//        String hostSMTPid = "jinvicky"; //네이버 계정 아이디 넣기
//        String hostSMTPpwd = "jin8748!"; //네이버 계정 비밀번호.
//
//        // 보내는 사람 EMail, 제목, 내용
//        String fromEmail = "jinvicky@naver.com";
//        String fromName = "진이마켓";
//        String subject = "진이마켓을 이용해주셔서 감사합니다. 임시 비밀번호입니다.";
//        String msg = "";
//
//        //임시 비번을 생성해서 이메일 메시지에 첨부한다.
//        msg += "<p>임시 비밀번호" + tempPwd +"</p> ";
//
//        // 받는 사람 E-Mail 주소
//        String mail = toEmail; //사용자로부터 입력받은 이메일 주소로 하면 된다.
//        try {
//            HtmlEmail email = new HtmlEmail();
//            email.setDebug(true);
//            email.setCharset(charSet);
//            email.setSSL(true);
//            email.setHostName(hostSMTP);
//            email.setSmtpPort(587); //네이버 이용시 587이라고 한다.
//
//            email.setAuthentication(hostSMTPid, hostSMTPpwd);
//            email.setTLS(true);
//            email.addTo(mail, charSet);
//            email.setFrom(fromEmail, fromName, charSet);
//            email.setSubject(subject);
//            email.setHtmlMsg(msg);
//            email.send();
//        } catch (Exception e) {
//            System.out.println("메일발송 실패 : " + e);
//        }
//    }
//
//    //디비를 임시 비번으로 업데이트 한다.
//    public void updateWithTempPwd (User user) throws Exception {
//
//        user.setPwd(passwordEncoder.encode(user.getPwd()) + ""); //비밀번호를 먼저 인코딩한다.
//        dao.updateWithTempPwd(user);
//    }
//
//    // id + email을 가진 유저가 존재하는 지 여부를 체크하는 메서드
//    public boolean isUserPresent (User user) throws Exception {
//        return dao.checkExistingUser(user) == 1;
//    }
//
//    //난수를 만들어서 메일도 보내고 업데이트 메서드한테도 전달한다.
//    public void doPasswordFind(User user) throws Exception {
//        //1. 난수를 만든다.
//        String pw = "";
//        for (int i = 0; i < 12; i++) {
//            pw += (char) ((Math.random() * 26) + 97);
//        };
//
//        user.setPwd(pw); // 임시 비번을 유저에 저장한다.
//        //1. 이메일에 난수를 담아 전송한다.
//        sendEmail(user.getPwd(), user.getEmail());
//        //2. 인코딩해서 디비를 업데이트 친다.
//        updateWithTempPwd(user); //디비로 업데이트 친다.
//    }
//
//
///**    난수를 생성해서 그걸 이메일에도 던져주고 디비에 업데이트도 해야한다. 이때 호출 플로우와 순서는 어떻게 되는가?
// * 하나는 날값으로 이메일로 던지고
// * 디비에 넣을 떄는 패스워드 인코딩을 해서 던진다.
// *
// * **/
///**
// * 1. 아이디와 이메일을 입력한다. 둘 중 하나라도 널 값이면 프론트단에서 alert 또는 에러메세지로 return false; 처리한다.
// * (여담으로 이메일 형식이 제대로 되었는 지도 확인을 해야 한다.)
// * 2. 아이디와 이메일이 제대로 넘어왔다! 그러면 두 값을 비교하는 dao.getUser(String id, String email) 메서드를 만든다.
// *메서드 호출값이 널이면 해당 사용자가 존재하지 않습니다. 를 남긴다.
// * 유저가 존재하면 받은 이메일 경로로 임시 비번을 생성해서 이메일을 전송한다.
// * 그리고 입력하신 이메일로 임시 비밀번호를 전송하였습니다. 라고 메세지를 남긴다.
// *
// * 여기서 메세지를 어떻게 alert 등의 식으로 사용자에게 리턴할 지를 모르겠다.
// * 그래서 일단 sout로 로그를 찍기로 했다.
// *
// * */
//
////    //비밀번호찾기
////    public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
////        response.setContentType("text/html;charset=utf-8");
////        MemberVO ck = mdao.readMember(vo.getId());
////        PrintWriter out = response.getWriter();
////        // 가입된 아이디가 없으면
//////        if(mdao.idCheck(vo.getId()) == null) {
//////            out.print("등록되지 않은 아이디입니다.");
//////            out.close();
//////        }
////        // 가입된 이메일이 아니면
////        else if(!vo.getEmail().equals(ck.getEmail())) {
////            out.print("등록되지 않은 이메일입니다.");
////            out.close();
////        }else {
////            // 임시 비밀번호 생성
////            String pw = "";
////            for (int i = 0; i < 12; i++) {
////                pw += (char) ((Math.random() * 26) + 97);
////            }
////            vo.setPw(pw);
////            // 비밀번호 변경
////            mdao.updatePw(vo);
////            // 비밀번호 변경 메일 발송
////            sendEmail(vo, "findpw");
////
////            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
////            out.close();
////        }
////    }
//}
