# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.integer :kilometer
      t.boolean :is_open, default: false
      t.string :text
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
