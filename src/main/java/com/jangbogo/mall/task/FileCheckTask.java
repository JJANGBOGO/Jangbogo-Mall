//package com.fastcampus.ch4.task;
//
//
//import com.fastcampus.ch4.dao.AttachDao;
//import com.fastcampus.ch4.domain.AttachDTO;
//import lombok.Setter;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import java.io.File;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
//import java.util.List;
//import java.util.stream.Collectors;
//
//@Slf4j
//@Component
//public class FileCheckTask {
//
//    @Setter(onMethod_ = {@Autowired})
//    private AttachDao attachDao;
//
//    private String getFolderYesterDay() {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
//
//        Calendar cal = Calendar.getInstance();
//
//        cal.add(Calendar.DATE, -1);
//
//        String str = sdf.format(cal.getTime());
//
//        return str.replace("-", File.separator);
//    }
//
////    매일 새벽 두시에 동작하는 chcekFiles()
//    @Scheduled(cron = "0 0 2 * * *")
//    public void checkFiles() throws Exception {
//        log.warn("File check Task run................");
//        log.warn("new Date()");
//
//        List<AttachDTO> fileList = attachDao.getOldFiles();
//
//        List<Path> fileListPaths = fileList.stream().map(dto ->
//                Paths.get("업로드 경로",
//                        dto.getUploadPath(),
//                        dto.getUuid() +
//                                "_" +
//                                dto.getFileName())).collect(Collectors.toList());
//        // 이미지가 썸네일을 가지고 있는 지 확인한다.
//        fileList.stream()
//                .filter(dto -> dto.isFileType() == true)
//                .map(dto -> Paths.get("업로드 경로",
//                        dto.getUploadPath(),
//                        "s_" + dto.getUuid() + "_" + dto.getFileName()
//                )).forEach(p -> fileListPaths.add(p));
//
//        log.warn("===================");
//
//        fileListPaths.forEach(p -> log.warn(p));
//
//        File targetDir = Paths.get("업로드 경로", getFolderYesterDay()).toFile();
//
//        File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
//
//        log.warn("---------------------------");
//        for (File file : removeFiles) {
//            log.warn(file.getAbsolutePath());
//            file.delete();
//        }
//    }
//}
