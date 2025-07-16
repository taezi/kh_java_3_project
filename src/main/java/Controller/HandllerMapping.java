package Controller;

public class HandllerMapping {
	private static HandllerMapping instance = new HandllerMapping();

	public HandllerMapping() {

	}

	public static HandllerMapping getInstance() {
		if (instance == null) {
			instance = new HandllerMapping();
		}
		return instance;
	}

	public Controller createController(String command) {
		Controller controller = null;

		switch (command) {
		case "Main":
			controller = new MainController();
			break;
		// Movie
		case "AllMovie":
			controller = new AllMovieController();
			break;
		case "movieinfo":
			controller = new MovieInfoController();
			break;
		case "SearchView":
			controller = new SearchViewController();
			break;
		case "movieCommentWrite":
			controller = new movieCommentWriteController();
			break;
		// Board
		case "AllBoard":
			controller = new AllBoardController();
			break;
		case "BoardWriteView":
			controller = new BoardWriteViewController();
			break;
		case "BoardView":
			controller = new BoardViewController();
			break;
		// 로그인
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
		case "Logout":
			controller = new LogoutController();
			break;
		case "Admin":
			controller = new AdminController();
			break;
		case "BoardWrite":
			controller = new BoardWriteController();
			break;
		case "MovieUrl":
			controller = new MovieUrlController();
			break;
		case "NaverLoginCallback":
			controller = new NaverLoginCallbackController();
			break;
		case "BoardLike":
			controller = new BoardLikeController();
			break;
		case "SearchIdView":
			controller = new SearchIdViewController();
			break;
		case "SearchId":
			controller = new SearchIdController();
			break;
		case "SearchPwView":
			controller = new SearchPwViewController();
			break;
		case "SearchPw":
			controller = new SearchPwController();
			break;
		case "BoardCommentInsert":
			controller = new BoardCommentInsertController();
			break;
		case "reportMovie":
			controller = new MovieReportController();
			break;
		case "UserDelete":
			controller = new UserDeleteController();
			break;
		}

		return controller;
	}
}
