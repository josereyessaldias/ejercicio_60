class ContactsController < ApplicationController


	def create
		@contact = Contact.new
		@contact.user_id = current_user.id
		@contact.followed_id = params[:id]
		authorize! :create, @contact
		@contact.save
		redirect_to root_path
	end

	def destroy
		@contact = Contact.where(user_id: current_user.id, followed_id: params[:id]).first
		@contact.destroy
		authorize! :destroy, @contact
		redirect_to root_path
	end
end
