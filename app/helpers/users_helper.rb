module UsersHelper
  def user_errors
    return unless @user.errors.any?

    @user.errors.full_messages.each do |msg|
      @uclas1 = 'border border-danger' if msg.include?('Name')
    end
  end
end