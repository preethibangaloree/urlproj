class CreateUrlls < ActiveRecord::Migration[7.0]
  def change
    create_table :urlls do |t|
      t.string :long_url
      t.string :short_url

      t.timestamps
    end
  end
end
