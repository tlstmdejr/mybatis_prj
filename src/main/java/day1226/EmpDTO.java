package day1226;

/**
 * <jsp:usebean>기본생성자를 사용하여 객체화하고
 * <jsp:setProperty> setter method를 통해 입력값이저장
 * mybatis에서는 parametertype="empDTO"입력받아서 #{getter명}으로사용
 */
public class EmpDTO {
	private int deptno,empno;

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	
}
//class
