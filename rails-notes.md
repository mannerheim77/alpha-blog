# Rails Notes

- Rails uses an ORM called "ActiveRecord" to communicate from your Rails app to the database
- ActiveRecord is not rails specific; its also used in other web frameworks

##Installing dev/test vs production gems

- put sqlite3 in your `group :development, :test do` section of your `Gemfile`
- add postgress in your `group :production do` section
- run `bundle install --without production` to only install dev/test gems
    - if you get command not found, then run `gem install bundler`, then try it again
- `bundle install` will make the necessary updates to your Gemfile.lock file that's necessary
  for deploying to production
- Do a git commit, then push to heroku:
    - `git push heroku master`
- To change the name of your heroku app, you can type in this command:
    - `heroku rename <new-name>`.  If it's available, it will rename your app, and the git repo

