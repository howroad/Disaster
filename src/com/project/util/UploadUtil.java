package com.project.util;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * 
 * @author 赵子墨
 *
 */
public class UploadUtil {
	private HttpServletRequest request = null;
	private ServletContext sc = null;
	private Map<String, String> map = new HashMap<String, String>();
	public UploadUtil(HttpServletRequest request, ServletContext sc) {
		this.request = request;
		this.sc = sc;
	}
	public String getParameter(String key) {
		return map.get(key);
	}
	public void upload() {
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
		upload.setHeaderEncoding("utf-8");
		try {
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem fileItem : list) {
				if(fileItem.isFormField()) {
					map.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
				} else {
					String fileName = System.currentTimeMillis() + "_" + new File(fileItem.getName()).getName();
					fileItem.write(new File(sc.getRealPath("/upload"), fileName));
					map.put(fileItem.getFieldName(), fileName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
