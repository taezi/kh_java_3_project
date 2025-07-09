package Controller;

public class HandllerMapping {
	private static HandllerMapping instance = new HandllerMapping();

	public HandllerMapping() {
		
	}
	
	public static HandllerMapping getInstance() {
		if(instance == null) {
			instance = new HandllerMapping();
		}
		return instance;
	}
	
	public Controller createController(String command) {
		Controller controller = null;
		
		switch(command) {
		//Movie
		case "AllMovie":
			controller = new AllMovieController();
			break;
		//Board
		case "AllBoard":
			controller = new AllBoardController();
			break;
		case "registerView":
			controller = new registerViewController();
			break;
		case "register":
			controller = new registerController();
			break;
		case "loginView":
			controller = new loginViewController();
			break;
		case "login":
			controller = new loginController();
			break;
		}
		
		return controller;
	}
	
	
	
}
