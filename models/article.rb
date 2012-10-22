class Article < Sequel::Model

  plugin :validation_helpers

  one_to_many :comments
  one_to_many :revisions
  many_to_one :states

  def validate
  end

end
