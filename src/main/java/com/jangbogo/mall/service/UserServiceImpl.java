package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.AddressDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.Email;
import com.jangbogo.mall.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;


@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao dao;

    @Autowired
    AddressDao addrDao;

    @Autowired
    EmailSender emailSender;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    public int withdrawUser(int idx, String email) throws Exception {
        return dao.deleteUser(idx, email);
    }

    @Override
    public boolean isUserPresent(String nick_nm, String email) throws Exception {
        User user = dao.getUserByNick(nick_nm);
        return user != null && Objects.equals(email, user.getEmail());
    }

    @Override
    public User selectUser(int idx) throws Exception {
        return dao.selectUser(idx);
    }

    @Override
    public int updatePwd(String pwd, String nick_nm, String email) throws Exception {
        return dao.updatePwd(pwd, nick_nm, email);
    }

    @Override
    public int sendPwdEmail(String nick_nm, String toEmail) throws Exception {
        String tmpPwd = createTmpPwd();
        String encodedPwd = passwordEncoder.encode(tmpPwd);

        int result = updatePwd(encodedPwd, nick_nm, toEmail); //임시비번으로 비번 업데이트.

        if (result != 0) {
            Email email = Email.builder()
                    .fromEmail("jinvicky17@gmail.com") //장보고 이메일
                    .toEmail(toEmail)
                    .title("임시 비밀번호 전달")
                    .content("회원님의 임시 비밀번호는 " + tmpPwd + " 입니다.")
                    .build();
            emailSender.sendMail(email);
            return 1; //성공
        }
        return 0; //실패.
    }

    @Override
    public User getUserByEmail(String email) throws Exception {
        return dao.getUserByEmail(email);
    }

    //임시 비번 생성
    public String createTmpPwd() {
        String pwd = "";
        for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
        }
        return pwd;
    }

    @Override
    public int regSocialUser(User user) throws Exception {
        return dao.insertSocialUser(user);
    }

    @Override
    @Transactional
    public int registerUser(User user, Address addr) throws Exception {
        final int SUCCESS = 1;
        final int FAILED = 0;

        addr.setRcpr_nm(user.getNick_nm()); //수령자명
        addr.setRcpr_mobl_no(user.getMpno()); //수령자전화번호
        addr.setIs_default_yn("Y"); //최초 회원가입시 insert한 배송지가 기본배송지다.

        user.setPwd(passwordEncoder.encode(user.getPwd()));

        int userResult = dao.insertUser(user); //성공시 idx 리턴
        int addrResult = addrDao.insertAddr(user.getIdx(), addr); //성공시 1

        return (userResult != 0 && addrResult != 0) ? SUCCESS : FAILED;
    }

    @Override
    public int updateLoginTm(int idx, String email) throws Exception {
        return dao.updateLoginTm(idx, email);
    }

    @Override
    public User chkDuplicateNick(String nick_nm) throws Exception {
        return dao.getUserByNick(nick_nm);
    }

    //    이메일과 회원번호가 일치하는 지 확인
    @Override
    public boolean verifyUser(String email, String pwd) throws Exception {
        User user = getUserByEmail(email);
        String encodedPwd = user.getPwd();

        return passwordEncoder.matches(pwd, encodedPwd);
    }

    @Override
    public int updateUser(User user) throws Exception {
        String email = user.getEmail();
        User prev_user = getUserByEmail(email);

        if (!passwordEncoder.matches(user.getPwd(), prev_user.getPwd())) {
            updatePwdUptTm(user.getIdx(), email); //비번변경날짜 수정
        }

        user.setPwd(passwordEncoder.encode(user.getPwd())); //패스워드 인코딩
        return dao.updateUser(user);
    }

    @Override
    public int updatePwdUptTm(int idx, String email) throws Exception {
        return dao.updatePwdUptTm(idx, email);
    }

    @Override
    public String findUserEmail(String nick_nm, String pwd) throws Exception {
        User user = dao.getUserByNick(nick_nm);

        if (user == null || !passwordEncoder.matches(pwd, user.getPwd())) return null;
        if (user.getState_cd() == 3) return null;
        return user.getEmail();
    }


}
