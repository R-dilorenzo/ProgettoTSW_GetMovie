package model;

public class Voti {

	private double starRating;
	private int numeroVoti;
	private String nomeFilm;
	private String usr;
	
	public Voti() { }
	 


	public Voti(double starRating, int numeroVoti, String nomeFilm, String usr) {
		super();
		this.starRating = starRating;
		this.numeroVoti = numeroVoti;
		this.nomeFilm = nomeFilm;
		this.usr = usr;
	}



	public double getStarRating() {
		return starRating;
	}

	public void setStarRating(double starRating) {
		this.starRating = starRating;
	}

	public int getNumeroVoti() {
		return numeroVoti;
	}

	public void setNumeroVoti(int numeroVoti) {
		this.numeroVoti = numeroVoti;
	}

	public String getNomeFilm() {
		return nomeFilm;
	}

	public void setNomeFilm(String nomeFilm) {
		this.nomeFilm = nomeFilm;
	}



	public String getUsr() {
		return usr;
	}



	public void setUsr(String usr) {
		this.usr = usr;
	}
	 
	
}
