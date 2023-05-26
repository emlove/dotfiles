
# Homechef
export PATH="/usr/local/opt/openssl@1.1/bin:/usr/local/opt/postgresql@14/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/postgresql@14/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/postgresql@14/include"

source /Users/emilylovemills/.docker/init-bash.sh || true # Added by Docker Desktop

source ~/dotfiles/bashrc
