pushd `dirname $0`
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
#bundle exec rake db:migrate RAILS_ENV=test
#bundle exec rake db:seed RAILS_ENV=test
popd