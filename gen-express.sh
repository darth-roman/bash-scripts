#!/usr/bin/bash

mkdir $1
echo "created $1"

cd $1
echo "accessed $1"

# VARS
MODULES=(express dotenv bcrybt jsonwebtoken cookie-parser)
TEMP_ENGINE=()
DB_PROVIDER=()

# Args
for args in "$@"; do
    shift
    case "$args" in
        '--pug') TEMP_ENGINE=(pug);;
        '--ejs') TEMP_ENGINE=(ejs);;
        '--mongoo') DB_PROVIDER+=(mongoose);;
        '--mysql')
            DB_PROVIDER+=(sequelize mysql2)
            ;;
    esac
done

MODULES+=("${DB_PROVIDER[@]}")
MODULES+=("${TEMP_ENGINE[@]}")

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
    local express_modules=("${MODULES[@]}")

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
        res.send("Si vis pacem, para bellum!")
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