package com.xingda.work.controller;

import com.xingda.utils.PhotoUtil;
import com.xingda.utils.StringUtil;
import com.xingda.work.domain.WorkOrder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/genergy")
public class WorkOrderController {

    @RequestMapping(value = "/addWorkOrder", method = RequestMethod.GET)
    public String addWrokOrder() {
        return "addWorkOrder";
    }

    @RequestMapping(value = "/addWorkOrder", method = RequestMethod.POST)
    @ResponseBody
    public Object addWrokOrder(WorkOrder workOrder, @RequestParam(value = "file", required = false) MultipartFile file, int mark,
                               HttpServletRequest req) {

        try {
            if (file != null) {
                String servletContext = req.getSession().getServletContext().getRealPath("/");
                String imgPath = PhotoUtil.photoUpload(file, "static/images/work/", StringUtil.makeFileName()
                        , servletContext);
                String context = req.getSession().getServletContext().getRealPath("/");
                switch (mark) {
                    case 1:
                        PhotoUtil.removePhoto(context + workOrder.getImg1().substring(1));
                        workOrder.setImg1(imgPath);
                        break;
                    case 2:
                        PhotoUtil.removePhoto(context + workOrder.getImg2().substring(1));
                        workOrder.setImg2(imgPath);
                        break;
                    case 3:
                        PhotoUtil.removePhoto(context + workOrder.getImg3().substring(1));
                        workOrder.setImg3(imgPath);
                        break;
                    case 4:
                        PhotoUtil.removePhoto(context + workOrder.getImg4().substring(1));
                        workOrder.setImg4(imgPath);
                        break;
                }

            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }

    }
}
