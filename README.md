BeerPedia

Ho cercato di usare una struttura MVVM come pattern di programmazzione e usando le librerie di Alamofire, swiftyJson e kingFisher 
Perchè di queste librerie ? le ho usato quelle poche volte per la realizzazione di qualche piccolo progetto e migliorano il lato codice.


Insieme al MVVM ho scelto di implementare le mie views con components creati separati (le card che si vedono all'interno di detailView)
questo approccio l'ho visto in molti progetti su github e ne ho modificati alcuni,
permette la manuntezione e il riutilizzo delle view e sopratutto del codice e in caso di modifiche future si lavora direttamente sul componente o funzione interessata senza stravolgere l'app


Inoltre l'app è stata implementata con condizioni di verifica per evitare crash e arresti anomali, li dove si poteva inserire un caricamento o una progressview.


Sopratutto per quando si va a perdere la connessione ad internet viene subito attraverso il networkManager viene ascoltato lo stato della connessione e in caso sia irragiunibile o "incerta" viene attivato l'if statament all'interno di content view 


Content view ha le funzioni di refresh ogni volta che viene tirata in basso la lista viene chiamata la funzione all'interno di beerListViewModel 
beerListViewModel viene implementato per essere riutilizzato nella con un metodo for each che genera una cella per ogni birra presa dall'API

beerListViewModel inizializza APIService così da caricare in modo automatico la lista 


Il processo di ottenimento API viene gestito con ApiService che funge da classe per la presa dei dati dall'API

Viene poi creado un beerModel e BeerViewModel  per i passaggi dei dati dall'API alle classi dell'app 


Per il design dell'app ho cercato di avere una schermata pulita e ordinata con qualche effetto ottico tipo lo scroll horizzontale dove viene letto il metodo di preparazione della birra.


Purtroppo non sono riuscito a implementare le funzioni alternative per mancanza di tempo in questi giorni.

Spero che con questo TEST dia esito positivo in merito alla candidatura fino ad allora.
Cordiali Saluti,
Alex.
