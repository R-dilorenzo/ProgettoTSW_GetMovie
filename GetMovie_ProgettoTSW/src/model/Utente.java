package model;

public class Utente {

	private String nome;
	private String cognome;
	private String usr;
	private String psw;
	private String email;
	
	public Utente() {}
	
	public Utente(String usr,String psw) {
		this.usr= usr;
		this.psw= psw;
	}
	
	public Utente(String nome, String cognome, String usr, String psw, String email) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.usr = usr;
		this.psw = psw;
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	private String dataNascita;
	private int numeroCarta;
	private String scadenzaCarta;
	private String residenza;
	private String luogoNascita;
	private String boolDati;
	
	
	
	public Utente(String usr) {
		this.usr = usr;
	}


	public Utente(String usr, String dataNascita, int numeroCarta, String scadenzaCarta, String residenza,
			String luogoNascita, String boolDati) {
		super();
		this.usr = usr;
		this.dataNascita = dataNascita;
		this.numeroCarta = numeroCarta;
		this.scadenzaCarta = scadenzaCarta;
		this.residenza = residenza;
		this.luogoNascita = luogoNascita;
		this.boolDati = boolDati;
	}



	

	public String getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(String dataNascita) {
		this.dataNascita = dataNascita;
	}

	public int getNumeroCarta() {
		return numeroCarta;
	}

	public void setNumeroCarta(int numeroCarta) {
		this.numeroCarta = numeroCarta;
	}

	public String getScadenzaCarta() {
		return scadenzaCarta;
	}

	public void setScadenzaCarta(String scadenzaCarta) {
		this.scadenzaCarta = scadenzaCarta;
	}

	public String getResidenza() {
		return residenza;
	}

	public void setResidenza(String residenza) {
		this.residenza = residenza;
	}

	public String getLuogoNascita() {
		return luogoNascita;
	}

	public void setLuogoNascita(String luogoNascita) {
		this.luogoNascita = luogoNascita;
	}

	public String getBoolDati() {
		return boolDati;
	}

	public void setBoolDati(String boolDati) {
		this.boolDati = boolDati;
	}

	public Utente(String nome, String cognome, String usr, String psw, String email, String dataNascita,
			int numeroCarta, String scadenzaCarta, String residenza, String luogoNascita, String boolDati) {
		this.nome = nome;
		this.cognome = cognome;
		this.usr = usr;
		this.psw = psw;
		this.email = email;
		this.dataNascita = dataNascita;
		this.numeroCarta = numeroCarta;
		this.scadenzaCarta = scadenzaCarta;
		this.residenza = residenza;
		this.luogoNascita = luogoNascita;
		this.boolDati = boolDati;
	}
	
	
}
