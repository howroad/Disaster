package com.project.util;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.project.bean.AreaBean;

/**
 * 上传文件工具类
 * @author howroad
 * @Date 2018年3月22日
 * @version 1.0
 */
public abstract class LuUploadUtil<E> {
	/**
	 *保存二进制传过来的input的value值，档getBean报错的时候使用
	 */
	private Map<String,String> map1 = new TreeMap<String,String>();
	/**
	 * 只保存储存后的文件信息
	 */
	private Map<String,File> map2 = new TreeMap<String,File>();
	/**
	 * 按顺序保存value值
	 */
	private List<String> list1 = new ArrayList<String>();
	private Class<E> entityClass;
	public LuUploadUtil(HttpServletRequest request) {
		//取得List
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(dfif);
		try {
			List<FileItem> list = upload.parseRequest(request);
			//循环list设置map，并上传文件
			for (FileItem fileItem : list) {
				if(fileItem.isFormField()) {
					//设置map
					map1.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
					list1.add(fileItem.getString("utf-8"));
				}else {
					//执行上传操作
					String realDirectory = request.getServletContext().getRealPath("/upload");
					String oldName = new File(fileItem.getName()).getName();
					String newName = changeName(oldName);
					File file = new File(realDirectory,newName);
					fileItem.write(file);
					//设置map
					map1.put(fileItem.getFieldName(), newName);
					map2.put(fileItem.getFieldName(), file);
					list1.add(newName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getParameter(String key) {
		return map1.get(key);
	}
	private String changeName(String name) {
		return System.currentTimeMillis()+"_"+name;
	}
	/**
	 * 返回保存后的JavaBean 注意不要忘记ID
	 * @return JavaBean
	 */
	@SuppressWarnings({ "unchecked"})
	public E getBean() {
		ParameterizedType pt=(ParameterizedType)this.getClass().getGenericSuperclass();
		entityClass=(Class<E>) pt.getActualTypeArguments()[0];
		E entity=null;
		try {
			entity=(E) entityClass.getDeclaredConstructor().newInstance();
			//给E的每一个字段赋值
			Field[] fields=entityClass.getDeclaredFields();
			for(int i=0;i<map1.size()&&i<fields.length;i++) {
				fields[i].setAccessible(true);
				if(fields[i].getType()==int.class) {
					fields[i].set(entity, list1.get(i)==null?0:new Integer(list1.get(i)));
					continue;
				}
				if(fields[i].getType()==BigDecimal.class) {
					fields[i].set(entity, new BigDecimal(list1.get(i)));
					continue;
				}
				if(fields[i].getType()==AreaBean.class) {
					int areaId = Integer.parseInt(list1.get(i));
					fields[i].set(entity, new AreaBean(areaId, null, null, null, 0, null));
					continue;
				}
				fields[i].set(entity, list1.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
}
