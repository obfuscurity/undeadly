class Topic < Sequel::Model

  one_to_many :articles

end
