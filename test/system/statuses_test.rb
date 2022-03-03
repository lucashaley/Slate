require 'application_system_test_case'

class StatusesTest < ApplicationSystemTestCase
  setup do
    @status = statuses(:one)
  end

  test 'visiting the index' do
    visit statuses_url
    assert_selector 'h1', text: 'Statuses'
  end

  test 'should create status' do
    visit statuses_url
    click_on 'New status'

    fill_in 'Color', with: @status.color
    fill_in 'Title', with: @status.title
    click_on 'Create Status'

    assert_text 'Status was successfully created'
    click_on 'Back'
  end

  test 'should update Status' do
    visit status_url(@status)
    click_on 'Edit this status', match: :first

    fill_in 'Color', with: @status.color
    fill_in 'Title', with: @status.title
    click_on 'Update Status'

    assert_text 'Status was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Status' do
    visit status_url(@status)
    click_on 'Destroy this status', match: :first

    assert_text 'Status was successfully destroyed'
  end
end
