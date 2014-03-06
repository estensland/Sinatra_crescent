class CreateEthnicIdentities < ActiveRecord::Migration
  def change
    create_table :ethnic_identities do |t|

      t.timestamps
    end
  end
end
