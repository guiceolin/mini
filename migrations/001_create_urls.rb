migration "create urls table" do
  database.create_table :urls do
    primary_key :id
    text        :original
    integer     :count, default: 0
  end
end
