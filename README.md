__English :__

We realized this project for our "__[INF7845 - Advanced OOP principles](https://info.uqam.ca/~privat)__" course's session project at UQAM. Our purpose was to develop a generic version of the cellular automatons in order to add it to the [Nit Language](http://nitlanguage.org). We tried to recreate every function anyone could need to manipulate our module. If you want some application cases, look at `gol` or `universe`'s files. The `gol` is the implementation of the [Game Of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) cellular automaton and the `universe` is an attempt to recreate a simulation of a universe with more rules and possibilities than the Game Of Life. If you want to do your own implementation just extend the class `Cell`, `CellularAutomaton`, `Rule` and follow the examples through both GOL and Universe implementation. Every function should be commented, but if you have any problem don't hesitate and contact us.

To execute the program you will need a functional nit environment ([Setup Nit](https://github.com/nitlang/nit)), then in this directory type the following commands :

	nitc main.nit
	./main

And follow the different steps shown on the terminal to execute either Game of Life or Universe.

__Français :__

Nous avons réalisé ce projet dans le cadre de notre projet de session à l'UQAM pour le cours "__[INF7845 - Principes avancés des langages à objets](https://info.uqam.ca/~privat)__". Nous voulions réaliser une version générique des automates cellulaires afin de l'ajouter en tant que module complémentaire au [Langage Nit](http://nitlanguage.org). Nous avons essayé de réaliser un maximum de fonctions afin de pouvoir manipuler simplement notre module. Si vous voulez des exemples d'applications de ce dernier, allez voir du coté des fichiers `gol` et `universe`. Les fichiers `gol` sont une implémentation de l'automate cellulaire du [Game Of Life](https://fr.wikipedia.org/wiki/Jeu_de_la_vie) et les fichiers `universe` sont un essai de réalisation d'un simulateur d'univers avec plus de règles et possibilitées que le Game Of Life. Si vous voulez réaliser votre propre implémentation, vous avez juste à hériter les classes `Cell`, `CellularAutomaton`, `Rule` et suivre les deux exemples précédents. Toutes les fonctions devraient être commentées, mais si vous recontrez un problème n'hésitez pas à nous contacter.

Pour éxécuter le programme vous devez avoir un environnement Nit fonctionnel ([Installer Nit](https://github.com/nitlang/nit)), dans ce répertoire taper :

	nitc main.nit
	./main

Et suivez les différentes étapes pour exécuter Game of Life ou Universe.