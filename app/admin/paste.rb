ActiveAdmin.register Paste do

  index do 
    id_column 
    column :pastebin_id 
    column :contents do |item|
      item.contents[0...65]
    end
    column :created_at 
    actions
  end

  show do 
    attributes_table do
      row :pastebin_id 
      row :contents do |item| 
        pre item.contents, style: 'white-space: pre-wrap; font-face: monospace' 
      end
      row :created_at
    end
    active_admin_comments
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
