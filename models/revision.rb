class Revision < Sequel::Model

  many_to_one :articles
  many_to_one :accounts, :key => :author_id

end
