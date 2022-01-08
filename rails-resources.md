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


![img_2.png](img_2.png)


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
      2. But you should ALWAYS try to create a NEW migration file instead of rolling back
2. Create article model:
   1. In `models` folder create a new file called `article.rb`
   2. Enter into the rails console:  `rails console` to test the connection to your model:
   3. Type in "Article.all"
   4. Let's create a new article directly by using `Article.create`
   5. A second way to create a new article is to use variables: `article = Article.new`
      1. Then just set the data via setters:  `article.author="Chantel Bellamy"`
      2. Then save your new article:  `article.save`
   6. A third way to create a new article directly is by using the Article constructor:
      1. `Article.new(title: "Third Article", description: "Description of Third Article", author: "Mason Bellamy")`
      2. Then save it: `article.save`
3. Read, Update, and Delete an Article:
   1. Find Article by Id:  `Article.find(<id>)`
   2. Find first Article:  `Article.first`
   3. Edit article by assigning to a variable:  `article = Article.find(2)`
   4. Delete article by `article.destroy`
4. To add data integrity constraints (or validations), you need to update the `article.rb` model file
   1. Add "title" as a required field in the model
   2. Type in `reload` in rails console to reflect model changes
   3. Then try to save an empty record:  `article = Article.new, article.save`
   4. Check the errors:  `article.errors` or even better `article.errors.full_messages`
   5. Google "active record validations" for more validations you can do on your model