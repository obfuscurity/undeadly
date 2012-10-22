class Comment < Sequel::Model

  many_to_one :articles
  one_to_one :accounts, :key => :author_id

end
