class SalesforceController < ApplicationController
  def callback
    credentials = env["omniauth.auth"]["credentials"]
    session['token'] = credentials["token"]
    session['refresh_token'] = credentials["refresh_token"]
    session['instance_url'] = credentials["instance_url"]
    redirect_to 'http://localhost:3000/salesforce_products/index'
  end

  def failure
    flash[:error] = 'Authorization failure'
    redirect_to 'http://localhost:3000/admin'
end
end
