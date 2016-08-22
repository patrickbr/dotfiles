# Installation
To set up the dotfiles on a new system:

    $ git clone --bare https://github.com/patrickbr/dotfiles.git $HOME/.dotfiles
    $ cd
    $ git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
 
You might run into conflicts when files are already existing. In this case, delete them manually and repeat `dotfiles checkout`. You can also run `dotfiles checkout -f` to overwrite existing files. You could also commit them locally and merge them.

# Managing dotfiles

Following an idea from [this thread](https://news.ycombinator.com/item?id=11070797) on Hackernews, you can set up an alias for the git invocation. For example:

    $ echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.bashrc

After sourcing your `.bashrc`, you can now do this:

    $ dotfiles status
    $ dotfiles add ~/.somecfg
    $ dotfiles commit -m 'add some cfg'