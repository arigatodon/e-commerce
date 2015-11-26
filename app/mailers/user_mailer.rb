class UserMailer < ApplicationMailer
	default from: 'notifactions@example.com'

	def welcome_email user
		@user = user
		@url = 'www.tienda.com'

		mail(
			to: @user.email,
			subject: 'Bienvenido a la tienda',
			template_path: 'user_mailer',#opcionales
			template_name: 'welcome_email')
	end

end
