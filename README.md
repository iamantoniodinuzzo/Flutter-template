# flutter_template_mobile

[![Versione Flutter](https://img.shields.io/badge/Flutter-v3.18.0-blue.svg)](https://flutter.dev/docs/get-started/install)
[![Dart](https://img.shields.io/badge/Dart-v3.3.0-blue.svg)](https://dart.dev/get-dart)

Template per i progetti flutter su sistemi mobile. Scritto in Dart, realizzato con Flutter 💙

## Sommario

- [Inizializzazione](#inizializzazione)
- [Struttura del Progetto](#struttura-del-progetto)
- [Dipendenze](#dipendenze)

## Inizializzazione

1. Clona il repository.

2. Esegui il comando per aggiornare le dipendenze:

```bash
flutter pub get
```

3. Esegui il comando per generare i file necessari:

```bash
dart run build_runner build
```

4. Rinomina il progetto:

    Installa il [**Rename CLI Tool**](https://pub.dev/packages/rename/install)

    ```bash
    dart pub global activate rename
    ```

    Cambia il nome dell'app:

    ```bash
      rename setAppName --targets ios,android - value "YourNewAppName"
    ```

    > Puoi controllare se è andato a buon fine utilizzando `rename getAppName --targets ios`

    Cambia il **BundleId**

    ```bash
      rename setBundleId - targets android - value "com.rename.new.bundleId"
    ```

    > Puoi controllare se è andato a buon fine utilizzando `rename getBundleId --targets android`

## Struttura del progetto

Il progetto è organizzato in modo modulare per una gestione più efficace del codice implementando l'architettura **MVVM** & **Repository pattern**. Ecco una breve panoramica delle directory principali:

Ecco la tua lista con aggiunta di emoji conformi al titolo o alla natura della sezione:

- **lib/** 📂: Contiene il codice sorgente principale dell'app Flutter.
  - **main.dart** 🚀: Punto di ingresso dell'applicazione.
  - **COMMON/** 🌐: Directory che contiene tutto il codice comune in ogni applicazione.
    - **ANIMATIONS/** 🎬: Contiene i riferimenti alle risorse di animazione presenti nella cartella `assets/animations`.
    - **BASE_VIEW_MODEL/** 💡: Contiene le classi per il base view model e per l'inizializzazione di quest'ultimo.
    - **CONSTANTS/** 📊: Contiene le costanti disponibili in tutta l'app.
    - **GLOBALS/** 🌐: Contiene le due variabili inizializzate nel main.dart che ospitano due tipologie di loader.
    - **IMAGES/** 🖼️: Contiene i riferimenti alle risorse immagini presenti nella cartella `assets/images`.
    - **LOCALIZATION/** 🌐: Contiene l'enumerazione riferimento ai nomi delle stringhe dei file in `assets/translations`.
    - **NAVIGATION/** 🗺️: Contiene tutte le routes del progetto.
    - **NETWORK/** 🌐: Contiene tutte le classi necessarie per effettuare le operazioni di rete.
      - **EXCEPTION/** ❌: Contiene la classe per customizzare le eccezioni e manipolarle a piacimento.
      - **INTERCEPTOR/** 🚥: Contiene gli interceptor di rete tra cui quello per i messaggi di log.
    - **THEME/** 🎨: Contiene tutte le classi per la generalizzazione dei temi dell'app.
    - **UTIL/EXTENSIONS/** 🛠️: Contiene le estensioni di utilità per ridurre il boilerplate code.
  - **DATA/** 📦: Contiene tutti i packages del data layer ovvero lo strato che interagirà direttamente con i dati locali e/o remoti.
    - **LOCAL/** 🏠: Contiene tutte le classi per interagire con i dati locali.
      - **ENTITIES/** 🏛️: Contiene i packages per ogni tipo di entità del database interno e i nomi dei box.
      - **MAPPER/** 🗺️: Contiene le estensioni per il mapping dei dati ovvero la trasformazione da un entità ad un modello di dominio e viceversa.
      - **REPOSITORY/** 💼: Contiene tutte le **implementazioni** delle interfacce repository presenti in `DOMAIN/LOCAL/REPOSITORY`.
      - **SERVICE/** 🛠️: Contiene le classi che interagiranno con il database direttamente.
      - **SHARED_PREFERENCES/** 🔄: Contiene la classe che semplifica la gestione delle shared prefs.
    - **REMOTE/** 🌐: Contiene tutte le classi per interagire con i dati in remoto.
      - **DTO/** 📦: Contiene i **D**ata **T**ransfer **O**bjects ovvero gli oggetti risultato delle chiamate in remoto.
      - **MAPPER/** 🗺️: Contiene le estensioni per il mapping dei dati ovvero la trasformazione da un DTO ad un modello di dominio e viceversa.
      - **REPOSITORY/** 💼: Contiene tutte le **implementazioni** delle interfacce repository presenti in `DOMAIN/REMOTE/REPOSITORY`.
      - **RESPONSE/** 📡: Contiene le classi che rappresentano i response ricevuti dal web da cui trarre i DTO.
      - **SERVICE/** 🛠️: Contiene le classi che interagiranno con il web direttamente.
    - **DI/** 🔄: Contiene le classi per implementare la dependency injection.
    - **DOMAIN/** 🌐: Lo strato di dominio che mette in comunicazione il data layer con le view nascondendo dettagli implementativi tramite il *Repository Pattern*
      - **LOCAL/REPOSITORY/** 💼: Contiene le interfacce con le firme dei metodi per interagire con il database interno.
      - **MODELS/** 🏛️: Contiene i modelli di dominio ovvero le entità del progetto con popolate con i dati necessari.
      - **REMOTE/REPOSITORY/** 💼: Contiene le interfacce con le firme dei metodi per interagire con API.
  - **UI/** 🎨: Contiene i packages inerenti alle view e ai widget.
    - **SCREEN/** 📺: Contiene dei packages che racchiudono le destinazioni dell'app in cui sono presenti view e view model associato.
    - **WIDGETS/** 🧩: Contiene i widget generalizzati dell'app.
      - **GENERIC_WIDGETS/** 🧩: Contiene dei widget generici utili in ogni progetto e personalizzabili.
      - **MODEL_WIDGETS/** 🏛️: Contiene i widget che rappresentano un entità in particolare

.

## Dipendenze

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
- [Provider](https://pub.dev/packages/provider)
- [Flutter SVG](https://pub.dev/packages/flutter_svg)
- [Gap](https://pub.dev/packages/gap)
- [Easy Localization](https://pub.dev/packages/easy_localization)
- [Enum to String](https://pub.dev/packages/enum_to_string)
- [Fluro](https://pub.dev/packages/fluro)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Lottie](https://pub.dev/packages/lottie)
- [Dio](https://pub.dev/packages/dio)
- [Logger](https://pub.dev/packages/logger)
- [Get It](https://pub.dev/packages/get_it)
- [Connectivity Plus](https://pub.dev/packages/connectivity_plus)
- [Internet Connection Checker](https://pub.dev/packages/internet_connection_checker)
- [Hive](https://pub.dev/packages/hive)
- [Hive Flutter](https://pub.dev/packages/hive_flutter)
- [JSON Serializable](https://pub.dev/packages/json_serializable)
- [Flutter Test](https://flutter.dev/docs/testing)
- [Mocktail](https://pub.dev/packages/mocktail)
- [Hive Generator](https://pub.dev/packages/hive_generator)
- [Build Runner](https://pub.dev/packages/build_runner)
