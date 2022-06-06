# Flutter Rest API | Client & Serveur

`Client : flutterapp | server : flutter-rest-api`

![Alt text](/images/loginpage.png "login page")
![Alt text](/images/homepage.png "Home page")
![Alt text](/images/productspage.png "Products page")
![Alt text](/images/productdescriptionpage.png "Product description page")

## Client (Dart/Flutter)

`Le projet a été crée en utilisant le device de Chrome (chrome) [2].`

```
Lancement du projet/client : 
    - flutter run 
    - [2]


login :
    Utilisateur 1
        - email : alex@bg.com 
        - password : pass123

    Utilisateur 2
        - email : emmanuel@bg.com 
        - password : pass321
```

`Contenu du projet :`

```
    Une page de login 
    Une page d'accueil
    Une page de contact
    Une page des produits (burgers)
    Une page de description de chaque produit (burger)
    Une page équipe [+]


    Toute les pages sont accessible uniquement si l'utilisateur est connecté
```

-------

## Serveur (NodeJs)

`<!> Le projet a été configuré avec le port 3001 du coté serveur, s'il est changé manuelement, il faudra également le modifier du coté client dans <!>`

=> `/lib/api/apiManager.dart`

```
Lancement du projet/serveur : 
    - yarn dev


API :
    - get :
        - products 
            - /products
        - product (id)
            - /products/:id
    - post :
        - login (email, password)
            - /login 


Base de donnée : 
    base de donnée JSON situé dans 
        [+] db
            - products.json
            - users.json
```