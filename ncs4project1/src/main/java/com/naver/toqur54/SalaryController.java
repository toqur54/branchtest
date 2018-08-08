package com.naver.toqur54;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.toqur54.entities.Dept2;
import com.naver.toqur54.entities.Salary;
import com.naver.toqur54.entities.SalaryRoll;
import com.naver.toqur54.service.SalaryDao;

@Controller
public class SalaryController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Salary salary;
	@Autowired
	private Dept2 dept2;
	static String find;
	@Autowired
	private SalaryRoll salaryroll;
	
	@RequestMapping(value = "/salary_insert_form", method = RequestMethod.GET)	
	public String salary_insert_form(Model model) {
		SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
		ArrayList<Dept2> dept2 = dao.selectDept();
		model.addAttribute("dept2", dept2);
		
		return "salary/salary_insert_form";
	}
	//입력
	@RequestMapping(value = "/salary_insert", method = RequestMethod.POST)	
	public String salary_insert(@ModelAttribute Salary salary, Model model) {
		SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		salary.setInput_date(format.format(date));
		try {
			int result = dao.insertRow(salary);
			if(result >0) {
				model.addAttribute("msg","사원이 입력되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}
	
		return "member/member_result";
	}
	
	//중복체크
	@RequestMapping(value = "/salaryConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int salaryConfirm(@RequestParam String empno) {
		SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
		int exists = 0;
		try {
			exists = dao.selectConfirm(empno);
		} catch (Exception e) {
			System.out.println("confirm error : "+e.getMessage());
		}
		return exists;
	}
	
	//전체검색
		@RequestMapping(value = "/salary_search", method = RequestMethod.GET)	
		public String salary_search(Model model, String find) {
			if(find == null) find ="";
			//전체검색
			SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
			
			ArrayList<Salary> salarys = dao.selectAll();
			model.addAttribute("salarys", salarys);
			
			//find 검색 
//			int rowcount = dao.selectRowCount(find); 
			ArrayList<Salary> salary = dao.pageList(find); //페이징전
			model.addAttribute("salary", salary);
			 System.out.println("find:"+find);
			
			return "salary/salary_search";
		}
		
		
		//사원번호 클릭
		@RequestMapping(value = "/salary_update", method = RequestMethod.GET)	
		public String salary_update(Model model, @RequestParam String empno) {
			SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
			Salary salary = dao.selectOne(empno);
			model.addAttribute("salary", salary);
			
			ArrayList<Dept2> dept2 = dao.selectDept();
			model.addAttribute("dept2", dept2);
			
			
			return "salary/salary_update";
		}
		//update 사원
		@RequestMapping(value = "/salary_update_form", method = RequestMethod.POST)	
		public String salary_update_form(@ModelAttribute Salary salary,Model model	) {
			SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			salary.setInput_date(format.format(date));
			int result = dao.updateRow(salary);
			try {
				if(result > 0) {
					model.addAttribute("msg","사원이 수정되었습니다.");
				}
			} catch (Exception e) {
				System.out.println("--->>insert err:"+e.getMessage());
				e.printStackTrace();
			}
			return "member/member_result";
		}
		
		//삭제
		@RequestMapping(value = "/salaryDelete", method = RequestMethod.GET)	
		public String salaryDelete(Model model,@RequestParam String empno) {
			SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
			int result= dao.deleteRow(empno);
			if(result > 0) {
				model.addAttribute("msg", "사원이 삭제되었습니다.");
			}
			return "member/member_result";
		}
		
		//급여계산
		@RequestMapping(value = "/salaryTaxForm", method = RequestMethod.GET)	
		public String salaryTaxForm(Model model) {
			Calendar cal = Calendar.getInstance();
			int yyyy = cal.get(Calendar.YEAR);
			model.addAttribute("yyyy", yyyy+"");
			
			return "salary/salary_tax";
		}
		//급여년도 검색
		@RequestMapping(value = "/salary_list_form", method = RequestMethod.GET)	
		public String salary_list_form(Model model, String yyyy,  String mm, @ModelAttribute SalaryRoll salaryroll,  String dept) {
			SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
			
			HashMap rollkey = new HashMap();
			rollkey.putIfAbsent("yyyy", yyyy); //yyyy가 비어있으면 null
			rollkey.putIfAbsent("mm", mm);
			
			ArrayList<SalaryRoll> salaryrollList = dao.SalaryRollList(rollkey);
			model.addAttribute("salaryrollList", salaryrollList);
			
//			System.out.println("dept"+dept);
//			ArrayList<SalaryRoll> salaryrollUp= dao.SalaryRollUp(dept);
//		
//			model.addAttribute("salaryrollUp",salaryrollUp);
			
			return "salary/salary_list_form";
		}
		
		//roll에 yn = y값넣기
		@RequestMapping(value = "/salaryTax", method = RequestMethod.POST)	
		public String salaryTax(@RequestParam String yyyy, @RequestParam String mm, Model model) {
			SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
			if(mm.equals(""))
				mm = "0";
			mm = String.format("%02d", Integer.parseInt(mm));
			
			HashMap rollkey = new HashMap();
			rollkey.putIfAbsent("yyyy", yyyy); //yyyy가 비어있으면 null
			rollkey.putIfAbsent("mm", mm);
			dao.salaryrollDelete(rollkey);
			
			ArrayList<Salary> salarys = dao.selectyn();
			for(Salary salary:salarys) {
				salaryroll.setYyyy(yyyy);
				salaryroll.setMm(mm);
				salaryroll.setEmpno(salary.getEmpno());
				salaryroll.setDept(salary.getDept());
				salaryroll.setName(salary.getName());
				salaryroll.setPartner(salary.getParter());
				salaryroll.setDependent20(salary.getDependent20());
				salaryroll.setDependent60(salary.getDependent60());
				salaryroll.setDisabled(salary.getDesabled());
				salaryroll.setWomanpower(salary.getWomanpower());
				
				//세금 계산 프린트물 2p
				//특별소득공제
				int specialdeduction = 0; //특별소득공제
				int pay12 = (salary.getPay() + salary.getExtra())*12;
				salaryroll.setPay12(pay12);
				
				//근로소득공제
				int incomededuction = 0;
				if(pay12 < 5000001) {
					incomededuction = (int) (pay12 * 0.7);
				}else if(pay12 < 15000001) {
					incomededuction = (int) (3500000 + ((pay12 - 5000000) * 0.4));
				}else if(pay12 < 45000001) {
					incomededuction = (int) (7500000 + ((pay12 - 15000000) * 0.15));
				}else if(pay12 < 100000001) {
					incomededuction = (int) (12000000 + ((pay12 - 45000000) * 0.05));
				}else {
					incomededuction = (int) (14750000 + ((pay12 - 100000000) * 0.02));
				}
				
				salaryroll.setIncomededuction(incomededuction);
				salaryroll.setIncomeamount(pay12 - incomededuction);
				
				//특별소득공제
				//공제대상 //본인공제라 +1해줌
				int deducount = 1 + salary.getParter() + (salary.getDependent20() * 2) 
						+ salary.getDependent60() + salary.getDesabled() + salary.getWomanpower();
				
				//인적공제
				int personaldeduction = deducount * 1500000;
				salaryroll.setPersonaldeduction(personaldeduction);
				
				//연금보험료공제
				int annuityinsurance = 0;
				annuityinsurance = (int) ((salary.getPay() + salary.getExtra()) * 0.001);
				annuityinsurance = annuityinsurance * 1000;
				annuityinsurance = (int) (annuityinsurance * 0.045);
				annuityinsurance = annuityinsurance * 12;
				if(annuityinsurance < 135001) 
					annuityinsurance = 135000;
				if(annuityinsurance > 2149200) 
					annuityinsurance = 2149200;
				
				
				salaryroll.setAnnuityinsurance(annuityinsurance);
				
				if(deducount == 1) {
					if(pay12 < 30000001) {
						specialdeduction = (int) (3100000 + (pay12 * 0.04));
					}else if(pay12 > 30000000 && pay12 < 45000001) {
						specialdeduction = (int) (3100000 + (pay12 * 0.04)
								- ((pay12 - 30000000) * 0.05));
					}else if(pay12 > 45000000 && pay12 < 70000001) {
						specialdeduction = (int) (3100000 + (pay12 * 0.015));
					}else if(pay12 > 70000000 && pay12 < 120000001) {
						specialdeduction = (int) (3100000 + (pay12 * 0.005));
					}
				}else if(deducount == 2) {
					if(pay12 < 30000001) {
						specialdeduction = (int) (3600000 + (pay12 * 0.04));
					}else if(pay12 > 30000000 && pay12 < 45000001) {
						specialdeduction = (int) (3600000 + (pay12 * 0.04)
								- ((pay12 - 30000000) * 0.05));
					}else if(pay12 > 45000000 && pay12 < 70000001) {
						specialdeduction = (int) (3600000 + (pay12 * 0.02));
					}else if(pay12 > 70000000 && pay12 < 120000001) {
						specialdeduction = (int) (3600000 + (pay12 * 0.01));
					}
				}else {
					if(pay12 < 30000001) {
						specialdeduction = (int) (5000000 + (pay12 * 0.07));
					}else if(pay12 > 30000000 && pay12 < 45000001) {
						specialdeduction = (int) (5000000 + (pay12 * 0.07)
								- ((pay12 - 30000000) * 0.05));
					}else if(pay12 > 45000000 && pay12 < 70000001) {
						specialdeduction = (int) (5000000 + (pay12 * 0.05));
					}else if(pay12 > 70000000 && pay12 < 120000001) {
						specialdeduction = (int) (5000000 + (pay12 * 0.03));
					}
					specialdeduction += (pay12 - 40000000) * 0.04;
				}
				salaryroll.setSpecialdeduction(specialdeduction);
				
				//과세표준
				int standardamount = pay12 - (incomededuction + personaldeduction + specialdeduction + annuityinsurance);
				salaryroll.setStandardamount(standardamount);
				
				//산출세액
				int calculatedtax = 0;
				if(standardamount < 12000001) {
					calculatedtax = (int) (standardamount * 0.06);
				}else if(standardamount < 46000001) {
					calculatedtax = (int) (720000 + ((standardamount - 12000000) * 0.15));
				}else if(standardamount < 88000001) {
					calculatedtax = (int) (5820000 + ((standardamount - 46000000) * 0.24));
				}else if(standardamount < 150000001) {
					calculatedtax = (int) (15900000 + ((standardamount - 88000000) * 0.35));
				}else {
					calculatedtax = (int) (37600000 + ((standardamount - 150000000) * 0.38));
				}
				salaryroll.setCalculatedtax(calculatedtax);
				
				//근로소득세액공제
				int incometaxdeduction = 0;
				if(calculatedtax < 500001) {
					incometaxdeduction = (int) (calculatedtax * 0.55);
				}else {
					incometaxdeduction = (int) (275000 + ((calculatedtax - 500000) * 0.3));
					if(pay12 < 55000001)
						incometaxdeduction = Math.min(incometaxdeduction, 660000);
					else if(pay12 > 55000000 && pay12 < 70000001)
						incometaxdeduction = Math.min(incometaxdeduction, 630000);
					else if(pay12 > 70000000)
						incometaxdeduction = Math.min(incometaxdeduction, 500000);
				}
				
				salaryroll.setIncometaxdeduction(incometaxdeduction);
				
				//결정세액
				int decidedtax = calculatedtax - incometaxdeduction;
				salaryroll.setDecidedtax(decidedtax);
				//간이세액
				int simpletax = decidedtax / 12;
				simpletax = (int) (simpletax * 0.01);
				simpletax = simpletax * 100;
				salaryroll.setSimpletax(simpletax);
				
				dao.insertSalaryrollRow(salaryroll);
			}
			
			return "redirect:index";
		}
		
		//전체검색 salaryroll
			@RequestMapping(value = "/salaryroll_search", method = RequestMethod.GET)	
			public String salaryroll_search(Model model, String yyyy,String mm) {
				SalaryDao dao = sqlSessoin.getMapper(SalaryDao.class);
//				ArrayList<SalaryRoll> salaryrolls = dao.selectSalaryRoll();
//				model.addAttribute("salaryrolls",salaryrolls);
				
				HashMap rollkey = new HashMap();
				rollkey.putIfAbsent("yyyy", yyyy);
				rollkey.putIfAbsent("mm", mm);
				
				System.out.println("yyyy : "+yyyy);
				System.out.println("mm : "+mm);
				ArrayList<SalaryRoll> salaryrollUp= dao.SalaryRollUp(rollkey);
			
				model.addAttribute("salaryrollUp",salaryrollUp);
				
				return "salary/salaryroll_search";
			}
}
