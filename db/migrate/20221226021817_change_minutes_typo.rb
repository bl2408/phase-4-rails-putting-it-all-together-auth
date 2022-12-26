class ChangeMinutesTypo < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :mintues_to_complete, :minutes_to_complete
  end
end
