class User < ApplicationRecord
  after_save :send_pin!, if: :phone_changed?

  def reset_pin!
    self.update_column(:pin, rand(1000..9999))
  end

  def unverify!
    self.update_column(:verified, false)
  end

  def send_pin!
    reset_pin!
    unverify!
    SendPinJob.perform_later(self)
  end
end
