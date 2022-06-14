class Role < ActiveRecord::Base
  has_many :auditions

    def actors
      self.auditons.map do |audition|
        audition.actor
    end
  end

  def locations
    self.auditons.map do |audition|
        audition.location
    end
  end

  def lead
    if self.auditions.where(hired: true).first.nil?
      return "no actor has been hired for this role"
  end

      def understudy
        if self.auditions.where(hired: true).second.nil?
          return "no actor has been hired for the understudy of this role"
        else
      self.auditions.where(hired: true).second
    end
  end
end
