class RenameMunicipalityColumnToResidences < ActiveRecord::Migration[6.0]
  def change
    rename_column :residences, :municipality, :city
  end
end
