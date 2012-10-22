Sequel.migration do
  up do
    create_table :articles do
      primary_key :id
      Trueclass :enabled
      Trueclass :published
      DateTime :publish_at
      DateTime :published_at
      foreign_key :revision_id, :revisions
      foreign_key :state_id, :states
    end
  end

  down do
    drop_table :articles
  end
end
