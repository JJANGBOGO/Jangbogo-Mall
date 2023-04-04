package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Email;
import com.jangbogo.mall.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao dao;

    @Autowired
    EmailSender emailSender;

    @Override
    public int withdrawUser(int idx, String email) throws Exception {
        return dao.deleteUser(idx, email);
    }

    @Override
    public String findUserEmail(String nick_nm, String pwd) throws Exception {
        return dao.selUserEmail(nick_nm, pwd);
    }

    @Override
    public boolean isUserPresent(String nick_nm, String email) throws Exception {
        return dao.selUserByEmail(nick_nm, email) != null;
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

        int result = updatePwd(tmpPwd, nick_nm, toEmail); //임시비번으로 비번 업데이트.

        if (result != 0) {
            Email email = Email.builder()
                    .fromEmail("jinvicky17@gmail.com") //장보고 이메일
                    .toEmail(toEmail)
                    .title("임시 비밀번호 전달")
                    .content("<table\n" +
                            "      align=\"center\"\n" +
                            "      cellpadding=\"0\"\n" +
                            "      cellspacing=\"0\"\n" +
                            "      border=\"0\"\n" +
                            "      width=\"800\"\n" +
                            "      style=\"background: #fff\"\n" +
                            "    >\n" +
                            "      <tbody>\n" +
                            "        <tr>\n" +
                            "          <td style=\"height: 22px; font-size: 0; line-height: 0\">&nbsp;</td>\n" +
                            "        </tr>\n" +
                            "        <tr>\n" +
                            "          <td>\n" +
                            "            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                            "              <tbody>\n" +
                            "                <tr style=\"background-color: #ff9f3e\">\n" +
                            "                  <td width=\"280\">&nbsp;</td>\n" +
                            "                  <td\n" +
                            "                    width=\"200\"\n" +
                            "                    style=\"\n" +
                            "                      font-weight: bold;\n" +
                            "                      font-size: 30px;\n" +
                            "                      text-align: center;\n" +
                            "                      padding: 25px;\n" +
                            "                    \"\n" +
                            "                  >\n" +
                            "                    JANGBOGO\n" +
                            "                  </td>\n" +
                            "                  <td width=\"280\">&nbsp;</td>\n" +
                            "                </tr>\n" +
                            "              </tbody>\n" +
                            "            </table>\n" +
                            "          </td>\n" +
                            "        </tr>\n" +
                            "        <tr>\n" +
                            "          <td style=\"height: 13px; font-size: 0; line-height: 0\">&nbsp;</td>\n" +
                            "        </tr>\n" +
                            "        <tr>\n" +
                            "          <td align=\"center\">\n" +
                            "            <p\n" +
                            "              style=\"\n" +
                            "                margin: 0;\n" +
                            "                padding: 0;\n" +
                            "                font-size: 25px;\n" +
                            "                font-weight: bold;\n" +
                            "                color: #333;\n" +
                            "                line-height: 100px;\n" +
                            "                letter-spacing: -0.1px;\n" +
                            "              \"\n" +
                            "            >\n" +
                            "              안녕하세요 최고의 서비스를 자랑하는 장보고입니다.\n" +
                            "            </p>\n" +
                            "            <p\n" +
                            "              style=\"\n" +
                            "                margin: 0;\n" +
                            "                padding: 0;\n" +
                            "                font-size: 18px;\n" +
                            "                color: #333;\n" +
                            "                line-height: 18px;\n" +
                            "                letter-spacing: -0.1px;\n" +
                            "              \"\n" +
                            "            >\n" +
                            "              요청에 따라 임시 비밀번호를 전송해 드립니다.\n" +
                            "            </p>\n" +
                            "\n" +
                            "            <p>\n" +
                            "              <strong\n" +
                            "                style=\"\n" +
                            "                  font-size: 20px;\n" +
                            "                  color: #333;\n" +
                            "                  line-height: 40px;\n" +
                            "                  letter-spacing: -0.1px;\n" +
                            "                \"\n" +
                            "                >" + tmpPwd + "</strong\n" +
                            "              >\n" +
                            "            </p>\n" +
                            "          </td>\n" +
                            "        </tr>\n" +
                            "        <tr>\n" +
                            "          <td style=\"height: 19px; font-size: 0; line-height: 0\">&nbsp;</td>\n" +
                            "        </tr>\n" +
                            "        <tr>\n" +
                            "          <td style=\"height: 29px; font-size: 0; line-height: 0\">&nbsp;</td>\n" +
                            "        </tr>\n" +
                            "        <tr>\n" +
                            "          <td\n" +
                            "            style=\"\n" +
                            "              height: 80px;\n" +
                            "              font-size: 0;\n" +
                            "              line-height: 0;\n" +
                            "              background-color: #e4e4e4;\n" +
                            "              color: black;\n" +
                            "            \"\n" +
                            "          ></td>\n" +
                            "        </tr>\n" +
                            "      </tbody>\n" +
                            "    </table>")
                    .build();
            emailSender.sendMail(email);
            return 1; //성공
        }
        return 0; //실패.
    }

    //임시 비번 생성
    public String createTmpPwd() {
        String pwd = "";
        for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
        }
        return pwd;
    }

}
