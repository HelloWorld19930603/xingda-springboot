package com.xingda.work.controller;

import com.xingda.utils.PhotoUtil;
import com.xingda.utils.StringUtil;
import com.xingda.utils.SystemPage;
import com.xingda.work.domain.WorkOrder;
import com.xingda.work.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/genergy")
public class WorkOrderController {

    @Autowired
    WorkOrderService workOrderService;

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
                        if(StringUtil.isNotEmpty(workOrder.getImg1()))
                        PhotoUtil.removePhoto(context + workOrder.getImg1().substring(1));
                        workOrder.setImg1(imgPath);
                        workOrder.setTime1(new Date());
                        break;
                    case 2:
                        if(StringUtil.isNotEmpty(workOrder.getImg2()))
                        PhotoUtil.removePhoto(context + workOrder.getImg2().substring(1));
                        workOrder.setImg2(imgPath);
                        workOrder.setTime2(new Date());
                        break;
                    case 3:
                        if(StringUtil.isNotEmpty(workOrder.getImg3()))
                        PhotoUtil.removePhoto(context + workOrder.getImg3().substring(1));
                        workOrder.setImg3(imgPath);
                        workOrder.setTime3(new Date());
                        break;
                    case 4:
                        if(StringUtil.isNotEmpty(workOrder.getImg4()))
                        PhotoUtil.removePhoto(context + workOrder.getImg4().substring(1));
                        workOrder.setImg4(imgPath);
                        workOrder.setTime4(new Date());
                        break;
                }
            }
            if(workOrder.getId() == null) {
                return workOrderService.insert(workOrder);
            }else{
                workOrderService.update(workOrder);
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @RequestMapping(value = "getWorkOrder",method = RequestMethod.GET)
    public String getWorkOrder(){

        return "workOrder";
    }

    @RequestMapping(value = "getWorkOrder",method = RequestMethod.POST)
    @ResponseBody
    public SystemPage getWorkOrder(Integer userId, String customer){
        List list = workOrderService.selectAll(userId,customer);
        SystemPage page = new SystemPage(list.size(),list);
        return page ;
    }
}
