DB設計

##Users_table

###association

* user has_many :projects
* user has_many :comments
* user has_many :likes

###column

* t.integer :id
* t.string  :name
* t.string  :mail
* t.string  :password
* t.text :profile_image
* t.text  :profile
* t.text  :works
* t.references :project_id
* t.references :likes_id


## Projects_table

###association

* project belongs_to :user
* project has_many   :comments
* project has_many   :Thumbnails
* project has_many   :likes

###column

* t.integer :id
* t.string :title
* t.text :catch_copy
* t.text :concept
* t.timestamps
* t.references :user_id
* t.references :likes_id


## Thumbnail_table

###association

* Thumbnails belongs_to :project

### column

* t.integer :id
* t.text :image
* t.references :project_id

##Comments_table

###association

* comments belongs_to user
* comments belongs_to project

###column

* t.integer :id
* t.text :comment
* t.references :user_id
* t.references :project_id

##Likes_table

###association

* like belongs_to :user
* like belongs_to :project

###column

* t.integer :id
* t.references :user_id
* t.references :project_id
