class Match < ActiveRecord::Base
  attr_accessible :sender_id, :sender_status, :receiver_id, :receiver_status, :sender, :receiver

  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  scope :by_ids, lambda { |ids| where('id in (?)', ids) }
  scope :positive, where("(sender_status = 'Yes' or sender_status = 'Maybe') and (receiver_status = 'Yes' or receiver_status = 'Maybe')")
  scope :find_inverse, lambda { |match| where(:sender_id => match.receiver_id, :receiver_id => match.sender_id) }

  after_create :find_consilience

  delegate :full_name, :to => :sender, :prefix => true
  delegate :full_name, :to => :receiver, :prefix => true

  STATUSES = { 
    '1' => 'Yes',
    '2' => 'No',
    '3' => 'Maybe'
  }


  class << self
    def status_name(key)
      STATUSES[key]
    end

    def send_new(sender, receiver, status_id)
      match = self.create(:sender_status => Match.status_name(status_id),
                          :sender => sender,
                          :receiver => receiver)
    end

    def respond_to_match(match, status_id)
      match.update_attributes(:receiver_status => Match.status_name(status_id))
    end
  end

  def find_consilience
    ids = sender.received_matches.pluck(:id)
    already_received = Match.by_ids(ids).find_by_sender_id(receiver_id)
    if already_received
      already_received.update_attributes(:receiver_status => sender_status)
      update_attributes(:receiver_status => already_received.sender_status)
    end
  end
end
