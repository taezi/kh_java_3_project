package dto;

public class movieDTO {
	private String movieId;
	private String descriptions;
	private String movieName;
	private String openDt;
	private String repGenreNm;
	private String directors;
	private String companys;
	private String audits;
	private String GradeNm;
	
	public movieDTO() {	}

	public movieDTO(String movieId, String descriptions, String movieName, String openDt, String repGenreNm,
			String directors, String companys, String audits, String gradeNm) {
		super();
		this.movieId = movieId;
		this.descriptions = descriptions;
		this.movieName = movieName;
		this.openDt = openDt;
		this.repGenreNm = repGenreNm;
		this.directors = directors;
		this.companys = companys;
		this.audits = audits;
		GradeNm = gradeNm;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
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

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getCompanys() {
		return companys;
	}

	public void setCompanys(String companys) {
		this.companys = companys;
	}

	public String getAudits() {
		return audits;
	}

	public void setAudits(String audits) {
		this.audits = audits;
	}

	public String getGradeNm() {
		return GradeNm;
	}

	public void setGradeNm(String gradeNm) {
		GradeNm = gradeNm;
	}

	@Override
	public String toString() {
		return "movieDTO [movieId=" + movieId + ", descriptions=" + descriptions + ", movieName=" + movieName
				+ ", openDt=" + openDt + ", repGenreNm=" + repGenreNm + ", directors=" + directors + ", companys="
				+ companys + ", audits=" + audits + ", GradeNm=" + GradeNm + "]";
	}
	
}
