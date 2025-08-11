# Bash Scripts

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
$> gh-ssh-gen <key-name> <passphrase> <email> <ssh-title>
```
**All Are required**

**IMPORTANT**: Using this script will have to you use your own Personal Access Token, or Fine grained ones, just make sure you set SSH Key in permissions to read and write 

[**More Information: Github Docs**](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token)