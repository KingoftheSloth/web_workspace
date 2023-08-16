package vo;

public class SaleVo {
	private int custno;
	private String custname;
	private String agrade;
	private int psum;
	
	public SaleVo() {
	}
	//생성자
	public SaleVo(int custno, String custname, String agrade, int psum) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.agrade = agrade;
		this.psum = psum;
	}
	//getter와 toString
	public String getAgrade() {
		return agrade;
	}
	public int getCustno() {
		return custno;
	}
	public String getCustname() {
		return custname;
	}
	public int getPsum() {
		return psum;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public void setPsum(int psum) {
		this.psum = psum;
	}
	@Override
	public String toString() {
		return "SaleVo [custno=" + custno + ", custname=" + custname + ", agrade=" + agrade + ", psum=" + psum + "]";
	}
	
	
}
