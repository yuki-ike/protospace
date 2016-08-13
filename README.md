# protospace
* Database creation
  1.prototypes table
   t.text :image
   t.text :catch_copy
   t.text :concept
   t.text :ui
   t.text :application

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


  *アソシエーションについて*
   Prototype has many Users, Comments, Like
   User belongs to Job
   User has many Likes
   Comment belongs to Prototype, User
