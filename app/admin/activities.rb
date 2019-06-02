ActiveAdmin.register Activity do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	controller do
		def scoped_collection
			end_of_association_chain.includes(:category,:user)
		end
	end

	permit_params :name, :author, :category, :user

	filter :users
	filter :collections
	filter :name

	index do
		column :id
		column :name
		column :author
		column :created_at
		column :category
		column :user
		actions
	end

	form do |f|
		inputs 'Agregar una nueva actividad' do
			input :name
			input :author
			input :category
			input :user
			input :latitude
			input :longitude
		end
		actions
	end

end
