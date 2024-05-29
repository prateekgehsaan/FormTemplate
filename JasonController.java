package com.Jason;

import java.util.ArrayList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.LogInModel;
import com.crud.MainDao;
import com.crud.RegModel;


@Controller

public class JasonController 
{
	@ResponseBody
	@RequestMapping("hi")
	public String getString()
	{
		return "Welcome to rest api in web MVC";
		
	}
	
	@ResponseBody
	@RequestMapping("getemp")
	public EmployeeModel getEmp()
	{
		EmployeeModel emp = new EmployeeModel(1,"Alex" , 5000);
		
		return emp;
		
	}
	
	@ResponseBody
	@RequestMapping("getemplist")
	public List<EmployeeModel> getEmpList()
	{
		List<EmployeeModel> list = new ArrayList<EmployeeModel>();
		EmployeeModel e1= new EmployeeModel(1,"sachin",40000.5);
		EmployeeModel e2= new EmployeeModel(2,"Ishwar",56000.5);
		EmployeeModel e3= new EmployeeModel(3,"Smith",10000.5);
		
		list.add(e1);list.add(e2);list.add(e3);
		
		return list;
		
	}
	
	@Autowired
	MainDao dao ;
	
	@ResponseBody
	@RequestMapping("gettablelist")
	public List<RegModel> getList ()
	{
		List<RegModel> list = dao.getList();	
		
	return list;
		
	}
	
	@ResponseBody
	@RequestMapping("getcountry")
	public List<String> getCountry()
	{
		List<String> list = dao.getCountries();
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("getstate/{cname}")
	public List<String> getState(@PathVariable String cname)
	{	
		List<String> list = dao.getState(cname);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("getDetailById/{cid}")
	public List<RegModel> getDetailById2(@PathVariable int cid)
	{	
		List<RegModel> list = dao.getDetailById2(cid);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "savestudent",method = RequestMethod.POST)
	public String saveStudent(@RequestBody StudentModel student)
	{
		String str = " ";
		int status = dao.saveStudent(student);
		if (status>0)
		str = "save";
		else
			str = "fail";
		
		return str;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "updatenewdetail" , method = RequestMethod.POST)
	public String updatenewdetail(@RequestBody RegModel rm)
	{
		System.out.println("Test");
		int id = rm.getId();
		System.out.println("id runtime" +id);
		String str = " ";
		int status = dao.updateNewDetail(rm);
		if (status>0)
			str = "updated";
		else
			str = "faild";
		
		return str;
		
	}
	
	@ResponseBody
	@RequestMapping("deletebyid/{id}")
	public String deleteById(@PathVariable int id)
	{
		System.out.println("id is:- "+id);
		String str = " ";
		int status = dao.deleteById(id);
		if (status>0)
			str = "Deleted";	
		else
			str = "faild";
		return str;
		
	}

	
	@RequestMapping("/jregstrate")
	public String jregstrate()
	{
		return "JwebRegistration";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/savereg" , method = RequestMethod.POST)
	public String jSave(@RequestBody RegModel rm)
	{
		String str = " ";
		int status = dao.savereg(rm);
		
		if (status>0)
			str = "savereg";
			else
				str = "fail";
			
		return str;
		
	}
	
	@RequestMapping("/JwebLogin")
	public String jLog()
	{
		return "JwebLogin";
		
	}
	
	@ResponseBody 
	@RequestMapping(value = "/JdoLogin" , method = RequestMethod.POST)
	public String jDoLogin(@RequestBody LogInModel lm)
	{
		String str = " ";
		List<RegModel> list = dao.doLogin(lm);
		if (list!= null)
			str = "logsuccess";
			else
				str = "fail";
		return str;
		
	}
	
	@RequestMapping("/Jdash")
	public String jDash()
	{
		return "Jdashboard";
		
	}
	
	@RequestMapping("/jlog")
	public String jLog2()
	{
		return "JwebLogin";
		
	}
	
}
