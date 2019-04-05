class CreateLandmarks < ActiveRecord::Migration
  #raise 'Write CreateLandmarks migration here'
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :year_completed
      t.references :figure
    end
  end
end
