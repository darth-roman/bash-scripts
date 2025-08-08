# Bash Scripts
[`gen-mrc`](gen-mrc.sh)
This is a tool to generate a model, a routing and a controller files, for `expressjs`(As intentded)

- It checks if a folder `controllers` , `models` and `routes` exists, then creates the three files
- If the directories do not exist, it creates them (**no shit sherlock**)

## How to use:
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