# protospace
* Database creation
  1.jobs table
   t.integer :name
   t.text :text
   t.date :date
   t.time :start_time
   t.time :end_time
   t.string :place
   t.text :image
   t.integer :use_id

  2.users table
   t.text :family_name
   t.text :first_name
   t.text :family_name_kana
   t.text :first_name_kana
   t.text :email
   t.date :birth_day
   t.integer :prefecture
   t.text :image
   t.integer :payment

  3.comments table
   t.integer :user_id
   t.integer :jobs_id
   t.text :text

  *アソシエーションについて*
   Job has many Users, Comments
   User has many Comments
   User belongs to Job
   Comment belongs to Job, User
