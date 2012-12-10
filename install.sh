# TODO
read -p "WARNING - this will overwrite existing files in your \$HOME. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for file in bash* git* tcsh*
  do
    ln -fs "$PWD/$file" "$HOME/.$file"
    echo "$file --> $HOME/.$file"
  done
fi

