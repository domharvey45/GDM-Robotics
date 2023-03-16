# Useful Commands

## Git Commands

### Multiline Commit Messages

By typing `git commit` without the `-m` flag, your terminal will open a test editor and you can write out you multiline commit message.

### [git log](https://git-scm.com/docs/git-log)

```bash
git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all
```

Produces the following output

```bash
* a9e6451 - (14 hours ago) RubenHeyse (HEAD -> dev, origin/dev) - Core files
| * 6376dc7 - (14 hours ago) RubenHeyse (main) - Formatting
| * 7b9af9e - (14 hours ago) RubenHeyse - core guidelines
|/  
* de72f9d - (2 days ago) Dom Harvey (origin/main, origin/HEAD) - Update README.md
* f65e6b5 - (2 days ago) Dom Harvey - Delete Sylvia and reserve repo for just Mickey
*   64adda1 - (2 days ago) Dom Harvey - Merge pull request #2 from domharvey45/testBranch
|\  
| *   e20ddff - (2 days ago) Dom Harvey - Merge branch 'main' into testBranch
| |\  
| |/  
|/|   
* |   ae6ab15 - (2 days ago) Dom Harvey - Merge pull request #1 from domharvey45/testBranch
|\ \  
| | * 50d6a75 - (2 days ago) Dom Harvey - testbranch merge 2
| |/  
| *   c4e861a - (2 days ago) Dom Harvey - Merge branch 'main' into testBranch
| |\  
| |/  
|/|   
* | b67a3d6 - (2 days ago) Ruben Heyse - Add core planning docs
| * 91ce107 - (2 days ago) Dom Harvey - branch creation check
|/  
* a04b349 - (2 days ago) Dom Harvey - Github check
* b9ddabe - (3 days ago) Dom Harvey - Update README.md
* 75d1bda - (3 days ago) Dom Harvey - updated README
* 75d8ceb - (3 days ago) Dom Harvey - Initialise Mickey
* 0b13449 - (3 days ago) Dom Harvey - Initiate Sylvia
* e810a4d - (3 days ago) Dom Harvey - Initialise repo and Sylvia
* 662cbdd - (3 days ago) domharvey45 - Update README.md
* 8a338ab - (3 days ago) domharvey45 - Initial commit
```

### View the status of any commit

```bash
git show <commit> --stat
```

`<commit>` is the base64 string that is the commit ID.

### View specific file changes for a commit

```bash
git show <commit> -- <filepath>
```

`<filepath>` being the path for the file you want to see the changes for.
