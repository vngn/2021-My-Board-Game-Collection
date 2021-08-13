**Cahier des charges / projet Z**

**Objectif**

Réalisation d’un site sur le thème ludique des jeux. Le site permettra la consultation de nombreux jeux, que l’on pourra paramétrer selon ses choix, et d’en faire l’acquisition. Après s’être enregistré et s’être connecté, l’utilisateur aura accès à différentes pages : 
- Une page bibliothèque présentera virtuellement sa collection
- Une page profil lui permettra d’actualiser son profil et de récupérer des informations liées à sa collection (nombre de jeux, valeur totale, historique des achats…)

L’administrateur du site aura bien entendu accès à des actions de gestion, du contenu et des utilisateurs.

Exigences du projet :
- Le site aura une connexion avec une base de données
- Un système d’authentification sera implémenté
- Un système de rôles sera utilisé : Admin et User
- Le site sera mis en ligne
- Une page de contact intègrera la gestion d’envoi d’email
- Le code sera commenté quand nécessaire
- Bootstrap et jQuery seront utilisés
- Le projet sera déposé sur GitHub dès son démarrage

- Factures, bibliothèque et autres éléments pourront être générés en PDF
- Valorisation du site en front-end

- Système de paiement Stripe ?

**Vue globale**

- une page d’accueil, qui présente l’objet du projet
- une page catalogue, qui présente la totalité des produits, avec possibilités de tri, de sélection
- une page bibliothèque, qui présente exclusivement les produits achetés par l’utilisateur
- une page profil, qui permet la gestion de son propre profil et l’affichage des achats (+ options de gestion)
- une page de contact, avec un formulaire de contact et coordonnées diverses

Qui nécessitera en plus :
- une page d’enregistrement classique
- une page de connexion classique
- une page de gestion de contenu permettant d’ajouter de nouveaux produits, et de gérer les anciens
- une page de gestion des utilisateurs permettant d’afficher la liste des utilisateurs, de gérer les rôles et d’exclure si nécessaire

**Contenu des pages**

Page accueil :
->	Présentation du projet
->	Lien vers le cahier des charges
->	Lien vers les éléments développés (UML, diagrammes, wireframes…)

Page catalogue :
->	Carrousel avec les nouveautés
->  Champs de recherche
->	Tableau avec affichage global
->	Possibilité de tri par champs
->	Possibilité de mise dans le panier / catch and drop ?
->	Possibilité de voir les détails d’un contenu spécifiquement

Page bibliothèque :
->  Champs de recherche
->	Tableau avec affichage spécifique au profil
->	Possibilité de tri par champs
->	Possibilité de voir les détails d’un contenu spécifiquement

Page profil :
->	Affichage des informations profil
->	Affichage de l’historique des achats

Page de contact :
->	Formulaire de contact
->	Coordonnées diverses

Page d’enregistrement :
->	Formulaire d’enregistrement

Page de connexion :
->	Formulaire de connexion

Page de gestion des contenus :
->	Formulaire(s) d’ajout/modification de contenu
->	Ajout de gestion sur page catalogue

Page de gestion des utilisateurs :
->	Tableau avec affichage des informations des profils
->	Ajout d’options de gestion

**La bdd**

Table profil :
->  Rôle*
->	Nom
->	Prénom
->	Avatar
->	Pseudo*
->	Mail*
->	Mot de passe*

Table produit :
->	Nom
->	Image principale
->	Images secondaires*4
->	Description
->	Langue
->	Editeur
->	Date de sortie
->	Catégorie
->	Prix

**Pages en détail**

Page accueil :
->	Présentation du projet :
    Bienvenue sur ma nouvelle réalisation. Ce site a été développé avec Symfony 5 dans le cadre d'un exercice de fin de formation. La période de travail sur ce projet s'est étalée du 26 juillet au 11 aôut 2021. 
    Le thème de ce site est la gestion de bibliothèque de jeux. 
    Une bibliothèque générale, type catalogue, est disponible à tous. Elle permet une personnalisation des champs d'affichage ainsi qu'un détail de chaque jeu sur une page spécifique (imprimable en PDF).
    Vous pouvez vous inscrire, et ainsi accéder à un espace personnel (une page profil et une bibliothèque individuelle):
        - la page profil permettra la gestion des informations suivantes : ajout/modification prenom, nom, avatar, pseudo, mot de passe, voir la supprssion du profil
        - la page bibliothèque affichera ses propres jeux ainsi que des options de gestion (ajout/modification, suppression) et d'analyse (valeur totale, par nom, editeur, annee...)
    L’administrateur du site aura bien entendu accès à des actions de gestion, du contenu et des utilisateurs.
    Les exigences du projet étaient les suivantes :
    - Le site aura une connexion avec une base de données
    - Un système d’authentification sera implémenté
    - Un système de rôles sera utilisé : Admin et User
    - Le site sera mis en ligne
    - Une page de contact intègrera la gestion d’envoi d’email
    - Le code sera commenté quand nécessaire
    - Bootstrap et jQuery seront utilisés
    - Le projet sera déposé sur GitHub dès son démarrage
    - Factures, bibliothèque et autres éléments pourront être générés en PDF
    - Valorisation du site en front-end
    - Système de paiement Stripe ?

Pages catalogue / bibliotheque :
-> champs de recherche
-> tableau affichant la totalité des produits, avec informations suivantes :
    - nom du jeu
    - image du jeu
    - images de contenu (cb ?)
    - description du jeu
    - langue (français/anglais)
    - editeur
    - date de sortie (année)
    - catégorie (jeu de base, extension, add-ons, accessoires, autre)
    - prix
-> possibilité de personnalisation de l'affichage (sélection et ordre d'affichage) :
    - par nom
    - par catégorie
    - par année
    - par editeur
    - par langue

Page bibliotheque seulement :
->  valorisation de la bibliotheque, extraction de statistiques diverses
->  acces page profil
->	affichage des informations profil et éléments de gestion
->	affichage de l’historique des achats
