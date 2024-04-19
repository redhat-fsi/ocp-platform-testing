from ubi8/ubi

copy entrypoint.sh /bin/entrypoint.sh
run chmod +x /bin/entrypoint.sh

# Prereqs
run dnf install -y git-core gcc rust patch make bzip2 openssl-devel libyaml-devel libffi-devel zlib-devel gdbm-devel ncurses-devel

# rbenv for getting old (but not too old) ruby
run git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bash_profile && \
source ~/.bash_profile && \

# Needed for actually installing a Ruby version
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build && \

# Last stable version of Ruby 2.7.x
rbenv install 2.7.8 && \
rbenv global 2.7.8 && \

git clone https://github.com/openshift/verification-tests.git /tests && \
ls /tests && \
/tests/tools/install_os_deps.sh && \
/tests/tools/hack_bundle.rb && \

curl https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.15.8/openshift-client-linux-4.15.8.tar.gz -o /bin/oc.tar && \
tar xzf /bin/oc.tar --directory /bin

entrypoint ["entrypoint.sh"]

