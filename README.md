# *Particula.jl*

This is the julia implementation of the `particula` package: uncscode/particula.

## Development

For development, you can fork this repository and then "develop" it as follows.

0. Ensure you have julia installed on your system. Start the julia REPL.
1. Start by going to the root of the repository. This could be accomplished by hitting `;` (getting you `shell>` prompt) and then `cd` to the the root of this repository.
2. Then, you should move to the  `pkg` prompt by typing `]`, you will see `(v1.x) pkg>`.
3. Now you can type `dev .`. This will create a new symlink to this directory in your `~/.julia/dev/` directory.
4. Now, exit the `pkg` prompt by hitting backspace to get the `julia>` prompt.
5. For interactive development, you can use `Revise` (i.e. `julia> using Revise`) so that your updates to the source files are reflected (recompiled) in the julia REPL.
6. Now, `import Particula` to load the package.