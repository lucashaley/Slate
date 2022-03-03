require 'application_system_test_case'

class RealmsTest < ApplicationSystemTestCase
  setup do
    @realm = realms(:one)
  end

  test 'visiting the index' do
    visit realms_url
    assert_selector 'h1', text: 'Realms'
  end

  test 'should create realm' do
    visit realms_url
    click_on 'New realm'

    fill_in 'Color', with: @realm.color
    fill_in 'Title', with: @realm.title
    click_on 'Create Realm'

    assert_text 'Realm was successfully created'
    click_on 'Back'
  end

  test 'should update Realm' do
    visit realm_url(@realm)
    click_on 'Edit this realm', match: :first

    fill_in 'Color', with: @realm.color
    fill_in 'Title', with: @realm.title
    click_on 'Update Realm'

    assert_text 'Realm was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Realm' do
    visit realm_url(@realm)
    click_on 'Destroy this realm', match: :first

    assert_text 'Realm was successfully destroyed'
  end
end
