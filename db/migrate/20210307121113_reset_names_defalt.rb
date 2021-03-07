class ResetNamesDefalt < ActiveRecord::Migration[6.1]
  def change
    change_column_default :governs, :namespace_identifier, nil
    change_column_default :name_spaces, :identifier, nil
    change_column_default :rules, :namespace_identifier, nil
  end
end
