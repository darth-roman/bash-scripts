#!/usr/bin/bash
createController(){
    if ! [ -d "controllers" ]; then
        mkdir "controllers"
    fi
    local filename=controllers/"$1Controller.$2"
    touch $filename
    echo "$filename created successfully."
}
createModel(){
    if ! [ -d "models" ]; then
        mkdir "models"
    fi
    local filename=models/"$1.$2"
    touch $filename
    echo "$filename created successfully. "
}
createRoutes(){
    if ! [ -d "routes" ]; then
        mkdir "routes"
    fi
    local filename=routes/"$1Routes.$2"
    touch $filename
    echo "$filename created successfully. "
}
createController $1 $2
createModel $1 $2
createRoutes $1 $2