package model;

public class Film {
	
	private String nome;
	private String regista;
	private String img;
	private String genere;
	private String descrizione;
	private int anno;
	private double prezzo;
	private String attori;
	
	public Film () {}

	public Film(String nome, String regista, String img, String genere, String descrizione, int anno, double prezzo,
			String attori) {
		super();
		this.nome = nome;
		this.regista = regista;
		this.img = img;
		this.genere = genere;
		this.descrizione = descrizione;
		this.anno = anno;
		this.prezzo = prezzo;
		this.attori = attori;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRegista() {
		return regista;
	}

	public void setRegista(String regista) {
		this.regista = regista;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getAnno() {
		return anno;
	}

	public void setAnno(int anno) {
		this.anno = anno;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getAttori() {
		return attori;
	}

	public void setAttori(String attori) {
		this.attori = attori;
	}
	
	
}
