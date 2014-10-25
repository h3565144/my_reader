class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text       :text,      null: false, index: true
      t.belongs_to :channel, null: false, index: true

      t.timestamps
    end
  end
end
