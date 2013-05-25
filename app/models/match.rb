class Match < ActiveRecord::Base
  attr_accessible :sender_id, :sender_status, :receiver_id, :receiver_status

  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  scope :by_ids, lambda { |ids| where('id in (?)', ids) }

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
      match = self.create(:sender_status => Match.status_name(status_id))
      sender.sent_matches << match
      receiver.received_matches << match
    end

    def respond_to_match(match, status_id)
      match.update_attributes(:receiver_status => Match.status_name(status_id))
    end
  end
end
