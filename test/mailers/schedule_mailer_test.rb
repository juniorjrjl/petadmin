require 'test_helper'

class ScheduleMailerTest < ActionMailer::TestCase
  test "notity_client" do
    mail = ScheduleMailer.notity_client
    assert_equal "Notity client", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
