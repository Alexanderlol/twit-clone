require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
  	ActionMailer::Base.deliveries.clear
  	@user = users(:alex)
  end
  	
  test "password resets" do
  	get new_password_reset_path
  	assert_template 'password_resets/new'
  	#Invalid Email
  	post password_resets_path, params: { password_reset: { email: ""} }
  	assert_not flash.empty?
  	assert_template 'password_resets/new'
  	#Valid email
  	post password_resets_path, params: { password_reset: { email: @user.email } }
  	assert_not_equal @user.reset_digest, @user.reload.reset_digest
  	assert_equal 1, ActionMailer::Base.deliveries.size
  	assert_not flash.empty?
  	assert_redirected_to root_url
  	#password reset form
  	user = assigns(:user)
  	#Wrong Email
  	get edit_password_reset_path(user.reset_token, email:"")
  	assert_redirected_to root_url
  	#inactive user
  	user.toggle!(:activated)
  	get edit_password_reset_path(user.reset_token, email: user.email)
  	assert_redirected_to root_url
  	user.toggle!(:activated)
  	#right email, wrong token
  	get edit_password_reset_path('wrong token', email: user.email)
  	assert_redirected_to root_url
  	#right email, right token
  	get edit_password_reset_path(user.reset_token, email: user.email)
  	assert_template 'password_resets/edit'
  	assert_select "input[name=email][type=hidden][value=?]", user.email
  	#invalid password & confirmation
  	patch password_reset_path(user.reset_token),
  				params: { email: user.email,
  									user: { password:              "foobaz",
  													password_confirmation: "barquux" } }
  	assert_select 'div#error_explanation'
  	#Empty Password
  	patch password_reset_path(user.reset_token),
  				params: { email: user.email,
  									user: { password:              "",
  													password_confirmation: "" } }
  	assert_select 'div#error_explanation'
  	#valid password & confirmation
  	patch password_reset_path(user.reset_token),
  				params: { email: user.email,
  									user: { password:              "foobaz",
  													password_confirmation: "foobaz" } }
  	assert is_logged_in?
  	assert_not flash.empty?
  	assert_redirected_to user
  end
end
