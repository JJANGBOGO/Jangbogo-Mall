package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.AttachFileDto;
import org.springframework.core.io.Resource; // import 주
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Controller
@Slf4j //오.
public class UploadController {

    private String uploadFolder = "/Users/namgungjin/Desktop/upload/temp";

    @GetMapping("/uploadAjax")
    public void uploadAjax() {
        log.info("upload ajax");
    }

    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-", File.separator);
    }

    private boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<AttachFileDto>> uploadAjaxPost(MultipartFile[] uploadFile) {

        //새로운 ArrList를 생성한다.
        List<AttachFileDto> list = new ArrayList<>();
        //업로드할 폴더의 경로를 절대 경로로 정한다.
        String uploadFolder = "/Users/namgungjin/Desktop/upload/temp";

        String uploadFolderPath = getFolder();

        //시간별로 폴더를 생성하는 코드를 추가한다. mkdirs()
        File uploadPath = new File(uploadFolder, uploadFolderPath);
        log.info("upload path :::" + uploadPath);

        //내가 폴더를 만들려는 경로가 존재하지 않을때만! 해당 경로로 폴더를 만든다.
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }// 년/월/일로 폴더를 생성한다.

        //여러 파일들이 업로드 되었을 때
        for (MultipartFile multipartFile : uploadFile) {

            //새로운 AttachFileDTO 객체를 만든다.
            AttachFileDto attachDTO = new AttachFileDto();

            //업로드 파일의 실제 이름을 저장한다.
            String uploadFileName = multipartFile.getOriginalFilename();

            //IE has file path => 오직 파일 이름만 가져오도록 일부를 자르는 메서드인 거 같다.
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            log.info("only file name: " + uploadFileName);
            //업로드할 파일명을 attachDTO의 파일 이름으로 정한다.
            attachDTO.setFileName(uploadFileName);

            //파일 이름은 동일한 이름일 경우 기존 파일이 지워지므로 uuid를 추가한다.
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            //새로운 File 객체를 생성해서 업로드할 폴더 경로와 업로드할 파일 이름(가공완)을 넣는다.
//            File saveFile = new File(uploadFolder, uploadFileName);
            //기존에 temp 폴더에 업로드를 하는 게 아니라 폴더에 날짜를 섞어서 만든 파일 객체 uploadPath를 넣는다.

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                //만든 파일 객체를 내 upload 폴더에 저장한다.
                multipartFile.transferTo(saveFile); //예외 발생 가능한 메서드라서 catch안 하면 빨간줄이 뜬다.

                //uuid랑 uploadPath 까먹지 말고 해라! 안 그러면 아젝스가 Null 나옴~~~
                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);

                //이미지 타입 검사를 합니다. 이미지 타입이라면 썸네일을 생성하겠습니다.
                if (checkImageType(saveFile)) {

                    //attachDTO의 이미지 저장값을 true로 돌린다.
                    attachDTO.setImage(true);

                    //fileoutputStream을 이용해서 만든 썸네일을 메이븐 섬네일레이터를 통해서 100*100 사이즈로 만들고 썸네일레이터를 닫는다.
                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
                    thumbnail.close();
                }

                //위에서 만든 arrayList에 attachDTO를 추가한다.
                list.add(attachDTO);

            } catch (Exception e) {
                e.printStackTrace();
            } //end catch
        } //end for

        //최종적으로 리스트와 Http 상태코드를 함께 <>해서 리턴한다.
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    //특정한 파일 이름을 받아서 이미지 데이터를 전송하는 코드
    @GetMapping(value = {"/display", "/{view_dir}/display"}) // view 폴더 추가
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {
        log.info("fileName: " + fileName); // 받아온 파일 이름 확인

        //temp/ 필요 => 진짜 이것 땜에 삽질 오졌다고ㅜㅜㅜ
        File file = new File("/Users/namgungjin/Desktop/upload/temp/" + fileName); // 파일 업로드할 폴더 경로랑 파일 이름 합쳐서 파일 객체 생성.

        log.info("file: " + file); // 파일 객체 제대로 만들어졌나 로그로 확인

        ResponseEntity<byte[]> result = null; // 바이트 배열 지네릭의 responseEntity null로 초기화.

        try {
            HttpHeaders header = new HttpHeaders();// 새로운 HttpHeaders를 생성한다.

            header.add("Content-Type", Files.probeContentType(file.toPath())); // content type을 지정한다. 컨텐트 타입 조사메서드를 쓴다.
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); // 바이트배열로 카피한 파일과, 헤더, 상태코드 200을 지네릭 바이트 배열에 담는다.

        } catch (IOException e) {
            e.printStackTrace(); //에러가 생길 경우 로그를 찍는다.

        }
        return result;
    }

    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
        log.info("download file: " + fileName);

        //import를 꼭 org.springframework.core.io.Resource로 해야 한다.
        Resource resource = new FileSystemResource("/Users/namgungjin/Desktop/upload/temp/" + fileName);
        log.info("resource: " + resource);

        //만약에 resource가 존재하지 않는다면 Http notfound를 리턴한다.
        if (resource.exists() == false) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        //---- resourceName을 만든다.
        String resourceName = resource.getFilename();

        //________________________ remove uuid
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") +1);
        log.info("uuid::: "+ resourceOriginalName);

        HttpHeaders headers = new HttpHeaders(); //httpheader를 생성한다.
        try {
            //downloadName을 초기화한다.
            String downloadName = null;

            //만약에 userAgent가 Trident를 포함하고 있으면 IE browser라는 로그를 출력한다.
            if (userAgent.contains("Trident")) {
                log.info("IE browser");
                //resouceName을 utf-8로 인코딩하고 특정 문자를 ""로 바꾼다.
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", "");
            } else if(userAgent.contains("Edge")) {
                log.info("Edge browser"); //Edge를 가지고 있으면 엣지 브라우저라는 뜻이다.

                downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8"); //edge는 iso 어쩌고 인코딩을 적용하지 않습니다.
                log.info("Edge name: "+ downloadName);
            } else {
                log.info("Chrome browser"); //크롬 브라우저다.
                downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
            }

            headers.add("Content-Disposition",
                    "attachment; filname=" + downloadName); //진짜 잘 좀 봐라!!!!!!!!!
        } catch (UnsupportedEncodingException e) { //지원하지 않는 인코딩 예외처리
            e.printStackTrace();
        }
        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }

    @PostMapping("/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteFile(String fileName, String type) {
        log.info("deleteFile: "+ fileName);
        File file;

        try {
            file = new File("/Users/namgungjin/Desktop/upload/temp/" + URLDecoder.decode(fileName, "UTF-8"));

            file.delete();

            if(type.equals("image")){
                String largeFileName = file.getAbsolutePath().replace("s_", "");
                log.info("largeFileName: "+ largeFileName);
                file = new File(largeFileName);
                file.delete();
            }
        }catch(UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
}
