module UsersHelper

  def user_errors
    return unless @user.errors.any?

    @user.errors.full_messages.each do |msg|
      if msg.include?('Name')
        @uclas1 = 'border border-danger'
      end
    end
  end

end
