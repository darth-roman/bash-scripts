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

while getopts "mcr" args; do
    case $args in
        m)  createModel $2 $3;;
        c)  createController $2 $3;;
        r)  createRoutes $2 $3;;
    esac
done
