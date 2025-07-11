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
		case "Main":
			controller = new MainController();
			break;
		//Movie
		case "AllMovie":
			controller = new AllMovieController();
			break;
		//Board
		case "AllBoard":
			controller = new AllBoardController();
			break;
		case "RegisterView":
			controller = new RegisterViewController();
			break;
		case "Register":
			controller = new RegisterController();
			break;
		case "LoginView":
			controller = new LoginViewController();
			break;
		case "Login":
			controller = new LoginController();
			break;
		case "BoardWriteView":
			controller = new BoardWriteViewController();
			break;
		case "SearchView":
			controller = new SearchViewController();
			break;
		case "Logout":
			controller = new LogoutController();
			break;
			
		}
		
		
		return controller;
	}
	
	
	
}
