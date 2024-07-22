# HackMeIfYouCan Solution 🚀

## Introduction

Ce projet montre comment résoudre le challenge du contrat intelligent `HackMeIfYouCan`. Voici un guide simple pour chaque fonction que nous devons manipuler. Suivez les étapes et gagnez des points! 🏆

## Étapes de la Solution

### 1. Fonction `flip` 🎲

**But:** Gagner des points en devinant correctement la face de la pièce.

**Solution:** Appeler la fonction `flip` avec la valeur `false` pour obtenir des points. Assurez-vous de répéter cela jusqu'à ce que vous ayez les points nécessaires.

### 2. Fonction `addPoint` ➕

**But:** Ajouter un point.

**Solution:** Utiliser un proxy pour appeler la fonction `addPoint` depuis une autre adresse. Cela permet de contourner les restrictions et d'ajouter des points.

### 3. Fonction `transfer` 💸

**But:** Transférer des fonds et gagner des points si certaines conditions sont remplies.

**Solution:** Appeler la fonction `transfer` avec des paramètres arbitraires pour déclencher les conditions nécessaires pour obtenir des points.

### 4. Fonction `goTo` 🏢

**But:** Se rendre à un étage spécifique et gagner des points.

**Solution:** Utiliser un contrat malveillant qui implémente l'interface `Building`. Ce contrat doit manipuler la fonction `isLastFloor` pour alterner les réponses entre vrai et faux, permettant ainsi de tromper le contrat principal pour obtenir des points.

### 5. Fonction `sendKey` 🔑

**But:** Envoyer la clé correcte pour gagner des points.

**Solution:** Charger la clé correcte depuis le stockage du contrat et utiliser cette clé pour appeler la fonction `sendKey`.

### 6. Fonction `sendPassword` 🔒

**But:** Envoyer le mot de passe correct pour gagner des points.

**Solution:** Charger le mot de passe correct depuis le stockage du contrat et utiliser ce mot de passe pour appeler la fonction `sendPassword`.

### 7. Fonction `contribute` 💰

**But:** Contribuer des fonds et gagner des points.

**Solution:** Contribuer un montant spécifique de fonds et ensuite appeler la fonction du contrat qui permet d'envoyer de l'argent. Cela déclenchera les conditions nécessaires pour obtenir des points.

By me... 🚀

```

```
