class AddShortenedToUrlls < ActiveRecord::Migration[7.0]
  def change
    add_column :urlls, :shortened, :string
    add_index :urlls, :shortened
  end
end
