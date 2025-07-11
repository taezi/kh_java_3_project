package dto;

public class movieDTO {
	private String movieId;
	private String wposter;
	private String hposter;
	private String movieName;
	private String descriptions;
	private String openDt;
	private String repGenreNm;
	private String gradeNm;
	private String popularity;
	
	public movieDTO() {	}

	public movieDTO(String movieId, String wposter, String hposter, String movieName, String descriptions,
			String openDt, String repGenreNm, String gradeNm, String popularity) {
		super();
		this.movieId = movieId;
		this.wposter = wposter;
		this.hposter = hposter;
		this.movieName = movieName;
		this.descriptions = descriptions;
		this.openDt = openDt;
		this.repGenreNm = repGenreNm;
		this.gradeNm = gradeNm;
		this.popularity = popularity;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getWposter() {
		return wposter;
	}

	public void setWposter(String wposter) {
		this.wposter = wposter;
	}

	public String getHposter() {
		return hposter;
	}

	public void setHposter(String hposter) {
		this.hposter = hposter;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getRepGenreNm() {
		return repGenreNm;
	}

	public void setRepGenreNm(String repGenreNm) {
		this.repGenreNm = repGenreNm;
	}

	public String getGradeNm() {
		return gradeNm;
	}

	public void setGradeNm(String gradeNm) {
		this.gradeNm = gradeNm;
	}

	public String getPopularity() {
		return popularity;
	}

	public void setPopularity(String popularity) {
		this.popularity = popularity;
	}

	@Override
	public String toString() {
		return "movieDTO [movieId=" + movieId + ", wposter=" + wposter + ", hposter=" + hposter + ", movieName="
				+ movieName + ", descriptions=" + descriptions + ", openDt=" + openDt + ", repGenreNm=" + repGenreNm
				+ ", gradeNm=" + gradeNm + ", popularity=" + popularity + "]";
	}

	
	
}
