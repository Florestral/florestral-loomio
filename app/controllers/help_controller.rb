class HelpController < ApplicationController
  skip_before_action :verify_authenticity_token

  def markdown
    render layout: false
  end

  def api
    render layout: 'basic'
  end

  def api2
    current_user.save if current_user.api_key_changed?
    @group_id = params[:group_id] || 123
    @api_key = current_user.api_key
    render layout: 'basic'
  end

  def api3
    render layout: 'basic'
  end
end
