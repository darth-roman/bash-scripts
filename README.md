# Bash Scripts

    Welcome to my repositiry

## Table of Contents
You can use these to browse through the `README`

- [**`gen-mrc` Script**](#gen-mrc)
- [**`gh-ssh-gen` Script**](#gh-ssh-gen)
- [**`gen-express` Script**](#gen-express)


## [`gen-mrc`](gen-mrc.sh)
This is a tool to generate a model, a routing and a controller files, for `expressjs`(As intentded)

- It checks if a folder `controllers` , `models` and `routes` exists, then creates the three files
- If the directories do not exist, it creates them (**no shit sherlock**)

### How to use:
- download | clone the repo\
- add the clones directory to your `$PATH` variable
- It is recommended to add an alias for easy use
- `gen-mrc [entity] [file-extension]`

Example:
```bash
$> gen-mrc User ts
```

Will generate these files:
- `controllers/UserController.ts`,
- `models/User.ts`,
- `routes/UserRoutes.ts`

**IMPORTANT**: This is just a 0.0.1 version, some improvements will be added with time.


## [`gh-ssh-gen`](gh-ssh-gen.sh)
Generates and creates new SSH Key in your github account


### How to use
```bash
$> gh-ssh-gen <key-name> <email> <token-file-path> <gh-token> <ssh-title>
```
UPDATES:
- `token-file-path`: Where do you keep your keys in your system

- `gh-token`: fine grained or access token that you generated and kept inside your system

- Removed setting the passphrase from the terminal (suggested seurity measure)
**All Are required**

**IMPORTANT**: Using this script will have to you use your own Personal Access Token, or Fine grained ones, just make sure you set SSH Key in permissions to read and write 

[**More Information: Github Docs**](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token)

## [`gen-express`](gen-express.sh)
Installs the basic, at least to me, techs to start developing your `express` app

### How to use
```bash
$> gen-express [--mysql | --mongoo] [--ejs | --pug]
```

The installed `npm` packages are : `(express dotenv bcrybt jsonwebtoken cookie-parser)`
And you get to choose between `mongoose` or `mysql` using `sequelize` ORM , as Database providers
As for templating, you can use `ejs` or `pug`

As also will give structure to your project as such
```
├── config/
├── controllers/
├── index.js
├── middlewares/
├── models/
├── public/
├── README.md
├── routes/
├── views/

```

the `index.js` has a boilerplate:
```js
import express from "express"

const PORT = process.env.PORT || 3000
const App = express()

App.get("/", (req, res, next) => {
    res.send("Roman Salute")
})

App.listen(PORT, () => {
    console.log("Listening to: "+PORT)
})
```
**Options are optional, duh**
