class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
    	t.text :content
    	t.text :top3
      t.timestamps
    end
  end
end
