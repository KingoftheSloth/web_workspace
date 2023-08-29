package dto;

import java.util.List;

public class testdao {
public static void main(String[] args) {
	List<Animal> animallist=dao.animalDao.getInstance().selectAll();
	System.out.println(animallist);
}
}
