class AddPublicEmailToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :public_email, :boolean, default:true
  end
end
