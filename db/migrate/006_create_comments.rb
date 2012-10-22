Sequel.migration do
  up do
    create_table :comments do
      primary_key :id
      String :subject
      Text :body
      Integer :mod_up
      Integer :mod_down
      Trueclass :enabled
      foreign_key :article_id, :articles
      foreign_key :author_id, :accounts
    end
  end

  down do
    drop_table :comments
  end
end
