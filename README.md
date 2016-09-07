# protospace
* Database creation
  1.prototypes table
   t.text :catch_copy
   t.text :concept
   t.text :title

  2.users table
   t.text :username
   t.text :image
   t.text :email
   t.text :password
   t.text :member of
   t.text :profile
   t.text :works

  3.comments table
   t.integer :user_id
   t.integer :prototype_id
   t.text :text

  4.likes table
   t.integer :user_id
   t.integer :prototype_id

  5.contens table
   t.integer :prototype_id
   t.text :content

  *アソシエーションについて*
   Prototype has many Comments, Likes, Contents
   User belongs to Prototype
   User has many Comments, Likes
   Comment belongs to Prototype, User
   Like belongs to Prototype, User
   Contents belongs to Prototype
