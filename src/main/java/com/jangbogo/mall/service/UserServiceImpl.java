package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.AddressDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.Email;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.utils.Utils;
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

    @Autowired
    Utils utils;

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
    public int sendPwdEmail(String nick_nm, String toEmail) throws Exception {
        String tmpPwd = utils.createRandomStr();
        String encodedPwd = passwordEncoder.encode(tmpPwd);

        int result = dao.updatePwd(encodedPwd, nick_nm, toEmail); //임시비번으로 비번 업데이트.

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

    @Override
    public int regSocialUser(User user) throws Exception {
        return dao.insertSocialUser(user);
    }

    @Override
    public int registerUser(User user, Address addr) throws Exception {
        final int SUCCESS = 1;
        final int FAILED = 0;

        addr.setRcpr_nm(user.getNick_nm()); //수령자명
        addr.setRcpr_mobl_no(user.getMpno()); //수령자전화번호
        addr.setIs_default_yn("Y"); //최초 회원가입시 insert한 배송지가 기본배송지다.

        user.setPwd(passwordEncoder.encode(user.getPwd()));

        try {
            dao.insertUser(user); //회원 insert
            addrDao.insertAddr(user.getIdx(), addr); // 배송지 insert
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            if (user.getIdx() != 0)  //회원이 이미 insert된 경우 회원도 삭제
                dao.deleteUser(user.getIdx(), user.getEmail());
            return FAILED;
        }
    }

    @Override
    public int updateLoginTm(int idx, String email) throws Exception {
        return dao.updateLoginTm(idx, email);
    }

    @Override
    public boolean isNickDuplicated(String nick_nm) throws Exception {
        return dao.getUserByNick(nick_nm) != null;
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
        if (user.getPwd() == "") { //새 비번이 없는 경우
            User prevUser = getUserByEmail(user.getEmail()); //이메일로 기존 회원 조회
            user.setPwd(prevUser.getPwd()); //기존 비번 그대로 insert
        } else { //프론트에서 비번이 같을 경우 비활성화 해서 비번이 != ""일 경우 기존 값과 다른다.
            updatePwdUptTm(user.getIdx(), user.getEmail());
            user.setPwd(passwordEncoder.encode(user.getPwd()));
        }
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
