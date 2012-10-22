Sequel.migration do
  up do
    create_table :revisions do
      primary_key :id
      Subject :string
      Body :text
      String :department
      String :old_sid
      DateTime :created_at
      foreign_key :article_id, :articles
      foreign_key :author_id, :accounts
    end
  end

  down do
    drop_table :revisions
  end
end
