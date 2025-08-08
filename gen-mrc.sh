#!/usr/bin/bash
createController(){
    if ! [ -d "controllers" ]; then
        mkdir "controllers"
    fi
    touch controllers/"$1Controller.$2"
}
createModel(){
    if ! [ -d "models" ]; then
        mkdir "models"
    fi
    touch models/"$1.$2"
}
createRoutes(){
    if ! [ -d "routes" ]; then
        mkdir "routes"
    fi
    touch routes/"$1Routes.$2"
}
createController $1 $2
createModel $1 $2
createRoutes $1 $2
