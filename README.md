# protospace
* Database creation
  1.prototypes table
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

  5.images table
   t.integer :prototype_id
   t.text :image1
   t.text :image2
   t.text :image3

  *アソシエーションについて*
   Prototype has many Comments, Like, Images
   User belongs to Prototype
   User has many Comments, Likes
   Comment belongs to Prototype, User
   Like belongs to Prototype, User
   Images belongs to Prototype
