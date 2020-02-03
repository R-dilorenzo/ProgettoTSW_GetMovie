# ProgettoTSW_GetMovie
progetto corso TSW

Il progetto richiede lo sviluppo di un sito di e-commerce in HTML.

* #### Richieste progetto:

>1. Il sito deve essere responsive;  
>2. Il sito deve girare su Tomcat direttamente e non nell’ambiente di sviluppo;  
>3. Va usato il modello MVC;  
>4. Bisogna creare almeno due package: uno per il Controller ed uno per il Model  
>5. Il Model deve contenere i bean, il carrello e la logica dell’applicazione;  
>6. Il codice HTML viene creato esclusivamente dalle JSP e HTML che formano il view  
>7. Usare un DB relazionale per la memorizzazione dei dati  
>8. I form vanno controllati sia con javascript che lato server. Il form viene inviato al server solo se corretto.  
>9. Usare JQuery/Javascript per modificare il DOM in qualche pagina,  
>10. Usare AJAX per scambiare piccole informazioni con il server.  
>11. Gestire le sessioni per realizzare il carrello. 
>12. Vanno previste funzionalità diverse per ciascuna delle figure dell'amministratore, dell’utente registrato e dell’utente non registrato.  
>13. Qualità dell’interfaccia e dell’interazione con l’applicazione. 

  - per il punto 1) sono state utilizzate alcune funzionalità di Bootstrap e alcuni breakpoint in CSS per adattare al meglio il sito alle varie dimensioni
  - per il punto 2):
    - esportare il file in .war nella cartella webapps di tomcat
    - da prompt andare nella cartella .bin di tomcat e avviare tomcat scrivendo il comando "startup.bin"
    - avviato, quindi, il server tomcat è possibile far girare il sito su un qualsiasi browser
    - per chiudere il server tomcat scrivere "shutdown.bin"
  - è possibile vedere il punto 3) e 4) dal codice che è stato suddiviso nei package 
  - è stato utilizzato un DB relazione che è possibile importare attraverso MySQL con il file "dumps"
  - è stato utilizzato per modificare il DOM delle pagine, JavaScript e JQuery e AJAX per lo slide nella homepage
  - per il punto 12):
    - amministratore: può modificare,inserire e modificare il prodotto
    - utente registrato: può acquistare i prodotti
    - utente non registrato: può solo visionare i prodotti presenti sul sito. Per poterli acquistare, infatti, bisogna effettuare il login dopo essersi registrati
   
è stato inoltre utilizzato il LocalStorage, presente nella maggior parte dei browser, attraverso JavaScript per modificare ulteriormente il DOM (function day/night()) 
