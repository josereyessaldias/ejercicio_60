# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.destroy_all
User.destroy_all
Activity.destroy_all
Collection.destroy_all
AdminUser.destroy_all
ActivityCollection.destroy_all


require 'csv'

noti = []

def abrir_seed(seed,base)
	archivo = File.open(Rails.root.join('lib',seed), 'r:iso-8859-1')
	notas = archivo.readlines
	archivo.close

	noti = []
	notas.each do |i|
		noti << i.split(",")
	end

	noti.each do |i|
		i[-1].delete!("\n")
	end

	if base == Category
		noti.each do |i|
			base.create(name:i[0].to_s,past:i[1].to_s,sustantivo:i[2].to_s,participio:i[3].to_s,futuro:i[4].to_s)		
		end
	elsif base == User
		noti.each do |i|
			base.create(name:i[0].to_s,email:i[1].to_s,password:i[2].to_s,remote_photo_url:i[3].to_s)		
		end

	elsif base == Collection
		noti.each do |i|
			base.create(name:i[0].to_s,remote_photo_url:i[1].to_s,owner_id:i[2].to_i)		
		end

	elsif base == Activity
		noti.each do |i|
			base.create(name:i[0].to_s,owner_id:i[2].to_i,category_id:i[3].to_i,remote_photo_url:i[4].to_s,latitude:i[5].to_f,longitude:i[6].to_f)		
		end

	elsif base == ActivityCollection
		noti.each do |i|
			base.create(activity_id:i[0].to_i,collection_id:i[1].to_i)		
		end
	end
		
end



abrir_seed('category_seed.csv',Category)
abrir_seed('user_seed.csv',User)
abrir_seed('collection_seed.csv',Collection)
abrir_seed('activity_seed.csv',Activity)
abrir_seed('activity_collection_seed.csv',ActivityCollection)


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password',role:'admin')

