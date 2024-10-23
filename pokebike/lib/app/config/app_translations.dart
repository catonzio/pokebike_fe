import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'it': {
          'hello': 'Ciao',
          'welcome': 'Benvenuto!',
          'frwd': 'Avanti',
          'presentation1Title': 'Colleziona',
          'presentation1Subtitle1':
              'Colleziona le moto che più ti\npiacciono con un click',
          'presentation2Title': 'Tornei',
          'presentation2Subtitle1':
              'Puoi gareggiare con le tue moto\npreferite e vincere medaglie',
          'presentation3Title': 'Comunità',
          'presentation3Subtitle1':
              'Condividi con i tuoi amici le tue\navventure con la tua moto',
          'orderBy': 'Ordina per',
          'type': 'Tipo',
          'brand': 'Marca',
          'emptyCommunity': 'La community è vuota',
          'community': 'Comunità',
          'seeAll': 'Vedi Tutti',
          'model': 'Modello',
          'year': 'Anno',
          'location': 'Luogo',
          'description': 'Descrizione',
          'addMoto': 'Aggiungi moto',
          'motoAlreadyInserted': 'Moto già inserita',
          'motoAlreadyInsertedSubtitle':
              'La moto che stai tentando di salvare è già presente nella tua collezione. Sei sicuro di volerla sostituire con questa nuova cattura?',
          'substitute': 'Sostituisci',
          'nullify': 'Annulla',
          'motoSaved': 'Moto salvata correttamente',
          'noInternet': 'Controlla la connessione ad internet',
          'share': 'Condividi',
          'myGarage': 'Il mio garage',
          'garage': 'Garage',
          'collection': 'Collezione',
          'story': 'Storia',
          'noMotoAdded': 'Non hai ancora aggiunto moto',
          'add': 'Aggiungi',
          'noMotoFoundFilter': 'Nessuna moto trovata con questi filtri',
          'helloBiker': 'Ciao Biker!',
          'tournaments': 'Tornei',
          'profile': 'Profilo',
          'leaderboard': 'Classifica',
          'generalLeaderboard': 'Classifica generale',
          'winner': 'Vincitore',
          'noWinner': 'Il vincitore non è ancora stato scelto',
          'winnerIs': 'Il vincitore è:',
          'codeEmpty': 'Il codice non può essere vuoto',
          'emailNoEmpty': 'L\'email non può essere vuota',
          'emailNotValid': 'Inserisci un\'email valida',
          'password': 'Password',
          'newPassword': 'Nuova password',
          'oldPassword': 'Vecchia password',
          'passwordConfirm': 'Conferma password',
          'changePassword': 'Cambia password',
          'pwdForgot': 'Password dimenticata?',
          'pwdNoEmpty': 'La password non può essere vuota',
          'pwd8chars': 'La password deve essere di almeno 8 caratteri',
          'pwdNoCoincide': 'Le password non corrispondono',
          'name': 'Nome',
          'nameNoEmpty': 'Il nome non può essere vuoto',
          'surname': 'Cognome',
          'surnameNoEmpty': 'Il cognome non può essere vuoto',
          'username': 'Username',
          'usernameNoEmpty': 'Lo username non può essere vuoto',
          'birthday': 'Data di nascita',
          'birthdayNoEmpty': 'La data di nascita non può essere vuota',
          'selectAvatar': 'Seleziona l\'avatar',
          'mustSelectAvatar': 'Devi selezionare un avatar',
          'confirm': 'Conferma',
          'register': 'Registrazione',
          'registerYou': 'Registrati',
          'codeViaEmail': 'Inserisci il codice ricevuto via email',
          'insertCode': 'Inserisci il codice',
          'anotherCode': 'Richiedi un altro codice',
          'codeSent': 'Codice inviato',
          'registerGoogle': 'Registrati con Google',
          'access': 'Accedi',
          'or': 'oppure',
          'welcomeBack': 'Bentornato!',
          'noAccount': 'Non hai un account? Registrati',
          'email': 'E-mail',
          'resetEmailSent': 'Email di reset @statusinviata',
          'already': 'già',
          'whereSelectImg': 'Da dove vuoi selezionare l\'immagine?',
          'camera': 'Camera',
          'gallery': 'Galleria',
          'alreadyAccount': 'Hai già un account? Accedi',
          'privacy': 'Privacy',
          'acceptPrivacy': 'Devi accettare la privacy',
          'captureDate': 'Data cattura',
          'save': 'Salva',
          'dataSaved': 'Dati salvati correttamente',
          'nation': 'Nazione',
          'favouriteMotoSaved': 'Moto salvata come preferita',
          'info': 'Informazioni',
          'state': 'Stato',
          'received': 'Ricevuta @when',
          'read': 'Letta @when',
          'notifications': 'Notifiche',
          'delete': 'Elimina',
          'deleteNotifications': 'Elimina notifiche',
          'deleteNotificationsSure':
              'Sei sicuro di voler eliminare tutte le notifiche?',
          'noNewNotifications': 'Non ci sono nuove notifiche',
          'noCollecting': 'Non hai ancora collezionato nessuna moto',
          'startCollecting': 'Inizia a collezionare',
          'chooseMoto': 'Scegli la tua moto',
          'chooseYou': 'Scelgo te!',
          'motoForRaceTitle':
              'È questa la moto che vuoi utilizzare per la gara?',
          'motoForRaceMessage':
              'Una volta scelta non potrai più cambiarla fino al prossimo torneo.',
          'choose': 'Scegli',
          'selectedMoto': 'Moto selezionata',
          'selectedMotoError': 'Errore nel selezionare la moto',
          'seeInfo': 'Visualizza informazioni',
          'motoRegistered': 'Moto registrata al torneo con successo',
          'backHome': 'Torna alla home',
          'jump': 'Salta',
          'medals': 'Medaglie',
          'noMedals': 'Non hai vinto ancora nessuna medaglia',
          'cockades': 'Coccarde',
          'noCockades': 'Non hai vinto ancora nessuna coccarda',
          'numMotosCaptured': '@howMany moto catturate',
          'errorLoadingPartecipation': 'Errore caricamento partecipazione',
          'noTournamentsPartecipations':
              'Non hai ancora partecipato a nessun torneo',
          'partecipateTournaments': 'Partecipa al torneo',
          'wins': 'Vittorie',
          'topMoto': 'Top moto',
          'percMotosCaptured': 'Moto catturate: @realNum@limit',
          'capturedMotos': 'Moto catturate',
          'deleteAccount': 'Elimina account',
          'deleteAccountTitle': 'Sei sicuro di voler eliminare il tuo account?',
          'deleteAccountMessage':
              'Una volta confermato non potrai più accedere al tuo profilo',
          'savingCompleted': 'Salvataggio completato',
          'privacyPolicy': 'Termini e condizioni',
          'tournament': 'Torneo',
          'alreadyVoted':
              'Non puoi effettuare un\'altra votazione su questo turno',
          'pointGained': 'Hai guadagnato un punto!',
          'vote': 'Vota',
          'ok': 'Ok',
          'points': 'Punti @howMany',
          'home': 'Home',
          'photocamera': 'Fotocamera',
          'logout': 'logout',
          'logoutTitle': 'Sei sicuro di voler uscire?',
          'logoutMessage':
              'Una volta uscito dovrai effettuare nuovamente l\'accesso per utilizzare l\'app',
          'exit': 'Esci',
          'apply': 'Applica',
          'cancel': 'Cancella',
          'search': 'Cerca',
          'updatedLanguage': 'Lingua aggiornata',
          'nonUpdatedLanguage': 'Aggiornamento lingua non riuscito',
          'chooseLanguage': 'Scegli la lingua',
          'insertBrand': 'Inserisci la marca',
          'insertModel': 'Inserisci il modello',
          'insertYear': 'Inserisci l\'anno',
          'insertLocation': 'Inserisci il luogo',
          'insertOldPassword': 'Inserisci la vecchia password',
          'insertNewPassword': 'Inserisci la nuova password',
          'insertConfirmPassword': 'Inserisci la password di conferma',
          'medal': 'Medaglia @name',
          'bronze': 'Bronzo',
          'silver': 'Argento',
          'gold': 'Oro',
          'platinum': 'Platino',
          'diamond': 'Diamante'
        },
        'en': {
          'hello': 'Hello',
          'welcome': 'Welcome!',
          'frwd': 'Forward',
          'presentation1Title': 'Collect',
          'presentation1Subtitle1': 'Collect the bikes you like\nwith a click',
          'presentation2Title': 'Tournaments',
          'presentation2Subtitle1':
              'Compete with your favorite bikes\nand win medals',
          'presentation3Title': 'Community',
          'presentation3Subtitle1':
              'Share your adventures\nwith your bike with friends',
          'orderBy': 'Sort by',
          'type': 'Type',
          'brand': 'Brand',
          'emptyCommunity': 'The community is empty',
          'community': 'Community',
          'seeAll': 'See All',
          'model': 'Model',
          'year': 'Year',
          'location': 'Location',
          'description': 'Description',
          'addMoto': 'Add bike',
          'motoAlreadyInserted': 'Bike already added',
          'motoAlreadyInsertedSubtitle':
              'The bike you are trying to save is already in your collection. Are you sure you want to replace it with this new capture?',
          'substitute': 'Replace',
          'nullify': 'Cancel',
          'motoSaved': 'Bike saved successfully',
          'noInternet': 'Check your internet connection',
          'share': 'Share',
          'myGarage': 'My garage',
          'garage': 'Garage',
          'collection': 'Collection',
          'story': 'Story',
          'noMotoAdded': 'You haven’t added any bikes yet',
          'add': 'Add',
          'noMotoFoundFilter': 'No bikes found with these filters',
          'helloBiker': 'Hello Biker!',
          'tournaments': 'Tournaments',
          'profile': 'Profile',
          'leaderboard': 'Leaderboard',
          'generalLeaderboard': 'General leaderboard',
          'winner': 'Winner',
          'noWinner': 'The winner has not been chosen yet',
          'winnerIs': 'The winner is:',
          'codeEmpty': 'The code cannot be empty',
          'emailNoEmpty': 'Email cannot be empty',
          'emailNotValid': 'Enter a valid email',
          'password': 'Password',
          'newPassword': 'New password',
          'oldPassword': 'Old password',
          'passwordConfirm': 'Confirm password',
          'changePassword': 'Change password',
          'pwdForgot': 'Forgot password?',
          'pwdNoEmpty': 'Password cannot be empty',
          'pwd8chars': 'Password must be at least 8 characters long',
          'pwdNoCoincide': 'Passwords do not match',
          'name': 'Name',
          'nameNoEmpty': 'Name cannot be empty',
          'surname': 'Surname',
          'surnameNoEmpty': 'Surname cannot be empty',
          'username': 'Username',
          'usernameNoEmpty': 'Username cannot be empty',
          'birthday': 'Birthday',
          'birthdayNoEmpty': 'Birthday cannot be empty',
          'selectAvatar': 'Select avatar',
          'mustSelectAvatar': 'You must select an avatar',
          'confirm': 'Confirm',
          'register': 'Register',
          'registerYou': 'Sign up',
          'codeViaEmail': 'Enter the code received via email',
          'insertCode': 'Insert the code',
          'anotherCode': 'Request another code',
          'codeSent': 'Code sent',
          'registerGoogle': 'Sign up with Google',
          'access': 'Login',
          'or': 'or',
          'welcomeBack': 'Welcome back!',
          'noAccount': 'Don’t have an account? Sign up',
          'email': 'Email',
          'resetEmailSent': 'Reset email @statussent',
          'already': 'already',
          'whereSelectImg': 'Where do you want to select the image from?',
          'camera': 'Camera',
          'gallery': 'Gallery',
          'alreadyAccount': 'Already have an account? Login',
          'privacy': 'Privacy',
          'acceptPrivacy': 'You must accept the privacy policy',
          'captureDate': 'Capture date',
          'save': 'Save',
          'dataSaved': 'Data saved successfully',
          'nation': 'Nation',
          'favouriteMotoSaved': 'Bike saved as favorite',
          'info': 'Information',
          'state': 'State',
          'received': 'Received @when',
          'read': 'Read @when',
          'notifications': 'Notifications',
          'delete': 'Delete',
          'deleteNotifications': 'Delete notifications',
          'deleteNotificationsSure':
              'Are you sure you want to delete all notifications?',
          'noNewNotifications': 'No new notifications',
          'noCollecting': 'You haven’t collected any bikes yet',
          'startCollecting': 'Start collecting',
          'chooseMoto': 'Choose your bike',
          'chooseYou': 'I choose you!',
          'motoForRaceTitle': 'Is this the bike you want to use for the race?',
          'motoForRaceMessage':
              'Once chosen, you cannot change it until the next tournament.',
          'choose': 'Choose',
          'selectedMoto': 'Selected bike',
          'selectedMotoError': 'Error selecting the bike',
          'seeInfo': 'View info',
          'motoRegistered': 'Bike successfully registered for the tournament',
          'backHome': 'Back to home',
          'jump': 'Skip',
          'medals': 'Medals',
          'noMedals': 'You haven’t won any medals yet',
          'cockades': 'Rosettes',
          'noCockades': 'You haven’t won any rosettes yet',
          'numMotosCaptured': '@howMany bikes captured',
          'errorLoadingPartecipation': 'Error loading participation',
          'noTournamentsPartecipations':
              'You haven’t participated in any tournaments yet',
          'partecipateTournaments': 'Participate in the tournament',
          'wins': 'Wins',
          'topMoto': 'Top bike',
          'percMotosCaptured': 'Bikes captured: @realNum@limit',
          'capturedMotos': 'Captured bikes',
          'deleteAccount': 'Delete account',
          'deleteAccountTitle': 'Are you sure you want to delete your account?',
          'deleteAccountMessage':
              'Once confirmed, you will no longer be able to access your profile',
          'savingCompleted': 'Saving completed',
          'privacyPolicy': 'Terms and conditions',
          'tournament': 'Tournament',
          'alreadyVoted': 'You cannot vote again on this round',
          'pointGained': 'You earned a point!',
          'vote': 'Vote',
          'ok': 'Ok',
          'points': 'Points @howMany',
          'home': 'Home',
          'photocamera': 'Camera',
          'logout': 'Logout',
          'logoutTitle': 'Are you sure you want to logout?',
          'logoutMessage':
              'Once logged out, you will need to log in again to use the app',
          'exit': 'Exit',
          'apply': 'Apply',
          'cancel': 'Cancel',
          'search': 'Search',
          'updatedLanguage': 'Updated language',
          'nonUpdatedLanguage': 'Language Update Failed',
          'chooseLanguage': 'Choose the language',
          'insertBrand': 'Insert brand',
          'insertModel': 'Insert model',
          'insertYear': 'Insert year',
          'insertLocation': 'Insert location',
          'insertOldPassword': 'Insert old password',
          'insertNewPassword': 'Insert new password',
          'insertConfirmPassword': 'Insert confirm password',
          'medal': '@name medal',
          'bronze': 'Bronze',
          'silver': 'Silver',
          'gold': 'Gold',
          'platinum': 'Platinum',
          'diamond': 'Diamond'
        },
        'es': {
          'hello': 'Hola',
          'welcome': '¡Bienvenido!',
          'frwd': 'Adelante',
          'presentation1Title': 'Colecciona',
          'presentation1Subtitle1':
              'Colecciona las motos que más te gusten con un clic',
          'presentation2Title': 'Torneos',
          'presentation2Subtitle1':
              'Puedes competir con tus motos favoritas y ganar medallas',
          'presentation3Title': 'Comunidad',
          'presentation3Subtitle1':
              'Comparte tus aventuras con tus amigos en moto',
          'orderBy': 'Ordenar por',
          'type': 'Tipo',
          'brand': 'Marca',
          'emptyCommunity': 'La comunidad está vacía',
          'community': 'Comunidad',
          'seeAll': 'Ver todo',
          'model': 'Modelo',
          'year': 'Año',
          'location': 'Ubicación',
          'description': 'Descripción',
          'addMoto': 'Añadir moto',
          'motoAlreadyInserted': 'Moto ya agregada',
          'motoAlreadyInsertedSubtitle':
              'La moto que intentas guardar ya está en tu colección. ¿Estás seguro de que deseas reemplazarla con esta nueva captura?',
          'substitute': 'Reemplazar',
          'nullify': 'Anular',
          'motoSaved': 'Moto guardada correctamente',
          'noInternet': 'Verifica tu conexión a internet',
          'share': 'Compartir',
          'myGarage': 'Mi garaje',
          'garage': 'Garaje',
          'collection': 'Colección',
          'story': 'Historia',
          'noMotoAdded': 'Aún no has agregado motos',
          'add': 'Añadir',
          'noMotoFoundFilter': 'No se encontraron motos con estos filtros',
          'helloBiker': '¡Hola Biker!',
          'tournaments': 'Torneos',
          'profile': 'Perfil',
          'leaderboard': 'Clasificación',
          'generalLeaderboard': 'Clasificación general',
          'winner': 'Ganador',
          'noWinner': 'El ganador aún no ha sido elegido',
          'winnerIs': 'El ganador es:',
          'codeEmpty': 'El código no puede estar vacío',
          'emailNoEmpty': 'El correo electrónico no puede estar vacío',
          'emailNotValid': 'Introduce un correo electrónico válido',
          'password': 'Contraseña',
          'newPassword': 'Nueva contraseña',
          'oldPassword': 'Contraseña anterior',
          'passwordConfirm': 'Confirmar contraseña',
          'changePassword': 'Cambiar contraseña',
          'pwdForgot': '¿Olvidaste tu contraseña?',
          'pwdNoEmpty': 'La contraseña no puede estar vacía',
          'pwd8chars': 'La contraseña debe tener al menos 8 caracteres',
          'pwdNoCoincide': 'Las contraseñas no coinciden',
          'name': 'Nombre',
          'nameNoEmpty': 'El nombre no puede estar vacío',
          'surname': 'Apellido',
          'surnameNoEmpty': 'El apellido no puede estar vacío',
          'username': 'Nombre de usuario',
          'usernameNoEmpty': 'El nombre de usuario no puede estar vacío',
          'birthday': 'Fecha de nacimiento',
          'birthdayNoEmpty': 'La fecha de nacimiento no puede estar vacía',
          'selectAvatar': 'Seleccionar avatar',
          'mustSelectAvatar': 'Debes seleccionar un avatar',
          'confirm': 'Confirmar',
          'register': 'Registrarse',
          'registerYou': 'Regístrate',
          'codeViaEmail': 'Introduce el código recibido por correo electrónico',
          'insertCode': 'Introduce el código',
          'anotherCode': 'Solicitar otro código',
          'codeSent': 'Código enviado',
          'registerGoogle': 'Regístrate con Google',
          'access': 'Acceder',
          'or': 'o',
          'welcomeBack': '¡Bienvenido de nuevo!',
          'noAccount': '¿No tienes una cuenta? Regístrate',
          'email': 'Correo electrónico',
          'resetEmailSent': 'Correo de restablecimiento @statusenviado',
          'already': 'ya',
          'whereSelectImg': '¿De dónde deseas seleccionar la imagen?',
          'camera': 'Cámara',
          'gallery': 'Galería',
          'alreadyAccount': '¿Ya tienes una cuenta? Accede',
          'privacy': 'Privacidad',
          'acceptPrivacy': 'Debes aceptar la privacidad',
          'captureDate': 'Fecha de captura',
          'save': 'Guardar',
          'dataSaved': 'Datos guardados correctamente',
          'nation': 'País',
          'favouriteMotoSaved': 'Moto guardada como favorita',
          'info': 'Información',
          'state': 'Estado',
          'received': 'Recibido @when',
          'read': 'Leído @when',
          'notifications': 'Notificaciones',
          'delete': 'Eliminar',
          'deleteNotifications': 'Eliminar notificaciones',
          'deleteNotificationsSure':
              '¿Estás seguro de que deseas eliminar todas las notificaciones?',
          'noNewNotifications': 'No hay nuevas notificaciones',
          'noCollecting': 'Aún no has coleccionado ninguna moto',
          'startCollecting': 'Empieza a coleccionar',
          'chooseMoto': 'Elige tu moto',
          'chooseYou': '¡Te elijo a ti!',
          'motoForRaceTitle':
              '¿Es esta la moto que deseas utilizar para la carrera?',
          'motoForRaceMessage':
              'Una vez elegida no podrás cambiarla hasta el próximo torneo.',
          'choose': 'Elegir',
          'selectedMoto': 'Moto seleccionada',
          'selectedMotoError': 'Error al seleccionar la moto',
          'seeInfo': 'Ver información',
          'motoRegistered': 'Moto registrada en el torneo con éxito',
          'backHome': 'Volver al inicio',
          'jump': 'Saltar',
          'medals': 'Medallas',
          'noMedals': 'Aún no has ganado ninguna medalla',
          'cockades': 'Cintas',
          'noCockades': 'Aún no has ganado ninguna cinta',
          'numMotosCaptured': '@howMany motos capturadas',
          'errorLoadingPartecipation': 'Error al cargar la participación',
          'noTournamentsPartecipations':
              'Aún no has participado en ningún torneo',
          'partecipateTournaments': 'Participa en el torneo',
          'wins': 'Victorias',
          'topMoto': 'Moto principal',
          'percMotosCaptured': 'Motos capturadas: @realNum@limit',
          'capturedMotos': 'Motos capturadas',
          'deleteAccount': 'Eliminar cuenta',
          'deleteAccountTitle':
              '¿Estás seguro de que deseas eliminar tu cuenta?',
          'deleteAccountMessage':
              'Una vez confirmado, no podrás acceder a tu perfil',
          'savingCompleted': 'Guardado completado',
          'privacyPolicy': 'Términos y condiciones',
          'tournament': 'Torneo',
          'alreadyVoted': 'No puedes votar de nuevo en esta ronda',
          'pointGained': '¡Has ganado un punto!',
          'vote': 'Votar',
          'ok': 'Ok',
          'points': 'Puntos @howMany',
          'home': 'Inicio',
          'photocamera': 'Cámara',
          'logout': 'Cerrar sesión',
          'logoutTitle': '¿Estás seguro de que deseas salir?',
          'logoutMessage':
              'Una vez que salgas, deberás iniciar sesión nuevamente para usar la aplicación',
          'exit': 'Salir',
          'apply': 'Aplicar',
          'cancel': 'Cancelar',
          'search': 'Buscar',
          'updatedLanguage': 'Idioma actualizado',
          'nonUpdatedLanguage': 'Error en la actualización del idioma',
          'chooseLanguage': 'Elige tu idioma',
          'insertBrand': 'Inserta la marca',
          'insertModel': 'Inserta el modelo',
          'insertYear': 'Inserta el año',
          'insertLocation': 'Inserta el lugar',
          'insertOldPassword': 'Inserta la contraseña antigua',
          'insertNewPassword': 'Inserta la nueva contraseña',
          'insertConfirmPassword': 'Inserta la contraseña de confirmación',
          'medal': 'Medalla @name',
          'bronze': 'Bronce',
          'silver': 'Plata',
          'gold': 'Oro',
          'platinum': 'Platino',
          'diamond': 'Diamante'
        },
        'fr': {
          'hello': 'Bonjour',
          'welcome': 'Bienvenue !',
          'frwd': 'Avancer',
          'presentation1Title': 'Collectionnez',
          'presentation1Subtitle1':
              'Collectionnez vos motos préférées en un clic',
          'presentation2Title': 'Tournois',
          'presentation2Subtitle1':
              'Participez avec vos motos préférées et gagnez des médailles',
          'presentation3Title': 'Communauté',
          'presentation3Subtitle1':
              'Partagez vos aventures à moto avec vos amis',
          'orderBy': 'Trier par',
          'type': 'Type',
          'brand': 'Marque',
          'emptyCommunity': 'La communauté est vide',
          'community': 'Communauté',
          'seeAll': 'Voir tout',
          'model': 'Modèle',
          'year': 'Année',
          'location': 'Emplacement',
          'description': 'Description',
          'addMoto': 'Ajouter une moto',
          'motoAlreadyInserted': 'Moto déjà ajoutée',
          'motoAlreadyInsertedSubtitle':
              'La moto que vous essayez de sauvegarder est déjà dans votre collection. Êtes-vous sûr de vouloir la remplacer par cette nouvelle capture ?',
          'substitute': 'Remplacer',
          'nullify': 'Annuler',
          'motoSaved': 'Moto enregistrée avec succès',
          'noInternet': 'Vérifiez votre connexion Internet',
          'share': 'Partager',
          'myGarage': 'Mon garage',
          'garage': 'Garage',
          'collection': 'Collection',
          'story': 'Histoire',
          'noMotoAdded': 'Vous n\'avez pas encore ajouté de motos',
          'add': 'Ajouter',
          'noMotoFoundFilter': 'Aucune moto trouvée avec ces filtres',
          'helloBiker': 'Salut Motard !',
          'tournaments': 'Tournois',
          'profile': 'Profil',
          'leaderboard': 'Classement',
          'generalLeaderboard': 'Classement général',
          'winner': 'Gagnant',
          'noWinner': 'Le gagnant n\'a pas encore été désigné',
          'winnerIs': 'Le gagnant est :',
          'codeEmpty': 'Le code ne peut pas être vide',
          'emailNoEmpty': 'L\'email ne peut pas être vide',
          'emailNotValid': 'Veuillez entrer un email valide',
          'password': 'Mot de passe',
          'newPassword': 'Nouveau mot de passe',
          'oldPassword': 'Ancien mot de passe',
          'passwordConfirm': 'Confirmer le mot de passe',
          'changePassword': 'Changer le mot de passe',
          'pwdForgot': 'Mot de passe oublié ?',
          'pwdNoEmpty': 'Le mot de passe ne peut pas être vide',
          'pwd8chars': 'Le mot de passe doit contenir au moins 8 caractères',
          'pwdNoCoincide': 'Les mots de passe ne correspondent pas',
          'name': 'Nom',
          'nameNoEmpty': 'Le nom ne peut pas être vide',
          'surname': 'Prénom',
          'surnameNoEmpty': 'Le prénom ne peut pas être vide',
          'username': 'Nom d\'utilisateur',
          'usernameNoEmpty': 'Le nom d\'utilisateur ne peut pas être vide',
          'birthday': 'Date de naissance',
          'birthdayNoEmpty': 'La date de naissance ne peut pas être vide',
          'selectAvatar': 'Sélectionner un avatar',
          'mustSelectAvatar': 'Vous devez sélectionner un avatar',
          'confirm': 'Confirmer',
          'register': 'S\'inscrire',
          'registerYou': 'Inscrivez-vous',
          'codeViaEmail': 'Entrez le code reçu par email',
          'insertCode': 'Entrez le code',
          'anotherCode': 'Demander un autre code',
          'codeSent': 'Code envoyé',
          'registerGoogle': 'S\'inscrire avec Google',
          'access': 'Accéder',
          'or': 'ou',
          'welcomeBack': 'Bienvenue de retour !',
          'noAccount': 'Pas de compte ? Inscrivez-vous',
          'email': 'Email',
          'resetEmailSent': 'Email de réinitialisation @statusenvoyé',
          'already': 'déjà',
          'whereSelectImg': 'D\'où souhaitez-vous sélectionner l\'image ?',
          'camera': 'Caméra',
          'gallery': 'Galerie',
          'alreadyAccount': 'Vous avez déjà un compte ? Accédez',
          'privacy': 'Confidentialité',
          'acceptPrivacy': 'Vous devez accepter la confidentialité',
          'captureDate': 'Date de capture',
          'save': 'Enregistrer',
          'dataSaved': 'Données enregistrées avec succès',
          'nation': 'Pays',
          'favouriteMotoSaved': 'Moto enregistrée comme favorite',
          'info': 'Informations',
          'state': 'État',
          'received': 'Reçu @when',
          'read': 'Lu @when',
          'notifications': 'Notifications',
          'delete': 'Supprimer',
          'deleteNotifications': 'Supprimer les notifications',
          'deleteNotificationsSure':
              'Êtes-vous sûr de vouloir supprimer toutes les notifications ?',
          'noNewNotifications': 'Pas de nouvelles notifications',
          'noCollecting': 'Vous n\'avez pas encore collecté de motos',
          'startCollecting': 'Commencez à collectionner',
          'chooseMoto': 'Choisissez votre moto',
          'chooseYou': 'Je te choisis !',
          'motoForRaceTitle':
              'Est-ce la moto que vous souhaitez utiliser pour la course ?',
          'motoForRaceMessage':
              'Une fois choisie, vous ne pourrez plus la changer avant le prochain tournoi.',
          'choose': 'Choisir',
          'selectedMoto': 'Moto sélectionnée',
          'selectedMotoError': 'Erreur lors de la sélection de la moto',
          'seeInfo': 'Voir les informations',
          'motoRegistered': 'Moto enregistrée pour le tournoi avec succès',
          'backHome': 'Retour à l\'accueil',
          'jump': 'Sauter',
          'medals': 'Médailles',
          'noMedals': 'Vous n\'avez pas encore gagné de médailles',
          'cockades': 'Cocardes',
          'noCockades': 'Vous n\'avez pas encore gagné de cocardes',
          'numMotosCaptured': '@howMany motos capturées',
          'errorLoadingPartecipation':
              'Erreur lors du chargement de la participation',
          'noTournamentsPartecipations':
              'Vous n\'avez encore participé à aucun tournoi',
          'partecipateTournaments': 'Participer au tournoi',
          'wins': 'Victoires',
          'topMoto': 'Moto principale',
          'percMotosCaptured': 'Motos capturées : @realNum@limit',
          'capturedMotos': 'Motos capturées',
          'deleteAccount': 'Supprimer le compte',
          'deleteAccountTitle':
              'Êtes-vous sûr de vouloir supprimer votre compte ?',
          'deleteAccountMessage':
              'Une fois confirmé, vous ne pourrez plus accéder à votre profil',
          'savingCompleted': 'Sauvegarde terminée',
          'privacyPolicy': 'Termes et conditions',
          'tournament': 'Tournoi',
          'alreadyVoted': 'Vous ne pouvez plus voter dans cette manche',
          'pointGained': 'Vous avez gagné un point !',
          'vote': 'Voter',
          'ok': 'Ok',
          'points': 'Points @howMany',
          'home': 'Accueil',
          'photocamera': 'Appareil photo',
          'logout': 'Se déconnecter',
          'logoutTitle': 'Êtes-vous sûr de vouloir vous déconnecter ?',
          'logoutMessage':
              'Une fois déconnecté, vous devrez vous reconnecter pour utiliser l\'application',
          'exit': 'Quitter',
          'apply': 'Appliquer',
          'cancel': 'Annuler',
          'search': 'Rechercher',
          'updatedLanguage': 'Langue mise à jour',
          'nonUpdatedLanguage': 'Échec de la mise à jour linguistique',
          'chooseLanguage': 'Choisissez votre langue',
          'insertBrand': 'Insérer la marque',
          'insertModel': 'Insérer le modèle',
          'insertYear': 'Insérer l\'année',
          'insertLocation': 'Insérer le lieu',
          'insertOldPassword': 'Insérer l\'ancien mot de passe',
          'insertNewPassword': 'Insérer le nouveau mot de passe',
          'insertConfirmPassword': 'Insérer le mot de passe de confirmation',
          'medal': 'Médaille @name',
          'bronze': 'Bronze',
          'silver': 'Argent',
          'gold': 'Or',
          'platinum': 'Platine',
          'diamond': 'Diamant'
        }
      };
}
