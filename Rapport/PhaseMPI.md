# Explication Phase MPI

Pour effectuer la parallélisation du programme séquentiel, nous avons décider de réprésenter en mémoire les données sous forme d'une structure de tableaux avec une topologie en anneau.
La structure ne contient que les positions et les masses des corps. Les communications sont faites dans le standard non-bloquant avec recouvrement des temps de communication par le calcul.

Le problème à N-corps n'est pas très bien adapté au recouvrement des temps de communication pas le calcul. Car pour effectuer le calcul à un instant t, un noeud a besoin que les données envoyées par son prédécesseur lui soient totalement arrivées, et son successeur attend qu'il lui ait envoyé intégralement les données. Le but de ce programme étant le calcul sur un grand nombre de corps, plus le nombre de corps augmente, plus les temps de communication augmentent. De plus, l'avancement d'un noeud dépend de son prédécesseur, car tant que son prédécesseur n'a pas finit sa n-1 ème tâche, le noeud ne peut pas effectuer la tâche n. Le fait de mettre des communications persistantes ne changerait pas énormément les performances globales du programme, cependant, également par manque de temps nous n'avons pas pu effectuer ces tests.

Concernant les calculs redondants, nous avons fait le choix de ne pas utiliser la redondance des calculs. La solution d'effectuer le tour de l'anneau nous a semblé plus adaptée pour de grosse quantité de particule, mais nous n'avons pas eu le temps d'écrire le programme afin d'effectuer des tests probants et de comparer les deux solutions.

