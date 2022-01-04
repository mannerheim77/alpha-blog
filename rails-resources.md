##Rails Resources

- In Rails, a "resource" consists of the following:
    - database table
    - model
    - controller
    - views
- You can use a "scaffolding generator" to generate resources
    - `rails generate scaffold Article title:string description:text`
- Rails convention is to have model name singular (ex: article) and the table name plural (ex: articles)
- So for an "article" resource:
  - Model name: article
  - Model filename: article.rb
  - Model classname: Article
  - Table name: articles

##Creating an article resource from scratch
1. Create new database table:
   1. Generate a migration file:  `rails generate migration create_articles`
   2. Edit the new file that got created, add in your columns (attributes)
   3. Run the migration file (rails will keep track of which files have already been migrated):
      1. `rails db:migrate`
   4. Check out the details of the new table in `schema.rb`
   5. If you screwed something up, you can't just update the existing create_articles.rb file, you have to first
      do a rollback like this:
      1. `rails db:rollback`  <-- This will roll back the last db change
   6. But you should ALWAYS try to create a NEW migration file instead of rolling back