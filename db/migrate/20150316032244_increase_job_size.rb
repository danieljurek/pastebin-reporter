class IncreaseJobSize < ActiveRecord::Migration
  def change
  	change_column :delayed_jobs, :handler, :text, limit: 16777215
  end
end
