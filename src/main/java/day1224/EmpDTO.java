package day1224;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
public class EmpDTO {
	private int empno ,mgr, deptno;
	private String ename,job,strHiredate;
	private double sal,comm;
	private Date hiredate;
	
	public EmpDTO() {
		System.out.println("empdto 기본생성자객체생성");
	}

	public EmpDTO(int empno, int mgr, int deptno, String ename, String job, String strHiredate, double sal, double comm,
			Date hiredate) {
		System.out.println("empdto인자 생성자객체생성");
		this.empno = empno;
		this.mgr = mgr;
		this.deptno = deptno;
		this.ename = ename;
		this.job = job;
		this.strHiredate = strHiredate;
		this.sal = sal;
		this.comm = comm;
		this.hiredate = hiredate;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		System.out.println("setEname호출");
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getStrHiredate() {
		return strHiredate;
	}

	public void setStrHiredate(String strHiredate) {
		this.strHiredate = strHiredate;
	}

	public double getSal() {
		return sal;
	}

	public void setSal(double sal) {
		this.sal = sal;
	}

	public double getComm() {
		return comm;
	}

	public void setComm(double comm) {
		this.comm = comm;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	
	
}
//class
