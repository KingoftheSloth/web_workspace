package sample.dto;

public class MyUser {
private String uname;
private int age;
private String address;

public String getUname() {
	return uname;
}

public void setUname(String uname) {
	this.uname = uname;
}

public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

@Override
public String toString() {
	return "MyUser [uname=" + uname + ", age=" + age + ", address=" + address + "]";
}
}
