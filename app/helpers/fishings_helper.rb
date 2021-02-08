module FishingsHelper
  
  def fishing_errors
    return unless @fishing.errors.any?

    @fishing.errors.full_messages.each do |msg|
      if msg.include?('Title')
        @fclass1 = 'border border-danger'
      elsif msg.include?('Text')
        @fclass2 = 'border border-danger'
      end
    end
  end
end
