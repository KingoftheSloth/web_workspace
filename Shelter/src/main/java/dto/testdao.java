package dto;

import dao.animalDao;

public class testdao {
public static void main(String[] args) {
	Animal animal = animalDao.getInstance().selectOne("448543202300238");
	System.out.println(animal);
}


}