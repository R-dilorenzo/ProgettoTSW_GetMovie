package model;

public class Carrello {

	private String usr;
	private String nomeFilm;
	private double prezzo;
	private String img;
	
	public Carrello() {	}
	
	public Carrello(String usr, String nomeFilm, double prezzo, String img) {
		super();
		this.usr = usr;
		this.nomeFilm = nomeFilm;
		this.prezzo = prezzo;
		this.img = img;
	}



	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getNomeFilm() {
		return nomeFilm;
	}

	public void setNomeFilm(String nomeFilm) {
		this.nomeFilm = nomeFilm;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}
