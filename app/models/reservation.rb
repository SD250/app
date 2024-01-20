class Reservation < ApplicationRecord
belongs_to :desk
 belongs_to :user
 class Reservation < ApplicationRecord
  belongs_to :desk
  belongs_to :user

  # Walidacja obecności i istnienia desk_id
  validates :desk_id, presence: true
  validate :desk_must_exist

  # Walidacja obecności i istnienia user_id
  validates :user_id, presence: true
  validate :user_must_exist

  # Walidacja obecności i chronologii dat
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :no_overlap

  private

  def desk_must_exist
    errors.add(:desk_id, "nie istnieje") unless Desk.exists?(self.desk_id)
  end

  def user_must_exist
    errors.add(:user_id, "nie istnieje") unless User.exists?(self.user_id)
  end

  def end_date_after_start_date
    return if end_date.blank?  start_date.blank?
    errors.add(:end_date, "musi być po dacie rozpoczęcia") if end_date < start_date
  end

  def no_overlap
    return if start_date.blank?  end_date.blank?

    overlapping_reservation = Reservation.where(desk_id: self.desk_id)
                                         .where.not(id: self.id)
                                         .where("start_date < ? AND end_date > ?", self.end_date, self.start_date)
                                         .exists?
    errors.add(:base, "termin rezerwacji nakłada się na inny") if overlapping_reservation
  end
end
