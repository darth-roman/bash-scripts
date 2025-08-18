#!/usr/bin/bash

mkdir $1
echo "created $1"

cd $1
echo "accessed $1"


createDirectories(){
    local directories=(controllers routes views models middlewares config public)

    for directory in "${directories[@]}"; do
        mkdir "$directory"
        echo "created $directory"
    done

    echo "Directories, Created!"

}

initProject(){
    npm init -y
    git init
}


installModules(){
    local express_modules=(express dotenv mongoose bcrybt jsonwebtoken cookie-parser ejs)

    for module in "${express_modules[@]}"; do
        npm install "$module"
        echo "installed $module"
    done

    #nodmon
    npm install nodemon -D
    echo "installed nodemon"


    echo "Modules, Installed!"

}

createFiles(){
    local files=(.env .gitignore index.js README.md)

    for file in "${files[@]}"; do
        touch "$file"

        echo "created $file"
    done

    echo "Files, Created!"

}

writeBoilerplateCodeIndex(){
    cat << EOL >> index.js
    import express from "express"

    const PORT = process.env.PORT || 3000
    const App = express()

    App.get("/", (req, res, next) => {
        res.send("Roman Salute")
    })

    App.listen(PORT, () => {
        console.log("Listening to: "+PORT)
    })
EOL
    echo "Done with index.js"
}

initProject
createDirectories
createFiles
installModules
writeBoilerplateCodeIndex